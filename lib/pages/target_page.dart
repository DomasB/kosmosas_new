import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../components/k_button.dart';
import '../helpers/object_provider.dart';
import 'gallery.dart';
import 'player_page.dart';
import 'panorama.dart';
import 'text_page.dart';
import 'unity_page.dart';

class TargetPage extends StatelessWidget {
  TargetPage({super.key, required this.object, required this.objectTarget});
  final ObjectOfInterest object;
  final ObjectTarget objectTarget;

  final Map<DataType, IconData> iconByDataType = {
    DataType.audio: Icons.volume_up,
    DataType.text: Icons.abc,
    DataType.video: Icons.video_camera_back_outlined,
    DataType.gallery: Icons.photo,
    DataType.panorama: Icons.threesixty_sharp,
    DataType.model: Icons.view_in_ar
  };

  List<Widget> getButtons(BuildContext context) {
    return objectTarget.dataTypes
        .map((o) => KButtonOutlined(
            onPressed: () => {
                  if (o == DataType.panorama)
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PanoramaPage(target: objectTarget)))
                    }
                  else if (o == DataType.gallery)
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GalleryPage(target: objectTarget)))
                    }
                  else if (o == DataType.text)
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TextPage(target: objectTarget)))
                    }
                  else if (o == DataType.audio)
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayerPage(
                                    target: objectTarget,
                                    language: EasyLocalization.of(context)
                                            ?.locale
                                            .toString()
                                            .split("_")[0] ??
                                        '',
                                  )))
                    }
                  else if (o == DataType.video)
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UnityPage(
                                    object: object,
                                    mode: UnityMode.Video,
                                    targetName: objectTarget.key!,
                                  )))
                    }
                  else if (o == DataType.model)
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UnityPage(
                                    object: object,
                                    mode: UnityMode.Model,
                                    targetName: objectTarget.key!,
                                  )))
                    }
                },
            icon: Icon(
              iconByDataType[o],
              color: Colors.white,
              size: 40,
            )))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: getButtons(context)),
        ));
  }
}
