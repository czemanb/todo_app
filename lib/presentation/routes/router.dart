import 'package:auto_route/auto_route.dart';
import 'package:todo_app/presentation/sign_in/sign_in_page.dart';
import 'package:todo_app/presentation/splash/spalsh_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SignInPage),
  ],
)
class $RootRouter {}