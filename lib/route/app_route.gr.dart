// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../ui/features/account/login/login_screen.dart' as _i1;
import '../ui/features/home/home_content_screen.dart' as _i4;
import '../ui/features/home/home_screen.dart' as _i2;
import '../ui/features/products/product_screen.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginScreen(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>(
          orElse: () => const ProductRouteArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ProductPage(
          key: args.key,
          productId: args.productId,
          id: args.id,
          name: args.name,
        ),
      );
    },
    HomeContentScreen.name: (routeData) {
      final args = routeData.argsAs<HomeContentScreenArgs>(
          orElse: () => const HomeContentScreenArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.HomeContentScreen(
          key: args.key,
          user: args.user,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          LoginScreen.name,
          path: '/',
        ),
        _i5.RouteConfig(
          HomeScreen.name,
          path: '/home-screen',
        ),
        _i5.RouteConfig(
          ProductRoute.name,
          path: '/product-page',
        ),
        _i5.RouteConfig(
          HomeContentScreen.name,
          path: '/home-content-screen',
        ),
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginScreen extends _i5.PageRouteInfo<void> {
  const LoginScreen()
      : super(
          LoginScreen.name,
          path: '/',
        );

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreen extends _i5.PageRouteInfo<void> {
  const HomeScreen()
      : super(
          HomeScreen.name,
          path: '/home-screen',
        );

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i3.ProductPage]
class ProductRoute extends _i5.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i6.Key? key,
    String? productId,
    int? id,
    String? name,
  }) : super(
          ProductRoute.name,
          path: '/product-page',
          args: ProductRouteArgs(
            key: key,
            productId: productId,
            id: id,
            name: name,
          ),
        );

  static const String name = 'ProductRoute';
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    this.productId,
    this.id,
    this.name,
  });

  final _i6.Key? key;

  final String? productId;

  final int? id;

  final String? name;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, productId: $productId, id: $id, name: $name}';
  }
}

/// generated route for
/// [_i4.HomeContentScreen]
class HomeContentScreen extends _i5.PageRouteInfo<HomeContentScreenArgs> {
  HomeContentScreen({
    _i6.Key? key,
    dynamic user,
  }) : super(
          HomeContentScreen.name,
          path: '/home-content-screen',
          args: HomeContentScreenArgs(
            key: key,
            user: user,
          ),
        );

  static const String name = 'HomeContentScreen';
}

class HomeContentScreenArgs {
  const HomeContentScreenArgs({
    this.key,
    this.user,
  });

  final _i6.Key? key;

  final dynamic user;

  @override
  String toString() {
    return 'HomeContentScreenArgs{key: $key, user: $user}';
  }
}
