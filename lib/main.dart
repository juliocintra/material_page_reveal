import 'package:flutter/material.dart';
import 'package:material_page_reveal/pages.dart';
import 'package:material_page_reveal/page_reveal.dart';
import 'package:material_page_reveal/pager_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Material Page Reveal',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Page(
          viewModel: pages[0],
          percentVisible: 0.9,
        ),
        PageReveal(
          revealPercent: 1,
          child: Page(
            viewModel: pages[1],
            percentVisible: 1,
          ),
        ),
        PagerIndicator(

        )
      ],
    ));
  }
}
