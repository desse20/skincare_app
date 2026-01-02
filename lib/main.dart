import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'routes/route_generator.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'providers/favorites_provider.dart';

import 'models/favorites_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FavoritesModel _favoritesModel = FavoritesModel();
  late final RouteGenerator _routeGenerator;

  @override
  void initState() {
    super.initState();
    _routeGenerator = RouteGenerator(favoritesModel: _favoritesModel);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Best Skincare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink, fontFamily: 'Roboto'),
      initialRoute: AppRoutes.home,
      onGenerateRoute: _routeGenerator.generateRoute,
    );
  }
}
