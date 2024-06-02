part of './bloc.dart';

class NavigationState extends Equatable {
  final dynamic argument;
  final String path;
  final GlobalKey<NavigatorState>? navKey;

  const NavigationState({this.path = '', this.argument = const {}, this.navKey});

  NavigationState copyWith({
    String? path,
    GlobalKey<NavigatorState>? navKey,
    dynamic argument
  }) => NavigationState(
    path: path ?? this.path,
    navKey: navKey ?? this.navKey,
    argument: argument ?? this.argument
  );

  @override
  List<Object?> get props => [path, argument, navKey];
}
