import 'package:flutter/material.dart';

import '../components/background.dart';
import '../components/target_card.dart';
import '../helpers/object_provider.dart';

class ObjectList extends StatefulWidget {
  const ObjectList({super.key});

  @override
  State<ObjectList> createState() => ObjectListState();
}

class ObjectListState extends State<ObjectList> {
  String activeObjectKey = "";

  @override
  void initState() {
    super.initState();
    activeObjectKey = "";
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final objects = ObjectProvider.getObjects();
    final scrollController = ScrollController();
    final buttons = objects
        .asMap()
        .entries
        .map<Widget>((value) => Column(
              children: [
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      side: BorderSide(
                          width: 1.0,
                          color: activeObjectKey == value.value.key
                              ? Colors.white
                              : Colors.transparent),
                    ),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                  width: 40,
                                  height: 40,
                                  image: AssetImage(
                                      "assets/images/icons/${value.value.key}.png")),
                              const SizedBox(width: 10, height: 0),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: Text(value.value.title,
                                      maxLines: 2,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20)))
                            ])),
                    onPressed: () async {
                      setState(() {
                        activeObjectKey = value.value.key;
                      });
                      await scrollController.animateTo(value.key * 71.00,
                          curve: Curves.ease,
                          duration: const Duration(seconds: 1));
                    }),
                activeObjectKey == value.value.key
                    ? TargetCard(object: value.value)
                    : const SizedBox()
              ],
            ))
        .toList();

    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.black),
        backgroundColor: Colors.transparent,
        body: KBackground(
          horizontalPadding: 20,
          fullHeight: true,
          child: ListView(controller: scrollController, children: buttons),
        ));
  }
}
