// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:cm_project/models/markers_model.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarkersRepository {
  String url = 'https://go-loco-api.herokuapp.com/';
  Future<List<MarkersModel>> getMarkers() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Response response =
        await get(Uri.parse("${url}markers/${sp.getString('user_key')}"));
    if (response.statusCode == 200) {
      final List markers = jsonDecode(response.body);
      return markers.map((e) => MarkersModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
