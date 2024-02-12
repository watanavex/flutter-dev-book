import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final list = List.generate(5, (index) => index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: list.map((element) {
          return ListItem(
            key: ValueKey(element),
            widgetIndex: element,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            debugPrint('Swap first and last element');
            final value = list.removeAt(0);
            list.add(value);
          });
        },
        child: const Icon(Icons.swap_vert),
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  const ListItem({super.key, required this.widgetIndex});
  final int widgetIndex;
  @override
  State createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  static int counter = 0;
  final int _stateIndex = counter++;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Widget index ${widget.widgetIndex}, ' 'State index $_stateIndex',
      ),
    );
  }
}
