import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:government_complaints_system/data/repo/complaint_repo.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/complaint.dart';

part 'complaint_state.dart';

class ComplaintCubit extends Cubit<ComplaintState> {
  final ComplaintRepo complaintRepo;

  ComplaintCubit({required this.complaintRepo})
    : super(ComplaintState.initial());

  Future<void> registerComplaint({
    required int? complaintTypeId,
    required int? agencyId,
    required String description,
    required String location,
    required List<XFile> documents,
    required int? countryId,
    required int? stateId,
    required int? cityId,
  }) async {
    try {
      emit(state.copyWith(status: ComplaintStatus.loading));

      final response = await complaintRepo.registerComplaint(
        complaintTypeId: complaintTypeId,
        agencyId: agencyId,
        description: description,
        location: location,
        documents: documents,
        countryId: countryId,
        stateId: stateId,
        cityId: cityId,
      );

      emit(
        state.copyWith(
          status: ComplaintStatus.loaded,
          error: response["message"],
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ComplaintStatus.error,
          error: "Something went wrong: ${e.toString()}",
        ),
      );
    }
  }
}
