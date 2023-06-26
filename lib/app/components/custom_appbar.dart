import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final Color? iconColor;
  final Object? result;
  final bool useLeading;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.titleStyle,
    this.backgroundColor,
    this.iconColor,
    this.result,
    this.useLeading = true,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: titleStyle,
      ),
      backgroundColor: backgroundColor,
      leading: useLeading
          ? InkWell(
              onTap: () {
                Get.back(
                  result: result,
              );
              },
              child: Icon(
                Icons.arrow_back,
                color: iconColor,
              ),
            )
          : null,
    );
  }
}
