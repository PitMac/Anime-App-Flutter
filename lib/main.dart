import 'dart:io';
import 'package:anime_app/providers/anime_provider.dart';
import 'package:anime_app/providers/dark_theme_provider.dart';
import 'package:anime_app/screens/detail/anime_detail_screen.dart';
import 'package:anime_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AnimeProvider()),
        ChangeNotifierProvider(create: (_) => ChangeTheme()),
      ],
      child: Builder(builder: (context) {
        final themeProvider = Provider.of<ChangeTheme>(context);
        return MaterialApp(
          theme: themeProvider.isDarkTheme ? darkTheme() : lightTheme(),
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          routes: {
            '/': (_) => const HomeScreen(),
            '/detail': (_) => const AnimeDetailScreen(),
          },
        );
      }),
    );
  }
}
