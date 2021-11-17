import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  static Future<Map<String, dynamic>?> get(String link) async {
    final response = await http.get(
      Uri.parse(link),
    );
    log(response.body.toString());
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        var json = jsonDecode(response.body);
        return json;
      } catch (e) {
        log(e.toString());
        return null;
      }
    }
    return null;
  }
}
