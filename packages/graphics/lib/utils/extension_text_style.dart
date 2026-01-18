import 'package:flutter/material.dart';
import 'package:graphics/graphics_consts/graphics_color_consts.dart';

extension Style on TextStyle {
  /// FontWeight : w400
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  /// FontWeight : w500
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// FontWeight : w700
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// FontWeight : w800
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

  /// FontStyle: italic
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  /// HEX: #ECECEC
  TextStyle get white => copyWith(color: GraphicsColorConsts.white);

  /// HEX: #000000
  TextStyle get black => copyWith(color: GraphicsColorConsts.black);

  /// HEX: #15C671
  TextStyle get green => copyWith(color: GraphicsColorConsts.green);

  /// HEX: #D24141
  TextStyle get red => copyWith(color: GraphicsColorConsts.red);

  /// HEX: #909090
  TextStyle get grey => copyWith(color: GraphicsColorConsts.grey);

  /// HEX: #DDDDDD
  TextStyle get mutedGrey => copyWith(color: GraphicsColorConsts.mutedGrey);

  /// HEX: #898989
  TextStyle get lightGrey => copyWith(color: GraphicsColorConsts.lightGrey);

  /// HEX: #757575
  TextStyle get deepGrey => copyWith(color: GraphicsColorConsts.deepGrey);

  /// HEX: #929292
  TextStyle get philippineGrey => copyWith(color: GraphicsColorConsts.philippineGrey);

  /// HEX: #E16E40
  TextStyle get orange => copyWith(color: GraphicsColorConsts.orange);

  /// HEX: #0089D7
  TextStyle get blue => copyWith(color: GraphicsColorConsts.blue);

  /// HEX: #7C3FE0
  TextStyle get purple => copyWith(color: GraphicsColorConsts.purple);
}
