import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'routes/route_generator.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'providers/favorites_provider.dart';


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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Best Skincare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink, fontFamily: 'Roboto'),
      initialRoute: AppRoutes.home,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
