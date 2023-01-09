// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:learn_flutter_amc/ui/features/account/login/login_screen.dart';
import 'package:learn_flutter_amc/ui/features/home/home_content_screen.dart';
import 'package:learn_flutter_amc/ui/features/home/home_screen.dart';
import 'package:learn_flutter_amc/ui/features/products/product_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginScreen, initial: true),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: ProductPage),
    AutoRoute(page: HomeContentScreen),
  ],
)
class $AppRouter {}
