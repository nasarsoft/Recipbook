import '../models/recipe.dart';
import 'http_service.dart';

class DataService {
  static final DataService _singlton = DataService._internal();
  final _HttpService = HttpService();

  factory DataService() {
    return _singlton;
  }

  DataService._internal();

  Future<List<Recipoe>?> getrecipe(String filter) async {
    String path = "recipes/";
    if (filter.isNotEmpty) {
      path += "meal-type/$filter";
    }
    var response = await _HttpService.get(path);
    if (response!.statusCode == 200 && response.data != null) {
      List data = response.data["recipes"];
      List<Recipoe> recipes = data.map((e) => Recipoe.fromJson(e)).toList();
      return recipes;
    }
  }
}