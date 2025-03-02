import 'package:flutter/material.dart';
import 'package:janeanan/data/enum.dart';
import 'package:janeanan/model/api/dio_configuration.dart';
import 'package:janeanan/model/list_laptop.dart';
import 'package:janeanan/model/service/rest_client.dart';
import 'package:janeanan/utill/utills.dart';

class LaptopListModel extends ChangeNotifier {
  ConnectionStatus _statusListLaptop = ConnectionStatus.none;
  ConnectionStatus get statusListLaptop => _statusListLaptop;

  late ListLaptops _responseListLaptop;
  ListLaptops get responseListLaptop => _responseListLaptop;

  Future<void> getListLaptops() async {
    Utills.checkInternetConnection().then(
      (value) {
        if (value) {
          _statusListLaptop = ConnectionStatus.loading;
          notifyListeners();
          RestClient(DioConfiguration.getInstance())
              .getListLaptop()
              .then((value) {
            _responseListLaptop = value;
            _statusListLaptop = ConnectionStatus.success;
            notifyListeners();
          });
        } else {
          _statusListLaptop = ConnectionStatus.noInternet;
          notifyListeners();
        }
      },
    );
  }
}
