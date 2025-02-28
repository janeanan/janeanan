import 'package:flutter/foundation.dart';
import 'package:janeanan/data/enum.dart';
import 'package:janeanan/model/api/dio_configuration.dart';
import 'package:janeanan/model/list_user.dart';
import 'package:janeanan/model/service/rest_client.dart';
import 'package:janeanan/utill/utills.dart';

class UserListModel extends ChangeNotifier {
  ConnectionStatus _statusListUser = ConnectionStatus.none;
  ConnectionStatus get statusListUser => _statusListUser;

  late ListUser _responseListUser;
  ListUser get responseListUser => _responseListUser;

  Future<void> getListUser(String user) async {
    Utills.checkInternetConnection().then(
      (value) {
        if (value) {
          _statusListUser = ConnectionStatus.loading;
          notifyListeners();
          RestClient(DioConfiguration.getInstance()).apiKey(user).then((value) {
            _responseListUser = value;
            _statusListUser = ConnectionStatus.success;
            notifyListeners();
          });
        } else {
          _statusListUser = ConnectionStatus.noInternet;
          notifyListeners();
        }
      },
    );
  }
}
