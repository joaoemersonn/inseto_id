import 'package:flutter/material.dart';
import 'package:inseto_id/app/catalogo/catalogo_widgets.dart';
import 'package:inseto_id/app/home/home_widgets.dart';
import 'package:inseto_id/app/identificar/identificar_module.dart';

final Map<String, WidgetBuilder> ROTAS = {
  'home': (_) => HomePage(),
  'identificar': (_) => IdentificarModule(),
  'catalogo': (_) => CatalogoPage()
};
