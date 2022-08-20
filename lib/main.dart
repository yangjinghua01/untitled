import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled/panel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 205.0;

  @override
  void initState() {
    super.initState();
    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * 0.76;
    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),
          Positioned(
              top: 0,
              child: ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).padding.top,
                        color: Colors.transparent,
                      )))),
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          shrinkWrap: true,
          controller: sc,
          physics:
          // sc.offset != _panelHeightOpen
          //     ? NeverScrollableScrollPhysics()
          //     :
          ClampingScrollPhysics(),
          children: <Widget>[
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
                child: Stack(
              children: [
                Container(
                  constraints: BoxConstraints(maxHeight: _panelHeightOpen - 20),
                  child: childone(sc),
                )
              ],
            ))
          ],
        ));
  }

  Widget childone(ScrollController sc) {
    return GridView(
      // physics: sc.offset > _panelHeightOpen-20 ? NeverScrollableScrollPhysics() : ClampingScrollPhysics(),
      // shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, //每一行的列数
        mainAxisSpacing: 0.4, //主轴方向上的间距
        crossAxisSpacing: 1, //交叉轴轴方向上的间距
        childAspectRatio: 1, //子元素的宽高比例
      ),
      children: [
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
        item(),
      ],
    );
  }

  Widget item() {
    return Card(
      child: CachedNetworkImage(
        imageUrl:
            "https://cdn.pixabay.com/photo/2016/08/11/23/48/pnc-park-1587285_1280.jpg",
        height: 120.0,
        width: 100,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _body() {
    return Container(
      child: Center(
        child: Text("DEMO"),
      ),
    );
  }
}
