class HospitalEntity {
  String? address;
  String? email;
  String? name;
  String? phone;
  int? code;
  String? type;

  HospitalEntity({
    this.address,
    this.email,
    this.name,
    this.phone,
    this.code,
    this.type,
  });

  HospitalEntity.fromJson(Map<String, dynamic> json) {
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["type"] is int) {
      code = json["type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["address"] = address;
    data["email"] = email;
    data["name"] = name;
    data["phone"] = phone;
    data["code"] = code;
    data["type"] = type;
    return data;
  }
}
