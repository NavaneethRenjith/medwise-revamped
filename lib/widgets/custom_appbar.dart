import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color bgColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.bgColor,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(400);

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var totalAppBarHeight =
        MediaQuery.of(context).size.height / 4 + statusBarHeight;

    return Container(
      constraints: BoxConstraints(maxHeight: totalAppBarHeight),
      child: Column(
        children: [
          AppBar(
            backgroundColor: bgColor,
          ),
          Expanded(
            child: Container(
              color: bgColor,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
