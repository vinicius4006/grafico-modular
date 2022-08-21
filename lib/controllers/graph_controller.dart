import 'package:graficos_app/constants/graph_interface.dart';
import 'package:graficos_app/model/binario.dart';

class Manchester implements GraficoModular {
  static List<Binario> gerarGraficoModular(String text) {
    List<Binario> chartData = [];
    int count = 0;

    final List<int> listaInt = text.split('').map((e) => int.parse(e)).toList();
    for (int element in listaInt) {
      if (element == 1) {
        chartData.add(Binario(count * 2, -1));
        chartData.add(Binario((count * 2) + 1, -1));
        chartData.add(Binario((count * 2) + 1, 1));
        chartData.add(Binario(2 * (count + 1), 1));
      } else {
        chartData.add(Binario((count * 2), 1));
        chartData.add(Binario((count * 2) + 1, 1));
        chartData.add(Binario((count * 2) + 1, -1));
        chartData.add(Binario((count * 2) + 2, -1));
      }
      count++;
    }

    return chartData;
  }
}

class PAM5 implements GraficoModular {
  static List<Binario> gerarGraficoModular(String text) {
    List<Binario> chartData = [];

    List<int> listaT = [];
    final List<int> listaInt = text.split('').map((e) => int.parse(e)).toList();
    int count = 0;
    int yCount = 0;
    if (listaInt.length % 2 != 0) {
      return [];
    } else {
      listaInt.add(0);
      for (int element in listaInt) {
        if (listaT.length == 2) {
          if (listaT.first + listaT.last == 0) {
            yCount = -2;
            chartData.add(Binario(count, -2));
          } else if (listaT.first + listaT.last == 2) {
            yCount = 2;
            chartData.add(Binario(count, 2));
          } else if (listaT.first == 1) {
            yCount = 1;
            chartData.add(Binario(count, 1));
          } else {
            yCount = -1;
            chartData.add(Binario(count, -1));
          }
          listaT.clear();
        }

        listaT.add(element);
        count++;
      }
      chartData.add(Binario(count, yCount));
      return chartData;
    }
  }
}

class B45B implements GraficoModular {
  static List<Binario> gerarGraficoModular(String text) {
    List<Binario> chartData = [];

    final List<int> listaInt = text.split('').map((e) => int.parse(e)).toList();

    bool changePolo = false;
    chartData.add(Binario(1, 0));
    chartData.add(Binario(2, 0));

    for (int element in listaInt) {
      if (element == 0) {
        chartData
            .add(Binario(chartData.last.first! + 1, chartData.last.second));
      } else if (chartData.last.second! == 0) {
        chartData.add(Binario(chartData.last.first!, changePolo ? 1 : -1));
        chartData.add(Binario(chartData.last.first! + 1, changePolo ? 1 : -1));
        changePolo = !changePolo;
      } else {
        chartData.add(Binario(chartData.last.first!, 0));
        chartData.add(Binario(chartData.last.first! + 1, 0));
      }
    }

    return chartData;
  }
}
