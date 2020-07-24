import 'package:http/http.dart' as http;
import 'package:whatsappclone/src/models/userResponder_model.dart';
import 'package:whatsappclone/src/utils/constants.dart';

class ApiCall {
  Future apiCall() async {
    final response = await http.get(API_URL);
    if (response.statusCode == 200) {
      //print(response.body);
      return userResponseFromJson(response.body);
    } else {
      throw Exception('Error al cargar');
    }
  }
}
