import 'dart:async';

import 'package:flutter/material.dart' show ChangeNotifier, BuildContext;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import './route_imports.dart';
import '../extensions/on_string.dart';
import '../routes/route_names.dart';
import '../services/auth_service.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  ProviderSubscription? subscription;
  // final _prefs = SharedPreferences.getInstance();
  RouterNotifier(this._ref) {
    subscription = _ref.listen(
      authStateProvider,
      (_, __) => notifyListeners(),
    );
    _ref.onDispose(() {
      subscription?.close();
    });
  }
  @override
  void dispose() {
    subscription?.close();
    super.dispose();
  }

  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final authState = _ref.read(authStateProvider);

    // if (authState.isLoading || authState.hasError) return null;
    final isAuth = authState.valueOrNull != null;
    final isSignup = state.location == RouteName.signup.toPath();
    final isGetStarted = state.location == RouteName.getStarted.toPath();
    if (isSignup || isGetStarted) {
      return isAuth ? RouteName.home.toPath() : null;
    }
    return isAuth ? null : RouteName.getStarted.toPath();
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
