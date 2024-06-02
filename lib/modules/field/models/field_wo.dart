import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class FieldWo extends Equatable {
  final FieldStatus? status;
  final FieldModel? field;

  const FieldWo({this.status, this.field});

  FieldWo copyWith({
    FieldStatus? status,
    FieldModel? field,
  }) => FieldWo(
    status: status ?? this.status,
    field: field ?? this.field
  );

  @override
  List<Object?> get props => [status, field];
}
