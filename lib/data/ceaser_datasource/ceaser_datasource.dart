import 'package:flutter/foundation.dart';
import 'package:encryption/core/constant/curd.dart';
import 'package:encryption/core/constant/link_api.dart';

class CeaserDataSource {
  Crud curd;
  CeaserDataSource(this.curd);

  postCeaser(String text) async {
    var response = await curd.postRequest(
      AppLink.ceaserURL,
      {"text": text},
    );
    if (kDebugMode) {
      print(text);
    }
    return response;
  }
}
