import 'package:hidoc/res/assets.dart';
import 'package:hidoc/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hidoc/res/string_constants.dart';

class BackIcon extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackIcon({this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
      icon: Navigator.canPop(context)
          ? SvgPicture.asset(Assets.arrowSmallLeft)
          : Container(),
    );
  }
}

class CustomAppBarAttributes {
  String? title;
  final Widget? trailing;
  final Widget? leading;

  CustomAppBarAttributes({this.title, this.trailing, this.leading});
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CustomAppBarAttributes? cardBackViewAppBar;

  const CustomAppBar(this.cardBackViewAppBar, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: cardBackViewAppBar?.title != null
          ? Text(cardBackViewAppBar!.title!)
          : null,
      leading: cardBackViewAppBar?.leading ?? const BackIcon(),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: cardBackViewAppBar?.trailing ?? const SizedBox(),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BackCardView extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color? colour;
  final double? circularRadius;

  const BackCardView({required this.child, this.padding, this.colour, this.circularRadius, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      body: Container(
        color: AppColors.primary,
        child: _card(child,colour,padding: padding, circularRadius:circularRadius),
      ),
    );
  }
}

Widget _card(Widget? bottomView,Color? colour,{EdgeInsets? padding, double? circularRadius}) {
  return Container(
    decoration: BoxDecoration(
        // color: AppColors.desertStorm,
        color: colour?? AppColors.greyish,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(circularRadius ?? 30), topRight: Radius.circular(circularRadius ?? 30))),
    margin: EdgeInsets.zero,
    child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: padding ?? _cardPadding,
        child: bottomView,
      ),
    ),
  );
}

const _cardPadding = const EdgeInsets.all(30.0);

class BackCardOnTopView extends StatelessWidget {
  final Widget child;
  final double onTopUiSpace;

  const BackCardOnTopView(
      {required this.child, this.onTopUiSpace = 70.0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: onTopUiSpace,
              ),
              Expanded(child: _card(null, null))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: child,
          )
        ],
      ),
    );
  }
}

class DrawerIcon extends StatelessWidget {
  final VoidCallback? onPressed;

  const DrawerIcon({this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: StringConstants.menu,
      child: IconButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
          Scaffold.of(context).openDrawer();
        },
        icon: SvgPicture.asset(Assets.menuBurger),
      ),
    );
  }
}