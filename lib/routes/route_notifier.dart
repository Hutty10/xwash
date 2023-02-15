import 'dart:async';

import 'package:flutter/material.dart'
    show Listenable, VoidCallback, BuildContext;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import './route_imports.dart';
import '../routes/route_names.dart';

class RouterNotifier extends AutoDisposeAsyncNotifier<void>
    implements Listenable {
  VoidCallback? routerListener;
  bool isAuth = false;

  @override
  FutureOr<void> build() async {
    //TODO add logic to watch isAuth
    ref.listenSelf((previous, next) {
      if (state.isLoading) return;
      routerListener?.call();
    });
  }

  @override
  void removeListener(VoidCallback listener) {
    routerListener = listener;
  }

  @override
  void addListener(VoidCallback listener) {
    routerListener = null;
  }

  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return null;
  }

  List<GoRoute> routes = <GoRoute>[
    GoRoute(
      name: RouteName.getStarted,
      path: RouteName.getStarted.toPath(),
      builder: (context, state) => const GetStartedScreen(),
    ),
    GoRoute(
      name: RouteName.signup,
      path: RouteName.signup.toPath(),
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      name: RouteName.home,
      path: RouteName.home.toPath(),
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: RouteName.profile,
      path: RouteName.profile.toPath(),
      builder: (context, state) => const ProfileScreen(),
    ),
  ];
}

final routerNotifierProvider =
    AutoDisposeAsyncNotifierProvider<RouterNotifier, void>(() {
  return RouterNotifier();
});

extension RouteNameToPath on String {
  String toPath() => '/$this';
}
