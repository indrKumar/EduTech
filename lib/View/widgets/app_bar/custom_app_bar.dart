import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/theme_helper.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      toolbarHeight: height ?? 56.w,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        double.infinity,
        height ?? 56.w,
      );
  _getStyle() {
    switch (styleType) {
      case Style
            .bgGradientnamelightblueA400opacity053namelightblueA400opacity053:
        return Container(
          height: 233.w,
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.46, 0.04),
              end: Alignment(0.51, 0.79),
              colors: [
                appTheme.lightBlueA400.withOpacity(0.53),
                appTheme.lightBlueA400.withOpacity(0.53),
              ],
            ),
          ),
        );
      case Style.bgFill:
        return Container(
          height: 184.w,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgGradientnamelightblueA400opacity053namelightblueA400opacity053,
  bgFill,
}
