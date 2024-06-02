part of './bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class OnBack extends NavigationEvent {
  final dynamic argument;
  final String path;

  const OnBack({this.path = '', this.argument});

  @override
  List<Object> get props => [path, argument];
}

class OnGo extends NavigationEvent {
  final dynamic argument;
  final String path;

  const OnGo({this.path = '', this.argument});

  @override
  List<Object> get props => [path, argument];
}

class OnGoAndCleanUntil extends NavigationEvent {
  final dynamic argument;
  final String path;

  const OnGoAndCleanUntil({this.path = '', this.argument});

  @override
  List<Object> get props => [path, argument];
}