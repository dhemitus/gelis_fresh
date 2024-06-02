import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class WeekTimeline extends StatelessWidget {
  final void Function(DateTime)? onSelect;

  const WeekTimeline({Key? key, this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<TimelineBloc, TimelineState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (BuildContext context, TimelineState state) {
        return CalendarLineContainer(
          selected: state.selected,
          first: state.first,
          last: state.last,
          focused: state.focused,
          onPage: (DateTime f) => context.read<TimelineBloc>().add(SetPageTimelineEvent(f)),
          onSelect: (DateTime s, DateTime f) {
            onSelect?.call(s);
            context.read<TimelineBloc>().add(SetSelectTimelineEvent(s, f));
          },
        );
      }
    );
  }
}
