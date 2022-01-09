import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:http/http.dart' as http;

class ResultsBottomSheet extends StatefulWidget {
  const ResultsBottomSheet({
    Key? key,
    required this.color,
  }) : super(key: key);
  final String color;

  @override
  State<ResultsBottomSheet> createState() => _ResultsBottomSheetState();
}

class _ResultsBottomSheetState extends State<ResultsBottomSheet> {
  @override
  initState() {
    getColor();
    super.initState();
  }

  Future getColor() async {
    var url = 'https://www.thecolorapi.com/id?hex=${widget.color}';
    var response = await http.get(
      Uri.parse(url),
    );
    var finalresponse = jsonDecode(response.body);
    return finalresponse['name']['value'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor(widget.color),
      ),
      child: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return Text(
                snapshot.data.toString(),
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              );
            }
          },
          future: getColor(),
        ),
      ),
    );
  }
}
