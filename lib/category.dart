import 'package:flutter/material.dart';

import 'unit.dart';

class Category {
  final String name;
  final ColorSwatch color;
  final List<Unit> units;
  final String iconLocation;

  const Category({
    required this.name,
    required this.color,
    required this.units,
    required this.iconLocation,
  });
}
