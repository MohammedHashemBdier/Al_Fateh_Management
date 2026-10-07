import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/deduction.dart';
import '../params/get_deductions_params.dart';
import '../repositories/attendance_repository.dart';

class GetDeductionsUseCase
    implements BaseUseCase<List<Deduction>, GetDeductionsParams> {
  final AttendanceRepository _repository;

  const GetDeductionsUseCase(this._repository);

  @override
  Future<Result<List<Deduction>>> call(GetDeductionsParams params) {
    return _repository.getDeductions(userId: params.userId);
  }
}
