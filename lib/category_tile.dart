import 'package:flutter/material.dart';

import 'category.dart';

const _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class CategoryTile extends StatelessWidget {
  final Category category;
  final ValueChanged<Category>? onTap;

  const CategoryTile({
    Key? key,
    required this.category,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: onTap == null
          ? const Color.fromRGBO(50, 50, 50, 0.2)
          : Colors.transparent,
      child: SizedBox(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: category.color['highlight'],
          splashColor: category.color['splash'],
          onTap: onTap == null ? null : () => onTap!(category),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(category.iconLocation),
                ),
                Center(
                  child: Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
