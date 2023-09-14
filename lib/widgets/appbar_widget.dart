import 'package:flutter/material.dart';

class AppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
    this.onTapRightIcon,
  });

  final VoidCallback? onTapRightIcon;

  @override
  AppbarWidgetState createState() => AppbarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leadingWidth: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/ic-logo-horizontal.png',
            height: 26,
          ),
          IconButton(
            iconSize: 24,
            icon: const Icon(Icons.logout_rounded),
            color: Colors.black87,
            onPressed: widget.onTapRightIcon,
          ),
        ],
      ),
      elevation: 0.5,
    );
  }
}
