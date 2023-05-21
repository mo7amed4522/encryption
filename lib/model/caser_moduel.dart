class CaserModuel {
  String? encrypt;

  CaserModuel.fromjson(Map<String, dynamic> json) {
    encrypt = json['EncryptData'];
  }
}

class CaserDecrypt {
  String? decrypt;
  CaserDecrypt.fromjson(Map<String, dynamic> json) {
    decrypt = json['DecryptData'];
  }
}
