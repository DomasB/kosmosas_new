import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

import '../helpers/object_provider.dart';
import '../main.dart';
import 'target_page.dart';

enum UnityMode { Scan, Model, Video }

class UnityPage extends StatefulWidget {
  UnityPage(
      {super.key,
      required this.object,
      required this.mode,
      this.targetName = ''});

  ObjectOfInterest object;
  UnityMode mode;
  String targetName;

  @override
  UnityPageState createState() =>
      UnityPageState(object: object, mode: mode, targetName: targetName);
}

class UnityPageState extends State<UnityPage> with RouteAware {
  UnityPageState(
      {required this.object, required this.mode, required this.targetName});
  ObjectOfInterest object;
  UnityMode mode;
  String targetName;
  late UnityWidgetController _unityWidgetController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          for (var o in object.targets) {
            await _unityWidgetController.postMessage(o.key!, 'Scan', "");
          }
          return true;
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
            ),
            body: SafeArea(
              bottom: false,
              child: UnityWidget(
                  onUnityCreated: onUnityCreated,
                  onUnityMessage: (message) =>
                      openTargetList(context, message.toString()),
                  unloadOnDispose: true),
            )));
  }

  //Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) async {
    _unityWidgetController = controller;
    var mode = this.mode.toString().split('.')[1];
    for (var o in object.targets) {
      await _unityWidgetController.postMessage(o.key!, mode, "");
    }
    if (this.mode == UnityMode.Video) {
      await _unityWidgetController.postMessage(targetName, 'ShowVideo', "");
    }
    if (this.mode == UnityMode.Model) {
      await _unityWidgetController.postMessage(targetName, 'Show3D', "");
    }
  }

  void openTargetList(BuildContext context, String message) {
    if (mode != UnityMode.Scan) {
      return;
    }
    var target = object.targets.firstWhere((o) => o.key == message);
    // ignore: unnecessary_null_comparison
    if (target != null &&
        ModalRoute.of(context) != null &&
        ModalRoute.of(context)!.isCurrent) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  TargetPage(object: object, objectTarget: target)));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void didPopNext() {
    for (var o in object.targets) {
      _unityWidgetController.postMessage(o.key!, 'Scan', null);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _unityWidgetController.dispose();
    super.dispose();
  }
}
