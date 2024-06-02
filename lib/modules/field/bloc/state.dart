part of './bloc.dart';

enum FieldStatus { loading, success, failure, detail }

class FieldState extends Equatable {
  final FieldStatus status;
  final String first, last, test, simplo, duplo, flat, rdp, note, actual, verify;
  final int range, quality, quantity, flow;
  final WoMemberModel member;
  final WoTestParameterModel detail;

  const FieldState({
    this.status = FieldStatus.loading,
    this.first = '',
    this.last = '',
    this.test = '',
    this.simplo = '',
    this.duplo = '',
    this.flat = '',
    this.rdp = '',
    this.note = '',
    this.actual = '',
    this.verify = 'Terverifikasi',
    this.range = 0,
    this.quality = 0,
    this.quantity = 0,
    this.flow = 0,
    this.member = const WoMemberModel(),
    this.detail = const WoTestParameterModel()
  });

  FieldState copyWith({
    FieldStatus? status,
    String? first, last, test, simplo, duplo, flat, rdp, note, actual, verify,
    int? range, quality, quantity, flow,
    WoMemberModel? member,
    WoTestParameterModel? detail,
  }) => FieldState(
    status: status ?? this.status,
    first: first ?? this.first,
    last: last ?? this.last,
    test: test ?? this.test,
    simplo: simplo ?? this.simplo,
    duplo: duplo ?? this.duplo,
    flat: flat ?? this.flat,
    rdp: rdp ?? this.rdp,
    note: note ?? this.note,
    actual: actual ?? this.actual,
    verify: verify ?? this.verify,
    range: range ?? this.range,
    quality: quality ?? this.quality,
    quantity: quantity ?? this.quantity,
    flow: flow ?? this.flow,
    member: member ?? this.member,
    detail: detail ?? this.detail
  );

  @override
  List<Object> get props => [status, first, last, test, simplo, duplo, flat, rdp, note, actual, verify, range, quality, quantity, flow, member, detail];
}
