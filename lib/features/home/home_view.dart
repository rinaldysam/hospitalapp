import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valbury/widgets/appbar_widget.dart';

import 'home_controller.dart';
import 'views/home_banner_view.dart';
import 'views/home_card_view.dart';
import 'views/home_hospitals_view.dart';
import 'views/home_skeleton_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(onTapRightIcon: controller.onTapLogOut),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: controller.obx(
            (_) => ListView(
              children: [
                HomeHospitalView(
                  title: 'Hospital',
                  filters: controller.hospitalfilters,
                  selectedFilter: controller.selectedHospitalFilter,
                  children: controller.hospitals
                      .map(
                        (elm) => HomeCardView(
                          nameText: elm.name,
                          addressText: elm.address ?? '',
                          phoneText: elm.phone,
                        ),
                      )
                      .toList(),
                  onTapFilter: (value) {
                    controller.onTapFilter('hospital', value);
                  },
                  onTapAll: () {},
                ),
                const HomeBannerView(),
                HomeHospitalView(
                  title: 'Clinic',
                  filters: controller.clinicfilters,
                  selectedFilter: controller.selectedClinicFilter,
                  children: controller.clinics
                      .map(
                        (elm) => HomeCardView(
                          nameText: elm.name,
                          addressText: elm.address,
                          phoneText: elm.phone,
                        ),
                      )
                      .toList(),
                  onTapFilter: (value) {
                    controller.onTapFilter('clinic', value);
                  },
                  onTapAll: () {},
                ),
              ],
            ),
            onLoading: const SingleChildScrollView(
              child: HomeSkeletonView(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _renderBottomNavBar(),
    );
  }

  BottomNavigationBar _renderBottomNavBar() {
    return BottomNavigationBar(
      iconSize: 18,
      selectedLabelStyle: TextStyle(
        color: Colors.blueAccent[700],
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        color: Colors.black45,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      showUnselectedLabels: true,
      selectedItemColor: Colors.blueAccent[700],
      unselectedItemColor: Colors.black38,
      items: <BottomNavigationBarItem>[
        _barItem(Icons.home_rounded, 'HOME'),
        _barItem(Icons.local_hospital_outlined, 'HOSPITAL'),
        _barItem(Icons.healing_outlined, 'CLINIC'),
        _barItem(Icons.person_2_rounded, 'PROFILE'),
      ],
    );
  }

  BottomNavigationBarItem _barItem(IconData icon, String text) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: text,
    );
  }
}
