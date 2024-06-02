part of './bloc.dart';

enum CrumbStatus { loading, success, failure, detail }

class CrumbState extends Equatable {
  final CrumbStatus status;
  final List<CrumbItem> menu;
  final CrumbItem crumb;

  const CrumbState({this.status = CrumbStatus.loading, this.menu = const <CrumbItem>[], this.crumb = const CrumbItem()});

  CrumbState copyWith({
    CrumbStatus? status,
    List<CrumbItem>? menu,
    CrumbItem? crumb
  }) => CrumbState(
    status: status ?? this.status,
    menu: menu ?? this.menu,
    crumb: crumb ?? this.crumb
  );
  @override
  List<Object> get props => [status, menu, crumb];
}
