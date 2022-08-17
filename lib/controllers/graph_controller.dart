import 'package:graficos_app/model/binario.dart';

class GraphController {
  static List<Binario> getBinarioManchester(String text) {
    List<Binario> chartData = [];
    int count = 0;
    bool checkOne = true;

    List<int> listaInt = text.split('').map((e) => int.parse(e)).toList();
    checkOne = listaInt.first == 1 ? true : false;

    for (int element in listaInt) {
      if (element == 1 && checkOne) {
        checkOne = false;
        chartData.add(Binario(count, -1));
        chartData.add(Binario(count + 1, 1));
        chartData.add(Binario(count + 2, 1));
      } else if (element == 1) {
        chartData.add(Binario(count * 2, -1));
        chartData.add(Binario((count * 2) + 1, -1));
        chartData.add(Binario((count * 2) + 1, 1));
        chartData.add(Binario(count * 3, 1));
      } else if (element == 0 && !checkOne) {
        checkOne = true;
        chartData.add(Binario(count, 1));
        chartData.add(Binario(count + 1, -1));
        chartData.add(Binario(count + 2, -1));
      } else {
        chartData.add(Binario(count + 2, -1));
      }
      count++;
    }

    return chartData;
  }

  static List<Binario> getBinarioPAM5(String text) {
    List<Binario> chartData = [];

    List<int> listaT = [];
    List<int> listaInt = text.split('').map((e) => int.parse(e)).toList();
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

  static List<Binario> getBinario4B5B(String text) {
    List<Binario> chartData = [];

    List<int> listaInt = text.split('').map((e) => int.parse(e)).toList();
    int count = 0;
    int yCount = 0;
    List<int> listT = [1];
    if (listaInt.length % 2 != 0) {
      return [];
    } else {
      listaInt.add(0);
      for (int element in listaInt) {
        if (element == 1) {
          if (listT.last == element) {
            chartData.add(Binario(count, 0));
          } else {
            chartData.add(Binario(count, 1));
          }
        } else {
          if (listT.last == element) {
            chartData.add(Binario(count, 0));
          } else {
            chartData.add(Binario(count, 1));
          }
        }

        listT.add(element);
        count++;
      }
      chartData.add(Binario(count, yCount));
      return chartData;
    }
  }
}
