library jsonview;

import 'package:flutter/material.dart';

class JsonToWidget extends StatelessWidget {
  final Map data;
  const JsonToWidget(
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return jsonToWidget(data);
  }
}

Widget jsonToWidget(Map? data) {
  data ??= {};
  if (data["@type"] is String) {
    String type = data["@type"];
    if (RegExp(r"^(helloWorld)$", caseSensitive: false).hasMatch(type)) {}

    if (RegExp(r"^(Container)$", caseSensitive: false).hasMatch(type)) {
      return Container(
        child: jsonToWidget(data["child"]),
      );
    }
    if (RegExp(r"^(Center)$", caseSensitive: false).hasMatch(type)) {
      return Center(
        child: jsonToWidget(data["child"]),
      );
    }

    if (RegExp(r"^(Text)$", caseSensitive: false).hasMatch(type)) {
      return Text("${data["data"]}");
    }

    if (RegExp(r"^(Column)$", caseSensitive: false).hasMatch(type)) {
      late List<Widget> children = [];
      if (data["children"] is List<Map>) {
        for (var i = 0; i < (data["children"] as List<Map>).length; i++) {
          // ignore: non_constant_identifier_names
          var loop_data = (data["children"] as List<Map>)[i];
          try {
            children.add(jsonToWidget(loop_data));
          } catch (e) {}
        }
      }
      return Column(
        children: children,
      );
    }
    if (RegExp(r"^(Row)$", caseSensitive: false).hasMatch(type)) {
      late List<Widget> children = [];
      if (data["children"] is List<Map>) {
        for (var i = 0; i < (data["children"] as List<Map>).length; i++) {
          // ignore: non_constant_identifier_names
          var loop_data = (data["children"] as List<Map>)[i];
          try {
            children.add(jsonToWidget(loop_data));
          } catch (e) {}
        }
      }
      return Row(
        children: children,
      );
    }
  }
  return Container();
}
