import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../components/background.dart';
import '../components/k_button.dart';
import 'object_list.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: KBackground(
          horizontalPadding: 50,
          fullHeight: true,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(),
                const Image(image: AssetImage("assets/images/title.png")),
                const SizedBox(),
                Text("introText".tr(),
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.5,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none)),
                Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                    child: KButtonOutlined(
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ObjectList()))
                      },
                      text: "start".tr(),
                    )),
              ])),
    );
  }
}
