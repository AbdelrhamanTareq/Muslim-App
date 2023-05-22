import 'package:flutter/material.dart';

class ScreenObject {
  final String _name;
  final Color _color;
  final String _path;

  ScreenObject({
    required Color color,
    required String name,
    required String path,
  })  : _name = name,
        _color = color,
        _path = path;
}
