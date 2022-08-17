import 'package:flutter/material.dart';
import 'package:graficos_app/components/routes.dart';
import 'package:graficos_app/constants/constants.dart';
import 'package:graficos_app/view/graph/graph.dart';
import 'package:graficos_app/view/homepage/home_page.dart';

void main() {
  runApp(const MyApp());
}

FormController formController = FormController();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gráfico de Onda Modular',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
      routes: {Rotas.APP_GRAPHS: ((_) => const Graphs())},
    );
  }
}
