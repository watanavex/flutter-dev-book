import 'package:flutter/material.dart';

class MyTheme extends ThemeExtension<MyTheme> {
  const MyTheme({
    required this.themeColor,
  });
  final Color? themeColor;
  @override
  MyTheme copyWith({Color? themeColor}) {
    return MyTheme(
      themeColor: themeColor ?? this.themeColor,
    );
  }

  @override
  MyTheme lerp(MyTheme? other, double t) {
    if (other is! MyTheme) {
      return this;
    }
    return MyTheme(
      themeColor: Color.lerp(themeColor, other.themeColor, t),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        extensions: const [MyTheme(themeColor: Color(0xFF0000FF))],
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.green,
        brightness: Brightness.dark,
        extensions: const [MyTheme(themeColor: Color(0xFFFF0000))],
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        body: const Center(
          child: ThemedWidget(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _toggleDarkMode();
          },
          child: const Icon(Icons.settings_brightness),
        ),
      ),
    );
  }
}

class ThemedWidget extends StatelessWidget {
  const ThemedWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context).extension<MyTheme>()!;
    final color = myTheme.themeColor;
    return Container(width: 100, height: 100, color: color);
  }
}
