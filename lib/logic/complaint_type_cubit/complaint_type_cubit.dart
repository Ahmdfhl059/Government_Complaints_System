import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:government_complaints_system/data/models/complaint_type.dart';
import 'package:government_complaints_system/data/repo/complaint_type_repo.dart';
import 'package:meta/meta.dart';

part 'complaint_type_state.dart';

class ComplaintTypeCubit extends Cubit<ComplaintTypeState> {
  final ComplaintTypeRepo complaintTypeRepo;

  ComplaintTypeCubit({required this.complaintTypeRepo}) : super(ComplaintTypeState.initial()){
    indexComplaintType();
  }

  Future<void> indexComplaintType() async {
    emit(state.copyWith(status: ComplaintTypeStatus.loading));
    try {
      final List<ComplaintType> complaintType = await complaintTypeRepo.indexComplaintType();
      emit(state.copyWith(status: ComplaintTypeStatus.loaded, complaintsType: complaintType));
    } catch (e) {
      emit(state.copyWith(status: ComplaintTypeStatus.error, error: e.toString()));
    }
  }
}
