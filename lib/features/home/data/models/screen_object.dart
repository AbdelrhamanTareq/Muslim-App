import 'package:flutter/material.dart';

class ScreenObject {
  final String _name;
  final Color _color;
  final String _path;
  final String _iconAsset;

  get name => _name;
  get color => _color;
  get path => _path;
  get iconAsset => _iconAsset;

  ScreenObject({
    required Color color,
    required String name,
    required String path,
    required String iconAsset,
  })  : _name = name,
        _color = color,
        _path = path,
        _iconAsset = iconAsset;
}
