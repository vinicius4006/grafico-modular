import 'package:flutter/material.dart';
import 'package:graficos_app/components/header.dart';
import 'package:graficos_app/components/routes.dart';
import 'package:graficos_app/main.dart';
import 'package:graficos_app/view/homepage/form/textform.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Codificador'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              const SizedBox(
                height: 100,
              ),
              Form(
                  key: formController.formKey,
                  child: Column(
                    children: [
                      TextForm(
                          formController: formController,
                          textController: formController.text,
                          textInputType: TextInputType.number),
                      ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(2),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, Rotas.APP_GRAPHS);
                          },
                          child: const Text('Codificar')),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
