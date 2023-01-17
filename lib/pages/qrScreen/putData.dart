// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> putData(String param) async {
  final response = await http.put(
    Uri.parse("https://go-loco-api.herokuapp.com/markers/$param"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({}),
  );
  return response;
}
