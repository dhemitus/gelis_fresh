import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class Blocs {
  static MultiBlocProvider blocsList (Widget child, GlobalKey<NavigatorState> key) {
    return MultiBlocProvider(
      providers: [
        NavigationRoute.bloc(key),
        AuthenticationRoute.bloc,
        CrumbRoute.bloc,
        LoginRoute.bloc,
        LocationRoute.bloc,
        WoListRoute.bloc,
        WoDetailRoute.bloc,
        DataRoute.bloc,
        ImageRoute.bloc,
        FieldRoute.bloc,
        FrontRoute.bloc,
        HistoryRoute.bloc,
        OnGoingRoute.bloc,
        ApproveRoute.bloc,
        CheckRoute.bloc,
        ReportRoute.bloc,
        RevisionRoute.bloc,
        RevisedRoute.bloc,
        SamplingRoute.bloc,
        SupportRoute.bloc,
        TransferRoute.bloc,
        ProcessRoute.bloc,
        PrintRoute.bloc,
        CalendarRoute.bloc,
        TimelineRoute.bloc,
        MenuRoute.bloc
      ],
      child: child
    );
  }

  static MultiRepositoryProvider repoList (Widget child) {
    return MultiRepositoryProvider(
      providers: [
        AuthenticationRoute.repo,
        UserRoute.repo,
        CrumbRoute.repo,
        WoListRoute.repo,
        WoDetailRoute.repo,
        DataRoute.repo,
        FieldRoute.repo,
        FrontRoute.repo,
        HistoryRoute.repo,
        OnGoingRoute.repo,
        ApproveRoute.repo,
        ImageRoute.repo,
        CheckRoute.repo,
        LocationRoute.repo,
        ReportRoute.repo,
        RevisionRoute.repo,
        SamplingRoute.repo,
        SupportRoute.repo,
        TransferRoute.repo,
        ProcessRoute.repo,
        PrintRoute.repo,
        RevisedRoute.repo,
        CalendarRoute.repo,
        MenuRoute.repo
      ],
      child: child
    );
  }
}
