class ClinicEntity {
  String? address;
  String? email;
  String? name;
  String? phone;
  String? supervisor;

  ClinicEntity({
    this.address,
    this.email,
    this.name,
    this.phone,
    this.supervisor,
  });

  ClinicEntity.fromJson(Map<String, dynamic> json) {
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
    if (json["supervisor"] is String) {
      supervisor = json["supervisor"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["address"] = address;
    data["email"] = email;
    data["name"] = name;
    data["phone"] = phone;
    data["supervisor"] = supervisor;
    return data;
  }
}
