import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:encryption/core/constant/statusrequest.dart';
import 'package:encryption/core/func/internet/check_internet.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(
      {String? linkUrl, Map? data}) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkUrl!), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverExption);
    }
  }

  postDataNew({String? linkUrl, Map? datas}) async {
    var response =
        await http.post(Uri.parse(linkUrl!), body: jsonEncode(datas));
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      return responsebody;
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }

  getRequest(String url) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        if (kDebugMode) {
          print("Error ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error Catch $e");
      }
    }
  }

  postRequest(String url, Map data) async {
    try {
      var response = await http.post(Uri.parse(url), body: data);
      if (kDebugMode) {
        print(data);
      }
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        //print(response.body);
        return responsebody;
      } else {
        if (kDebugMode) {
          print("Error ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error Catch $e");
      }
    }
  }
}
