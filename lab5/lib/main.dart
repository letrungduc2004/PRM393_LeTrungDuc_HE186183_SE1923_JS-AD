import 'package:flutter/material.dart';
import 'router/app_router.dart';

void main() {
  runApp(
    const ProductApp(),
  );
}

class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      routerConfig: appRouter,
    );
  }
}