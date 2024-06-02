part of './bloc.dart';

enum TimelineStatus { loading, success, failure }

class TimelineState extends Equatable {
  final DateTime selected, focused, first, last;
  final TimelineStatus status;
 
  TimelineState({
    DateTime? inselected,
    DateTime? infocused,
    DateTime? infirst,
    DateTime? inlast,
    this.status = TimelineStatus.loading
  }) :
      selected = inselected ?? DateTime.now(),
      focused = infocused ?? DateTime.now(),
      first = infirst ?? DateTime.now().subtract(const Duration(days: 1000)),
      last = inlast ?? DateTime.now().add(const Duration(days: 1000));

  TimelineState copyWith({
    DateTime? selected, focused, first, last,
    TimelineStatus? status
  }) => TimelineState(
    inselected: selected ?? this.selected,
    infocused: focused ?? this.focused,
    infirst: first ?? this.first,
    inlast: last ?? this.last,
    status: status ?? this.status
  );
  
  @override
  List<Object?> get props => [selected, focused, first, last, status];
}
