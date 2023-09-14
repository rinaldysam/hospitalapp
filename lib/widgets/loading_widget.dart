import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoadingWidget {
  static void show({
    bool isDismissible = false,
    String? message = '',
  }) {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              height: 100,
              width: 100,
              child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text(
                      'Please wait...',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
      barrierDismissible: isDismissible,
    );
  }

  static void dismiss() => Get.back();
}
