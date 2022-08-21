import 'package:flutter/material.dart';
import 'package:graficos_app/controllers/graph_controller.dart';
import 'package:graficos_app/main.dart';
import 'package:graficos_app/model/binario.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graphs extends StatefulWidget {
  const Graphs({Key? key}) : super(key: key);

  @override
  State<Graphs> createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  late List<Binario> _chartBinarioManchester;
  late List<Binario> _chartBinarioPAM5;
  late List<Binario> _chartBinario4B5B;
  @override
  void initState() {
    _chartBinarioManchester =
        Manchester.gerarGraficoModular(formController.textField);
    _chartBinarioPAM5 = PAM5.gerarGraficoModular(formController.textField);
    _chartBinario4B5B = B45B.gerarGraficoModular(formController.textField);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gráficos Modulares',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text('Manchester',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(
              formController.textField,
              style: const TextStyle(fontSize: 24),
            ),
            SfCartesianChart(
              series: <StepLineSeries>[
                StepLineSeries<Binario, int>(
                    dataSource: _chartBinarioManchester,
                    xValueMapper: (Binario binario, _) => binario.first,
                    yValueMapper: (Binario binario, _) => binario.second)
              ],
              primaryYAxis: NumericAxis(labelFormat: '{value}V'),
              primaryXAxis: NumericAxis(labelFormat: '{value}A'),
            ),
            const Text('PAM5',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(
              formController.textField,
              style: const TextStyle(fontSize: 24),
            ),
            SfCartesianChart(
              series: <StepLineSeries>[
                StepLineSeries<Binario, int>(
                    dataSource: _chartBinarioPAM5,
                    xValueMapper: (Binario binario, _) => binario.first,
                    yValueMapper: (Binario binario, _) => binario.second)
              ],
              primaryYAxis: NumericAxis(labelFormat: '{value}V'),
              primaryXAxis: NumericAxis(labelFormat: '{value}A'),
            ),
            const Text('B45B',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(
              formController.textField,
              style: const TextStyle(fontSize: 24),
            ),
            SfCartesianChart(
              series: <StepLineSeries>[
                StepLineSeries<Binario, int>(
                    dataSource: _chartBinario4B5B,
                    xValueMapper: (Binario binario, _) => binario.first,
                    yValueMapper: (Binario binario, _) => binario.second)
              ],
              primaryYAxis: NumericAxis(labelFormat: '{value}V'),
              primaryXAxis: NumericAxis(labelFormat: '{value}A'),
            )
          ],
        ),
      ),
    );
  }
}
