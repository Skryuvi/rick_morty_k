import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/core/build_context_ext.dart';
import 'package:rick_morty/features/page_characters/page_two.dart';
import 'package:rick_morty/presentation/widgets/buttons/base_text_button.dart';

import 'di/di_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

final naivigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class StateLessPage extends StatelessWidget {
  const StateLessPage({super.key});

  int get getColor => Random().nextInt(255);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: GestureDetector(
                onTap: (context as Element).markNeedsBuild,
                child: Container(
                    height: 200,
                    width: 200,
                    color: Color.fromRGBO(getColor, getColor, getColor, 1)))));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final streamController = StreamController<List<int>>();

  List<int> listNumbers = List.generate(100, (i) => i);
  late ScrollController controller = ScrollController()..addListener(_onScroll);

  final textController = TextEditingController()..text = 'testovy';
  late final node = FocusNode()..addListener(nodeListener);

  void addNewNum() {
    listNumbers.add(listNumbers.length + 1);
    streamController.sink.add(listNumbers);
  }

  void nodeListener() {
    print(node.hasFocus);
  }

  void scrollToEnd() {
    var textValue = textController.text;
    print(textValue);
  }

  void _onScroll() {
    var offset = controller.offset;
    print('current offset $offset');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title)),
        floatingActionButton: FloatingActionButton(
            onPressed: addNewNum,
            backgroundColor: Colors.red,
            child: const Icon(Icons.add)),
        body: Center(
            child: BaseTextButton(
          type: ButtonType.textOnly,
          text: 'Base text button',
          callback: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => PageTwo.create())),
        )));
  }
}
