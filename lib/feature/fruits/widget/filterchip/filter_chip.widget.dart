import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterChipWidget extends StatelessWidget {
  const FilterChipWidget({
    Key? key,
    required this.title,
    required this.iconPath,
    this.margin = EdgeInsets.zero,
    this.onIconTap,
  }) : super(key: key);

  final String title;
  final String iconPath;
  final EdgeInsets margin;
  final VoidCallback? onIconTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: margin,
        height: 40,
        child: Row(children: [
          const SizedBox(width: 8),
          Text(title, style: const TextStyle(color: Colors.black)),
          ScaleTap(
              onPressed: onIconTap,
              child: Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SvgPicture.asset(iconPath,
                      color: Colors.black, width: 16, height: 16))),
        ]));
  }
}
