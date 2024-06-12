import 'package:json_annotation/json_annotation.dart';
import 'package:student_management_starter/features/batch/data/model/batch_api_model.dart';

part 'get_all_batch_dto.g.dart';

@JsonSerializable()
class GetAllBatchDTO {
  final bool success;
  final int count;
  final List<BatchApiModel> data;

  GetAllBatchDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllBatchDTOToJson(this);

  factory GetAllBatchDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllBatchDTOFromJson(json);
}



// dart run build_runner build -d 