import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/deduction.dart';
import '../params/add_deduction_params.dart';
import '../repositories/attendance_repository.dart';

class AddDeductionUseCase
    implements BaseUseCase<Deduction, AddDeductionParams> {
  final AttendanceRepository _repository;

  const AddDeductionUseCase(this._repository);

  @override
  Future<Result<Deduction>> call(AddDeductionParams params) {
    return _repository.addDeduction(params);
  }
}
