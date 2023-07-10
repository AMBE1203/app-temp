import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key, this.width, this.height, this.strokeWidth, this.isCenter = true});
  final double? width;
  final double? height;
  final double? strokeWidth;
  final bool? isCenter;

  @override
  Widget build(BuildContext context) {
    final loading = SizedBox(
      width: width ?? 30,
      height: height ?? 30,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 3,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.current.primaryColor),
      ),
    );

    return isCenter == true ? Center(child: loading) : loading;
  }
}
