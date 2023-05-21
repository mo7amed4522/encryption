import 'package:flutter/material.dart';
import 'package:encryption/core/theme/theme_color.dart';

class CenterSCreenTittleWidget extends StatelessWidget {
  final String title;
  const CenterSCreenTittleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(fontSize: 25, color: AppColor.nearlyWhite),
        ),
      ),
    );
  }
}
