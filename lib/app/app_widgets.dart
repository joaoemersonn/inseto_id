import 'package:flutter/material.dart';
import 'package:inseto_id/app/home/home_module.dart';
import 'package:inseto_id/app/rotas.dart';
import 'package:inseto_id/app/shared/temas.dart';

class MyApp extends StatelessWidget {
  final bool darkmode = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INSETO ID',
      routes: ROTAS,
      debugShowCheckedModeBanner: false,
      theme: darkmode ? TEMAESCURO : TEMACLARO,
      home: HomeModule(),
    );
  }
}
