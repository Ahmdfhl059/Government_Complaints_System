import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


import '../../data/models/citizen.dart';
import '../../data/repo/user_repo.dart';
import '../../utils/secure_storage.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepo userRepo;

  UserCubit({required this.userRepo}) : super(UserState.initial()) ;

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      emit(state.copyWith(status: UserStatus.loading));

      final response = await userRepo.userLogin(
        email: email,
        password: password,
      );
      if (response["data"]["token"] != null) {
        // Store the token securely
        await SecureStorage.storeToken(response["data"]["token"]);
        print(response["data"]["token"]);
        emit(
          state.copyWith(
            status: UserStatus.loaded,
            user: Citizen(
              email: response["data"]["citizen"]["email"],
              firstName: '',
              lastName: '',
              phone: '',
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: UserStatus.error,
            error: response["message"] ?? "Login failed",
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: UserStatus.error,
          error: "Something went wrong: ${e.toString()}",
        ),
      );
    }
  }

  Future<void> userRegister({
    required String email,
    required String password,
    required String confirmPassword,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    try {
      emit(state.copyWith(status: UserStatus.loading));
      final response = await userRepo.userRegister(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
      );
      if (response["data"]["token"] != null) {
        // Store the token securely
        await SecureStorage.storeToken(response["data"]["token"]);
        print(response["data"]["token"]);
      emit(
        state.copyWith(
          status: UserStatus.loaded,
          error: response["message"] ?? "The email has already been taken.",
        ),
      );
    } else {
        emit(
          state.copyWith(
            status: UserStatus.error,
            error: response["message"],
          ),
        );
      }
    }catch (e) {
      emit(
        state.copyWith(
          status: UserStatus.error,
          error: "Something went wrong: ${e.toString()}",
        ),
      );
    }
  }

  Future<void> studentForgotPassword({
    required String email,
    required String code,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      emit(state.copyWith(status: UserStatus.loading));

      final response = await userRepo.forgotPassword(
        email: email,
        code: code,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      emit(
        state.copyWith(
          status: UserStatus.loaded,
          error: response["message"] ?? "forgotPassword failed",
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: UserStatus.error,
          error: "forgotPassword failed: ${e.toString()}",
        ),
      );
    }
  }

  Future<void> userVerify({
    required String verificationCode,
  }) async {
    try {
      emit(state.copyWith(status: UserStatus.loading));

      final response = await userRepo.userVerify(
        verificationCode: verificationCode,
      );
      emit(
        state.copyWith(
          status: UserStatus.loaded,
          error: response["message"] ?? "verification code failed",
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: UserStatus.error,
          error: "verification Code failed: ${e.toString()}",
        ),
      );
    }
  }



  Future<void> resendUserVerify() async {
    try {
      emit(state.copyWith(status: UserStatus.loading));

      final response = await userRepo.resendUserVerify(
      );
      emit(
        state.copyWith(
          status: UserStatus.loaded,
          error: response["message"] ?? "verification code failed",
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: UserStatus.error,
          error: "verification Code failed: ${e.toString()}",
        ),
      );
    }
  }

  Future<void> userResendVerificationCode({required String email}) async {
    try {
      emit(state.copyWith(status: UserStatus.loading));

      final response = await userRepo.resendVerificationCode(email: email);
      emit(
        state.copyWith(
          status: UserStatus.loaded,
          error: response["message"] ?? "resend verification code failed",
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: UserStatus.error,
          error: "resend verification code  failed: ${e.toString()}",
        ),
      );
    }
  }

  Future<void> studentLogout() async {
    try {
      emit(state.copyWith(status: UserStatus.loading));

      await userRepo.studentLogout();

      // بعد نجاح تسجيل الخروج امسح التوكن
      await SecureStorage.removeToken();

      emit(UserState.initial()); // reset state to initial
    } catch (e) {
      emit(
        state.copyWith(
          status: UserStatus.error,
          error: "Logout failed: ${e.toString()}",
        ),
      );
    }
  }

  Future<void> showStudentProfile() async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final Citizen user = await userRepo.showStudentProfile();
      emit(state.copyWith(status: UserStatus.loaded, user: user));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error, error: e.toString()));
    }
  }

  Future<void> updateStudentProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String birthday,
    XFile? image,
  }) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final response = await userRepo.updateStudentProfile(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        birthday: birthday,
        image: image,
      );
      emit(
        state.copyWith(
          status: UserStatus.loaded,
          user: Citizen(
            email: response["user"]["email"],
            firstName: response["user"]["first_name"],
            lastName: response["user"]["last_name"],
            phone: '',
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error, error: e.toString()));
    }
  }
}
