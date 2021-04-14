import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:inseto_id/app/descricaoInseto/descricao_bloc.dart';
import 'package:inseto_id/app/identificar/identificar_bloc.dart';
import 'package:inseto_id/app/identificar/identificar_widgets.dart';

class IdentificarModule extends ModuleWidget {
  @override
  // TODO: implement blocs
  List<Bloc> get blocs =>
      [Bloc((i) => IdentificarBloc()), Bloc((i) => DescricaoBloc())];

  @override
  // TODO: implement dependencies
  List<Dependency> get dependencies => [];

  @override
  // TODO: implement view
  Widget get view => IdentificarPage();

  static Inject get to => Inject<IdentificarModule>.of();
}
