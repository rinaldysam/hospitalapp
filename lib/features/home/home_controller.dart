import 'dart:math';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valbury/models/hospital_entity.dart';
import 'package:valbury/routes/app_routes.dart';
import 'package:valbury/services/home_services.dart';

import '../../models/clinic_entity.dart';
import '../../widgets/loading_widget.dart';

class HomeController extends GetxController with StateMixin<int> {
  int selectedHospitalFilter = 0;
  int selectedClinicFilter = 0;
  var hospitals = <HospitalEntity>[].obs;
  var clinics = <ClinicEntity>[].obs;
  Map<int, String> hospitalfilters = {
    0: 'All',
    1: 'BPJS',
    2: 'Partner',
    3: 'Near me',
  };
  Map<int, String> clinicfilters = {
    0: 'All',
    1: 'BPJS',
    2: 'Partner',
  };

  @override
  void onInit() async {
    change(0, status: RxStatus.success());
    super.onInit();
    onRefresh();
  }

  void onTapFilter(String slug, int value) {
    if (slug == 'hospital') {
      selectedHospitalFilter = value;
      fetchHospital();
    } else {
      selectedClinicFilter = value;
      fetchClinic();
    }
  }

  Future<void> onRefresh() async {
    change(0, status: RxStatus.loading());

    // Reset filter
    selectedHospitalFilter = 0;
    selectedClinicFilter = 0;

    await Future.delayed(Random().nextInt(4).seconds);

    // Fetch list
    await fetchHospital();
    await fetchClinic();

    change(0, status: RxStatus.success());
  }

  Future<void> fetchHospital() async {
    DataService().getHospitals().then((response) {
      hospitals.value = response;
      refresh();
    });
  }

  Future<void> fetchClinic() async {
    DataService().getClinics().then((response) {
      clinics.value = response;
      refresh();
    });
  }

  void onTapLogOut() async {
    LoadingWidget.show();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await Future.delayed(2.seconds);
    LoadingWidget.dismiss();
    Get.offAndToNamed(AppRoutes.splash);
  }
}
