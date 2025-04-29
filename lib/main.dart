import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/home/bloc/color_change_bloc.dart';
import 'package:test_project/home/repository/home_repository.dart';
import 'dart:io';
import 'package:test_project/home/ui/pages/home_page.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorChangeBloc(homeRepository: HomeRepository()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ColorChangePage(),
      ),
    );
  }
}
