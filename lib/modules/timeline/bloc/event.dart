part of './bloc.dart';

abstract class TimelineEvent extends Equatable {
  const TimelineEvent();

  @override
  List<Object> get props => [];
}

class SetSelectTimelineEvent extends TimelineEvent {
  final DateTime selected, focused;

  const SetSelectTimelineEvent(this.selected, this.focused);

  @override
  List<Object> get props => [selected, focused];
}

class SetPageTimelineEvent extends TimelineEvent {
  final DateTime focused;

  const SetPageTimelineEvent(this.focused);

  @override
  List<Object> get props => [focused];
}
