import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gelis/modules/modules.dart';
import 'package:gelis/routes.dart';

class AuthenticationScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> navKey;
  const AuthenticationScreen({Key? key, required this.navKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(414, 896),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Gelis Sampling",
          navigatorKey: navKey,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          builder: (context, child) {
            return BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                switch(state.status) {

                  case AuthenticationStatus.unauthenticated:
                    context.read<NavigationBloc>().add(const OnGoAndCleanUntil(path: LoginRoute.path));
                    break;
                  case AuthenticationStatus.authenticated:
                    context.read<NavigationBloc>().add(const OnGoAndCleanUntil(path: HomeRoute.path));
                    break;
                  case AuthenticationStatus.unknown:
                    break;
                }
              },
              child: child,
            );
          },
          routes: Routes.screens,
          onGenerateRoute: (_) => UnknownRoute.route,
        );
      },
    );
  }
}
