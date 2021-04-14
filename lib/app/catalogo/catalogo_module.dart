import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:inseto_id/app/catalogo/catalogo_bloc.dart';
import 'package:inseto_id/app/catalogo/catalogo_widgets.dart';

class CatalogoModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [Bloc((i) => CatalogoBloc())];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => CatalogoPage();

  static Inject get to => Inject<CatalogoModule>.of();
}
