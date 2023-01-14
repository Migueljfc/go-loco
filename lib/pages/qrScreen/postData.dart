// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> postData(Map<String, dynamic> body) async {
    final response = await http.post(
        //Uri.parse("https://go-loco-api.herokuapp.com/"),
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
    );
    return response;
}
