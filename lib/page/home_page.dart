import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/city_widgets.dart';
import '../widgets/fade_app_bar.dart';
import '../widgets/header.dart';
import '../widgets/hero_banner.dart';
import '../widgets/live_anywhere_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  void _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  /// > The initState() function is called when the widget is first created
  @override
  void initState() {
    /// Creating a scroll controller and adding a listener to it.
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              HeroBanner(),
              Header("Explore Nearby"),
              CitiesGrid(),
              LiveAnywhereList(),
            ],
          ),
          FadeAppBar(scrollOffset: _scrollControllerOffset),
        ],
      ),
    );
  }
}
