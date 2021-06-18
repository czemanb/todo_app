import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/auth/auth_bloc.dart';
import 'package:todo_app/presentation/routes/router.gr.dart';

import '../../injection.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<AppWidget> {
  final _rootRouter = RootRouter();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        )
      ],
      child: MaterialApp.router(
        routerDelegate: AutoRouterDelegate(
          _rootRouter,
          navigatorObservers: () => [AutoRouterObserver()],
        ),
        routeInformationParser: _rootRouter.defaultRouteParser(),
        title: 'Domain Driven Development',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.orange[800],
          accentColor: Colors.orangeAccent,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}