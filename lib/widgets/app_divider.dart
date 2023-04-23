import 'package:flutter/cupertino.dart';

import '../style/colors.dart';

class AppDivider extends StatelessWidget {
  final double? padding;
  const AppDivider({Key? key, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: 1,
                color: AppColor.resolveColor(
                    context, AppColor.primaryContrastingColor.withAlpha(25))),
          ),
        ),
      ),
    );
  }
}
