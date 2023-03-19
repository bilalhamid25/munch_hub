import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:munch_hub/helper/getx_helper.dart';
import 'package:munch_hub/helper/urls.dart';
import 'package:munch_hub/widgets/loader.dart';

class ApiBaseHelper {
  final String _baseUrl = URLs.baseURL;

  Future<dynamic> post({required String url, dynamic body}) async {
    var header = {'Content-Type': 'application/json'};

    body = json.encode(body);

    try {
      var urlValue = Uri.parse(_baseUrl + url);
      final response = await http.post(urlValue, headers: header, body: body);
      log(response.body);
      Map<String, dynamic> parsedJSON = jsonDecode(response.body);
      return parsedJSON;
    } on SocketException {
      Loader.loader.value = false;
      GetxHelper.showSnackBar1(
          title: 'Error', message: "Please check internet connection");
    } on FormatException catch (_) {
      Loader.loader.value = false;
      GetxHelper.showSnackBar1(title: 'Error', message: "Something went wrong");
      throw "Something went wrong";
    } catch (e) {
      Loader.loader.value = false;
      GetxHelper.showSnackBar1(title: 'Error', message: "something went wrong");
      throw e.toString();
    }
  }

  Future<dynamic> get({required String url}) async {
    var header = {'Content-Type': 'application/json'};

    try {
      var urlValue = Uri.parse(_baseUrl + url);
      log(_baseUrl + url);
      final response = await http.get(urlValue, headers: header);
      log('response from server :  ${response.body}');

      Map<String, dynamic> parsedJSON = jsonDecode(response.body);
      return parsedJSON;
    } on SocketException {
      Loader.loader.value = false;
      GetxHelper.showSnackBar1(
          title: 'Error', message: "Please check internet connection");
    } on FormatException catch (_) {
      Loader.loader.value = false;
      GetxHelper.showSnackBar1(title: 'Error', message: "Something went wrong");
      throw "Something went wrong";
    } catch (e) {
      Loader.loader.value = false;
      GetxHelper.showSnackBar1(title: 'Error', message: "something went wrong");
      throw e.toString();
    }
  }
}
