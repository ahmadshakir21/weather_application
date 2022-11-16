import 'package:weather_application/api_constant.dart';
import 'package:weather_application/model/weather_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<WeatherModel?> getData() async {
    try {
      var url = Uri.parse(ApiConstant.apiUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        WeatherModel _model = weatherModelFromMap(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
