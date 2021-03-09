import 'package:aiot/constant.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

// enum FeedbackType {
//   success,
//   error,
//   warning,
//   selection,
//   impact,
//   heavy,
//   medium,
//   light
// }

class ShadowCard extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final Function onLongPress;
  const ShadowCard({
    Key key,
    this.child,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
          color: const Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: const Color(0x1a000000),
              offset: Offset(3, 5),
              blurRadius: 22,
            ),
          ],
        ),
        child: Material(
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
          color: Colors.white,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultPadding / 2),
              // color: const Color(0xffffffff),
              // color: Colors.red,
            ),
            child: new InkWell(
                borderRadius: new BorderRadius.circular(
                    kDefaultPadding / 2), //给水波纹也设置同样的圆角
                onTap: onTap,
                onLongPress: () async {
                  if (await Vibration.hasVibrator()) {
                    Vibration.vibrate();
                  }
                  onLongPress();
                },
                child: child),
          ),
        ),
      ),
    );
  }
}
