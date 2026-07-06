import 'package:flutter/material.dart';
import 'package:flutter_mart/utils/app_colors.dart';

class AppbarWidget extends StatelessWidget {
  final String title;
  const AppbarWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bgMain,
      iconTheme: IconThemeData(color: Colors.white),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios_sharp),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
