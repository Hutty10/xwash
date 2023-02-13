import 'package:flutter/material.dart' show GlobalKey,NavigatorState;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';
import 'route_notifier.dart';


final _key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');
final routerProvider = Provider.autoDispose<GoRouter>(
  (ref) {
    final routerNotifier = ref.watch(routerNotifierProvider.notifier);
    return GoRouter(
      navigatorKey: _key,
      initialLocation: RouteName.getStarted.toPath(),
      debugLogDiagnostics: true,
      refreshListenable: routerNotifier,
      redirect: routerNotifier.redirect,
      routes: routerNotifier.routes,
    );
  },
);
