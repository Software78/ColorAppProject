// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:color_app/screens/settings.dart';
import 'package:color_app/widgets/results_bottom_sheet.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
// import 'package:color_app/widgets/color_count.dart';
import 'package:color_app/widgets/color_picker.dart';
// import 'package:color_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:hex/hex.dart';

class TwoColors extends StatefulWidget {
  const TwoColors({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  State<TwoColors> createState() => _TwoColorsState();
}

class _TwoColorsState extends State<TwoColors>
    with SingleTickerProviderStateMixin {
  HexColor? bgcolor1;
  bool istapped1 = true;
  bool istapped2 = true;
  bool istapped3 = true;

  HexColor? bgcolor2;
  HexColor? bgcolor3;

  @override
  initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    final Color globalcolor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globalcolor,
        title: const Text('Color App'),
        actions: [
          GestureDetector(
            child: const Icon(Icons.info),
            onTap: () {
              Navigator.pushNamed(context, Settings.id);
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: const [
            Padding(
              padding: EdgeInsets.only(
                bottom: 10,
                top: 10,
              ),
              child: Text('Two Colors'),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 10,
                top: 10,
              ),
              child: Text('Three Colors'),
            ),
          ],
        ),
      ),
      backgroundColor: globalcolor,
      body: TabBarView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: widget.width * 0.1,
              right: widget.width * 0.1,
            ),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ColorPicker(
                  istapped: istapped1,
                  // colorname: colorname1,
                  color: bgcolor1,
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChooseColor1Screen(),
                      ),
                    );
                    setState(() {
                      istapped1 == !istapped1;
                      colorname1 = color1!;
                      bgcolor1 = HexColor(color1!);
                    });
                  },
                  width: widget.width * 0.8,
                  height: widget.width * 0.6,
                ),
                const SizedBox(
                  height: 20,
                ),
                ColorPicker(
                  // colorname: colorname2,
                  istapped: istapped2,
                  color: bgcolor2,
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChooseColor2Screen(),
                      ),
                    );
                    setState(() {
                      istapped2 == !istapped2;

                      bgcolor2 = HexColor(color2!);
                    });
                  },
                  width: widget.width * 0.8,
                  height: widget.width * 0.6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Tooltip(
                  message: 'delete selection',
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: RawMaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.delete,
                        color: globalcolor,
                      ),
                      onPressed: () {
                        deleteColors();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: widget.width * 0.1,
              right: widget.width * 0.1,
            ),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ColorPicker(
                  istapped: istapped1,
                  // colorname: colorname1,
                  color: bgcolor1,
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChooseColor1Screen(),
                      ),
                    );
                    setState(() {
                      istapped1 == !istapped1;
                      colorname1 = color1!;
                      bgcolor1 = HexColor(color1!);
                    });
                  },
                  width: widget.width * 0.8,
                  height: widget.width * 0.4,
                ),
                const SizedBox(
                  height: 20,
                ),
                ColorPicker(
                  // colorname: colorname2,
                  istapped: istapped2,
                  color: bgcolor2,
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChooseColor2Screen(),
                      ),
                    );
                    setState(() {
                      istapped2 == !istapped2;

                      bgcolor2 = HexColor(color2!);
                    });
                  },
                  width: widget.width * 0.8,
                  height: widget.width * 0.4,
                ),
                const SizedBox(
                  height: 20,
                ),
                ColorPicker(
                  // colorname: colorname2,
                  istapped: istapped3,
                  color: bgcolor3,
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChooseColor3Screen(),
                      ),
                    );
                    setState(() {
                      istapped3 == !istapped3;

                      bgcolor3 = HexColor(color3!);
                    });
                  },
                  width: widget.width * 0.8,
                  height: widget.width * 0.4,
                ),
                const SizedBox(
                  height: 20,
                ),
                Tooltip(
                  message: 'delete selection',
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: RawMaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.delete,
                        color: globalcolor,
                      ),
                      onPressed: () {
                        deleteColors();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
        controller: _tabController,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          if (bgcolor1 == null || bgcolor2 == null) {
            showToast('please select a color',
                context: context,
                animation: StyledToastAnimation.scale,
                position: StyledToastPosition.bottom,
                reverseAnimation: StyledToastAnimation.fade,
                animDuration: const Duration(seconds: 1),
                duration: const Duration(seconds: 3),
                curve: Curves.elasticOut,
                reverseCurve: Curves.linear);
          } else if (bgcolor1 == bgcolor2 ||
              bgcolor3 == bgcolor2 ||
              bgcolor1 == bgcolor3) {
            showToast('please select different colors',
                context: context,
                animation: StyledToastAnimation.scale,
                position: StyledToastPosition.bottom,
                reverseAnimation: StyledToastAnimation.fade,
                animDuration: const Duration(seconds: 1),
                duration: const Duration(seconds: 3),
                curve: Curves.elasticOut,
                reverseCurve: Curves.linear);
          } else if (bgcolor3 == null) {
            var val1 = HEX.decode(color1!);
            var val2 = HEX.decode(color2!);
            var val3 = val1[0] + val2[0];
            var val4 = val1[1] + val2[1];
            var val5 = val1[2] + val2[2];
            var finalval = [
              (val3 / 2).round(),
              (val4 / 2).round(),
              (val5 / 2).round(),
            ];

            print(finalval);
            print(HEX.encode(finalval));

            showModalBottomSheet(
              context: context,
              builder: (context) => ResultsBottomSheet(
                color: HEX.encode(finalval),
              ),
            );
            deleteColors();
          } else {
            var val1 = HEX.decode(color1!);
            var val2 = HEX.decode(color2!);
            var val3 = HEX.decode(color3!);
            var val4 = val1[0] + val2[0] + val3[0];
            var val5 = val1[1] + val2[1] + val3[1];
            var val6 = val1[2] + val2[2] + val3[2];
            var finalval = [
              (val4 / 3).round(),
              (val5 / 3).round(),
              (val6 / 3).round(),
            ];

            print(finalval);
            print(HEX.encode(finalval));

            showModalBottomSheet(
              context: context,
              builder: (context) => ResultsBottomSheet(
                color: HEX.encode(finalval),
              ),
            );
            deleteColors();
          }
        },
        child: Tooltip(
          message: 'merge colors',
          child: Icon(
            Icons.add,
            color: globalcolor,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void deleteColors() {
    setState(() {
      bgcolor1 = null;
      bgcolor3 = null;
      bgcolor2 = null;
    });
  }
}

String? color1;
String colorname1 = '';

// ignore: must_be_immutable
class ChooseColor1Screen extends StatefulWidget {
  ChooseColor1Screen({
    Key? key,
  }) : super(key: key);
  String? color;
  static const String id = 'selector';

  @override
  State<ChooseColor1Screen> createState() => _ChooseColor1ScreenState();
}

class _ChooseColor1ScreenState extends State<ChooseColor1Screen> {
  @override
  void initState() {
    super.initState();
    _search = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _search.dispose();
  }

  late TextEditingController _search;
  Widget appBarTitle = const Text("Choose Color");
  Icon actionIcon = const Icon(Icons.search);
  List items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/Color.json');
    final data = await json.decode(response);
    setState(() {
      items = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    List newDataList = List.from(items);

    onItemChanged(String value) {
      // print('input');
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: newDataList.length,
        itemBuilder: (context, int index) => ListTile(
          title: InkWell(
            onTap: () async {
              colorname1 = newDataList[index]['name'];
              color1 = newDataList[index]['hexCode'];
              print(colorname1);
              print(color1);
              Navigator.pop(context);
            },
            hoverColor: HexColor(newDataList[index]['hexCode']),
            child: ListTile(
              title: Text(newDataList[index]['name']),
              trailing: CircleAvatar(
                backgroundColor: HexColor(newDataList[index]['hexCode']),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: appBarTitle,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(
                () {
                  if (actionIcon.icon == Icons.search) {
                    actionIcon = const Icon(Icons.close);
                    appBarTitle = TextField(
                      controller: _search,
                      autofocus: true,
                      onChanged: onItemChanged,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: "Search...",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    actionIcon = const Icon(Icons.search);
                    appBarTitle = const Text("AppBar Title");
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

String? color2;

String colorname2 = '';

class ChooseColor2Screen extends StatefulWidget {
  const ChooseColor2Screen({
    Key? key,
  }) : super(key: key);

  static const String id = 'selector';

  @override
  State<ChooseColor2Screen> createState() => _ChooseColor2ScreenState();
}

class _ChooseColor2ScreenState extends State<ChooseColor2Screen> {
  @override
  void initState() {
    super.initState();
    _search = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _search.dispose();
  }

  late TextEditingController _search;
  Widget appBarTitle = const Text("Choose Color");
  Icon actionIcon = const Icon(Icons.search);
  List items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/Color.json');
    final data = await json.decode(response);
    setState(() {
      items = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    List newDataList = List.from(items);

    onItemChanged(String value) {
      // print('input');
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: newDataList.length,
        itemBuilder: (context, int index) => ListTile(
          title: InkWell(
            onTap: () {
              colorname2 = newDataList[index]['name'];
              color2 = newDataList[index]['hexCode'];
              print(color2);
              print(colorname2);
              Navigator.pop(context);
            },
            hoverColor: HexColor(newDataList[index]['hexCode']),
            child: ListTile(
              title: Text(newDataList[index]['name']),
              trailing: CircleAvatar(
                backgroundColor: HexColor(newDataList[index]['hexCode']),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff7165e3),
        centerTitle: true,
        title: appBarTitle,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(
                () {
                  if (actionIcon.icon == Icons.search) {
                    actionIcon = const Icon(Icons.close);
                    appBarTitle = TextField(
                      controller: _search,
                      autofocus: true,
                      onChanged: onItemChanged,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: "Search...",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    actionIcon = const Icon(Icons.search);
                    appBarTitle = const Text("AppBar Title");
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

String? color3;

String colorname3 = '';

class ChooseColor3Screen extends StatefulWidget {
  const ChooseColor3Screen({
    Key? key,
  }) : super(key: key);

  static const String id = 'selector';

  @override
  State<ChooseColor3Screen> createState() => _ChooseColor3ScreenState();
}

class _ChooseColor3ScreenState extends State<ChooseColor3Screen> {
  @override
  void initState() {
    super.initState();
    _search = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _search.dispose();
  }

  late TextEditingController _search;
  Widget appBarTitle = const Text("Choose Color");
  Icon actionIcon = const Icon(Icons.search);
  List items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/Color.json');
    final data = await json.decode(response);
    setState(() {
      items = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    List newDataList = List.from(items);

    onItemChanged(String value) {
      // print('input');
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: newDataList.length,
        itemBuilder: (context, int index) => ListTile(
          title: InkWell(
            onTap: () {
              colorname3 = newDataList[index]['name'];
              color3 = newDataList[index]['hexCode'];
              print(color3);
              print(colorname3);
              Navigator.pop(context);
            },
            hoverColor: HexColor(newDataList[index]['hexCode']),
            child: ListTile(
              title: Text(newDataList[index]['name']),
              trailing: CircleAvatar(
                backgroundColor: HexColor(newDataList[index]['hexCode']),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff7165e3),
        centerTitle: true,
        title: appBarTitle,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(
                () {
                  if (actionIcon.icon == Icons.search) {
                    actionIcon = const Icon(Icons.close);
                    appBarTitle = TextField(
                      controller: _search,
                      autofocus: true,
                      onChanged: onItemChanged,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: "Search...",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    actionIcon = const Icon(Icons.search);
                    appBarTitle = const Text("AppBar Title");
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
