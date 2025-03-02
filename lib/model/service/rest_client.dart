import 'package:dio/dio.dart';

import 'package:janeanan/model/api/apis.dart';
import 'package:janeanan/model/list_laptop.dart';
import 'package:janeanan/model/list_user.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: Apis.baseService)
abstract class RestClient {
  factory RestClient(Dio dio,{String baseUrl}) = _RestClient;

  @GET(Apis.api)
  Future<ListUser> apiKey(
    @Query('results') String results,
  );
  
  @GET(Apis.laptops)
  Future<ListLaptops> getListLaptop(
  );
}
