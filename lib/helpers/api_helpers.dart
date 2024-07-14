import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class APIHelpers {
  static Future<String> apiGetRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url), headers: {
        "Accept": "*/*",
        "Content-Type": "application/json",
      });
      log(response.toString());
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 400) {
        return response.body;
      } else if (response.statusCode == 402) {
        Fluttertoast.showToast(
          msg: 'Your daily points limit of 150 has been reached.',
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
        );
        return '';
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(
          msg: 'UNEXPECTED ERROR',
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
        );
        return '';
      } else {
        return '';
      }
    } on SocketException {
      log('SOCKET EXCEPTION OCCURRED');
      return '';
    } on FormatException {
      log('JSON FORMAT EXCEPTION OCCURRED');
      return '';
    } catch (e) {
      log('UNEXPECTED ERROR');
      log(e.toString());
      return '';
    }
  }
}
