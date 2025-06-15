import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'api.dart';
import 'package:tp3/themes/themes_config.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final Api api = Api();

  @override
  State<MyApp> createState() => _MyAppState(); 
  }

  class _MyAppState extends State<MyApp>{
    bool isDarkMode = false;

    void toogleTheme(){
      setState((){
        isDarkMode = !isDarkMode;
      });
    }

    @override
    Widget build(BuildContext context){
      return MaterialApp(
        title: 'FilmVibe',
        darkTheme: ThemeConfig.darkTheme,
      ),
  }
  }
}