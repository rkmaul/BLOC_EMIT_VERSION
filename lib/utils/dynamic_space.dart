import 'package:flutter/cupertino.dart';

class DynamicSpace {
  // Padding
  static double? _paddingTop;
  static double? _paddingBottom;
  static double? fullHeightWithoutAppbar;
  static double? _fullHeight;
  static double? _middleHeight;
  static double? fiturSize;

  static Widget paddingTop = SizedBox(height: _paddingTop);
  static Widget middleHeight = SizedBox(height: _middleHeight);
  static Widget paddingBottom = SizedBox(height: _paddingBottom);
  static Widget containerFull = Container(height: _fullHeight);
  static Widget fiturContainerSize = Container(height: fiturSize);
  static Widget containerFullWithoutAppbar =
      Container(height: fullHeightWithoutAppbar);

  // Vertical spacing constants.
  static const double _VerticalSpace0 = 0.0;
  static const double _VerticalSpace2 = 2.0;
  static const double _VerticalSpace4 = 4.0;
  static const double _VerticalSpace6 = 6.0;
  static const double _VerticalSpace8 = 8.0;
  static const double _VerticalSpace9 = 9.0;
  static const double _VerticalSpace10 = 10.0;
  static const double _VerticalSpace12 = 12.0;
  static const double _VerticalSpace14 = 14.0;
  static const double _VerticalSpace16 = 16.0;
  static const double _VerticalSpace18 = 18.0;
  static const double _VerticalSpace20 = 20.0;
  static const double _VerticalSpace22 = 22.0;
  static const double _VerticalSpace24 = 24.0;
  static const double _VerticalSpace30 = 30.0;
  static const double _VerticalSpace32 = 32.0;
  static const double _VerticalSpace39 = 39.0;
  static const double _VerticalSpace40 = 40.0;
  static const double _VerticalSpace48 = 48.0;
  static const double _VerticalSpace50 = 50.0;
  static const double _VerticalSpace60 = 60.0;
  static const double _VerticalSpace74 = 74.0;
  static const double _VerticalSpace100 = 100.0;
  static const double _VerticalSpace400 = 400.0;

  static const Widget verticalSpace0 = SizedBox(height: _VerticalSpace0);
  static const Widget verticalSpace2 = SizedBox(height: _VerticalSpace2);
  static const Widget verticalSpace4 = SizedBox(height: _VerticalSpace4);
  static const Widget verticalSpace6 = SizedBox(height: _VerticalSpace6);
  static const Widget verticalSpace8 = SizedBox(height: _VerticalSpace8);
  static const Widget verticalSpace9 = SizedBox(height: _VerticalSpace9);
  static const Widget verticalSpace10 = SizedBox(height: _VerticalSpace10);
  static const Widget verticalSpace12 = SizedBox(height: _VerticalSpace12);
  static const Widget verticalSpace14 = SizedBox(height: _VerticalSpace14);
  static const Widget verticalSpace16 = SizedBox(height: _VerticalSpace16);
  static const Widget verticalSpace18 = SizedBox(height: _VerticalSpace18);
  static const Widget verticalSpace20 = SizedBox(height: _VerticalSpace20);
  static const Widget verticalSpace22 = SizedBox(height: _VerticalSpace22);
  static const Widget verticalSpace24 = SizedBox(height: _VerticalSpace24);
  static const Widget verticalSpace30 = SizedBox(height: _VerticalSpace30);
  static const Widget verticalSpace32 = SizedBox(height: _VerticalSpace32);
  static const Widget verticalSpace39 = SizedBox(height: _VerticalSpace39);
  static const Widget verticalSpace40 = SizedBox(height: _VerticalSpace40);
  static const Widget verticalSpace48 = SizedBox(height: _VerticalSpace48);
  static const Widget verticalSpace50 = SizedBox(height: _VerticalSpace50);
  static const Widget verticalSpace60 = SizedBox(height: _VerticalSpace60);
  static const Widget verticalSpace74 = SizedBox(height: _VerticalSpace74);
  static const Widget verticalSpace100 = SizedBox(height: _VerticalSpace100);

  static const Widget verticalSpace400 = SizedBox(height: _VerticalSpace400);

  // Horizontal spacing constants.
  static const double _HorizontalSpace2 = 2.0;
  static const double _HorizontalSpace4 = 4.0;
  static const double _HorizontalSpace6 = 6.0;
  static const double _HorizontalSpace7 = 7.0;
  static const double _HorizontalSpace8 = 8.0;
  static const double _HorizontalSpace9 = 9.0;
  static const double _HorizontalSpace10 = 10.0;
  static const double _HorizontalSpace12 = 12.0;
  static const double _HorizontalSpace13 = 13.0;
  static const double _HorizontalSpace14 = 14.0;
  static const double _HorizontalSpace16 = 16.0;
  static const double _HorizontalSpace18 = 18.0;
  static const double _HorizontalSpace20 = 20.0;
  static const double _HorizontalSpace24 = 24.0;
  static const double _HorizontalSpace28 = 28.0;
  static const double _HorizontalSpace30 = 30.0;
  static const double _HorizontalSpace32 = 32.0;
  static const double _HorizontalSpace33 = 33.0;
  static const double _HorizontalSpace50 = 50.0;
  static const double _HorizontalSpace74 = 74.0;
  static const double _HorizontalSpace100 = 100.0;

  static const Widget horizontalSpace2 = SizedBox(width: _HorizontalSpace2);
  static const Widget horizontalSpace4 = SizedBox(width: _HorizontalSpace4);
  static const Widget horizontalSpace6 = SizedBox(width: _HorizontalSpace6);
  static const Widget horizontalSpace7 = SizedBox(width: _HorizontalSpace7);
  static const Widget horizontalSpace8 = SizedBox(width: _HorizontalSpace8);
  static const Widget horizontalSpace9 = SizedBox(width: _HorizontalSpace9);
  static const Widget horizontalSpace10 = SizedBox(width: _HorizontalSpace10);
  static const Widget horizontalSpace12 = SizedBox(width: _HorizontalSpace12);
  static const Widget horizontalSpace13 = SizedBox(width: _HorizontalSpace13);
  static const Widget horizontalSpace14 = SizedBox(width: _HorizontalSpace14);
  static const Widget horizontalSpace16 = SizedBox(width: _HorizontalSpace16);
  static const Widget horizontalSpace18 = SizedBox(width: _HorizontalSpace18);
  static const Widget horizontalSpace20 = SizedBox(width: _HorizontalSpace20);
  static const Widget horizontalSpace24 = SizedBox(width: _HorizontalSpace24);
  static const Widget horizontalSpace28 = SizedBox(width: _HorizontalSpace28);
  static const Widget horizontalSpace30 = SizedBox(width: _HorizontalSpace30);
  static const Widget horizontalSpace32 = SizedBox(width: _HorizontalSpace32);
  static const Widget horizontalSpace33 = SizedBox(width: _HorizontalSpace33);
  static const Widget horizontalSpace50 = SizedBox(width: _HorizontalSpace50);
  static const Widget horizontalSpace74 = SizedBox(width: _HorizontalSpace74);
  static const Widget horizontalSpace100 = SizedBox(width: _HorizontalSpace100);
}
