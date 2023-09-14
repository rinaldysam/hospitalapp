import 'dart:math';

import 'package:valbury/models/clinic_entity.dart';

import '../helper/utils.dart';
import '../models/hospital_entity.dart';

class DataService {
  Future<List<HospitalEntity>> getHospitals() async {
    List<dynamic> data = await Utils.readJson('assets/json/hospitals.json');
    final list = data.map((json) => HospitalEntity.fromJson(json)).toList();

    List<HospitalEntity> result = [];
    final random = Random();
    while (result.length < 3) {
      final randomIndex = random.nextInt(list.length);
      result.add(list[randomIndex]);
    }

    return result;
  }

  Future<List<ClinicEntity>> getClinics() async {
    List<dynamic> data = await Utils.readJson('assets/json/clinics.json');
    final list = data.map((json) => ClinicEntity.fromJson(json)).toList();

    List<ClinicEntity> result = [];
    final random = Random();
    while (result.length < 3) {
      final randomIndex = random.nextInt(list.length);
      result.add(list[randomIndex]);
    }

    return result;
  }
}
