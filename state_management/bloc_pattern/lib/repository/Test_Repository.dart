import 'package:bloc_pattern/Model/Practices.dart';

import '../api/Api_provider.dart';
class Test_Repository{
  final Api_provider api_provider = new Api_provider();
  Future<Practices> data_load() async => await api_provider.get_api_test();
}