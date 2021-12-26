import 'package:flutter/material.dart';

// You can use a relative import, i.e. `import 'category_route.dart;'` or
// a package import.
// More details at http://dart-lang.github.io/linter/lints/avoid_relative_lib_imports.html
import 'category_route.dart';

void main() {
  runApp(const UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
              displayColor: Colors.grey[600],
            ),
        primaryColor: Colors.grey[500],
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.green[500],
        ),
      ),
      home: const CategoryRoute(),
    );
  }
}
