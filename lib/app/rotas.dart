import 'package:flutter/material.dart';
import 'package:inseto_id/app/catalogo/catalogo_module.dart';
import 'package:inseto_id/app/descricaoInseto/descricao_module.dart';
import 'package:inseto_id/app/home/home_widgets.dart';
import 'package:inseto_id/app/identificar/identificar_module.dart';
import 'package:inseto_id/app/sobre/sobre_widgets.dart';

final Map<String, WidgetBuilder> ROTAS = {
  'home': (_) => HomePage(),
  'identificar': (_) => IdentificarModule(),
  'catalogo': (_) => CatalogoModule(),
  'sobre': (_) => SobrePage(),
  'descricaoInseto': (_) => DescricaoModule()
};
