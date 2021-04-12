import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/widgets.dart';
import 'package:inseto_id/app/home/home_bloc.dart';
import 'package:inseto_id/app/home/home_widgets.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [Bloc((i) => HomeBloc())];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
