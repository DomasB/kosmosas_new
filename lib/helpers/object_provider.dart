import 'package:easy_localization/easy_localization.dart';
import 'package:latlong2/latlong.dart';

enum DataType { text, audio, video, gallery, panorama, model }

class ObjectOfInterest {
  String key;
  String title;
  LatLng coordinates;
  late List<ObjectTarget> targets;

  ObjectOfInterest(this.key, this.coordinates, List<ObjectTarget> targets)
      : title = key.tr() {
    this.targets = targets.map((t) => mapObjectTarget(t, key)).toList();
  }
}

ObjectTarget mapObjectTarget(ObjectTarget target, String objectKey) {
  if (target.key == null || target.key!.isEmpty) {
    target.key = objectKey;
  }
  return target;
}

class ObjectProvider {
  static List<ObjectOfInterest> getObjects() {
    return <ObjectOfInterest>[
      ObjectOfInterest(
          'andrioniskis', const LatLng(55.596903, 25.044822), <ObjectTarget>[
        ObjectTarget(
            [DataType.audio, DataType.text, DataType.video, DataType.gallery],
            numberOfImages: 3,
            coverImage: "assets/images/gallery/andrioniskis_2.webp")
      ]),
      ObjectOfInterest(
          'birutesKalnas', const LatLng(55.905975, 21.054191), <ObjectTarget>[
        ObjectTarget([
          DataType.audio,
          DataType.text,
          DataType.video,
          DataType.gallery,
          DataType.panorama,
          DataType.model
        ],
            numberOfImages: 2,
            coverImage: "assets/images/birutesKalnas_cover.jpg")
      ]),
      ObjectOfInterest('ciurlionioObservatorija',
          const LatLng(54.682780, 25.253001), <ObjectTarget>[
        ObjectTarget([
          DataType.audio,
          DataType.text,
          DataType.video,
          DataType.gallery,
          DataType.panorama
        ],
            coverImage: "assets/images/gallery/ciurlionioObservatorija_2.webp",
            numberOfPanoramas: 3,
            numberOfImages: 4)
      ]),
      ObjectOfInterest(
        'etnokosmologijosMuziejus',
        const LatLng(55.314944, 25.556406),
        <ObjectTarget>[
          ObjectTarget([DataType.audio, DataType.text, DataType.model],
              key: 'jupiter', coverImage: "assets/images/jupiter_cover.jpg"),
          ObjectTarget([DataType.audio, DataType.text, DataType.model],
              key: 'mars', coverImage: "assets/images/mars_cover.jpg"),
          ObjectTarget([DataType.audio, DataType.text, DataType.model],
              key: 'neptune', coverImage: "assets/images/neptune_cover.jpg"),
          ObjectTarget([DataType.audio, DataType.text, DataType.model],
              key: 'saturn', coverImage: "assets/images/saturn_cover.jpg"),
          ObjectTarget([DataType.audio, DataType.text, DataType.model],
              key: 'venus', coverImage: "assets/images/venus_cover.jpg"),
        ],
      ),
      ObjectOfInterest(
          'nanoAvionics', const LatLng(54.750731, 25.265397), <ObjectTarget>[
        ObjectTarget(
            [DataType.audio, DataType.text, DataType.video, DataType.gallery],
            numberOfImages: 3,
            coverImage: "assets/images/nanoAvionics_cover.jpg")
      ]),
      ObjectOfInterest('observatorijaKaune',
          const LatLng(54.883465, 23.865802), <ObjectTarget>[
        ObjectTarget([
          DataType.audio,
          DataType.text,
          DataType.video,
          DataType.gallery,
          DataType.panorama
        ],
            coverImage: "assets/images/gallery/observatorijaKaune_3.webp",
            numberOfPanoramas: 3,
            numberOfImages: 3)
      ]),
      ObjectOfInterest('saulesLaikrodziai',
          const LatLng(54.683113, 25.287015), <ObjectTarget>[
        ObjectTarget([DataType.audio, DataType.text],
            coverImage: "assets/images/saulesLaikrodziai_cover.jpg")
      ]),
      ObjectOfInterest(
          'struve', const LatLng(55.902302, 25.436916), <ObjectTarget>[
        ObjectTarget([
          DataType.audio,
          DataType.text,
          DataType.video,
          DataType.gallery,
          DataType.panorama
        ], coverImage: "assets/images/gallery/struve_3.webp", numberOfImages: 4)
      ]),
      ObjectOfInterest('tekstilesInstitutas',
          const LatLng(54.917203, 23.906369), <ObjectTarget>[
        ObjectTarget([DataType.audio, DataType.text, DataType.video],
            coverImage: "assets/images/tekstilesInstitutas_cover.jpg")
      ]),
      ObjectOfInterest('teorinesFizikosInstitutas',
          const LatLng(54.694700, 25.265019), <ObjectTarget>[
        ObjectTarget([DataType.audio, DataType.text],
            coverImage: "assets/images/teorinesFizikosInstitutas_cover.jpg")
      ]),
      ObjectOfInterest(
          'valiulioAkmuo', const LatLng(55.343241, 25.392185), <ObjectTarget>[
        ObjectTarget([DataType.audio, DataType.text, DataType.gallery],
            coverImage: "assets/images/gallery/valiulioAkmuo_4.webp",
            numberOfImages: 5)
      ]),
      ObjectOfInterest(
          'vepriai', const LatLng(55.150075, 24.574599), <ObjectTarget>[
        ObjectTarget([
          DataType.audio,
          DataType.text,
          DataType.video,
          DataType.gallery,
          DataType.model
        ], coverImage: "assets/images/vepriai_cover.jpg", numberOfImages: 3)
      ]),
      ObjectOfInterest(
          'vuObservatorija', const LatLng(54.682461, 25.286841), <ObjectTarget>[
        ObjectTarget(
            [DataType.audio, DataType.text, DataType.video, DataType.panorama],
            coverImage: "assets/images/vuObservatorija_cover.jpg",
            numberOfPanoramas: 4)
      ]),
      ObjectOfInterest(
          'zemaitkiemis', const LatLng(55.304814, 24.976888), <ObjectTarget>[
        ObjectTarget([
          DataType.audio,
          DataType.text,
          DataType.video,
          DataType.gallery,
          DataType.model
        ],
            coverImage: "assets/images/zemaitkiemis_cover.jpg",
            numberOfImages: 2)
      ])
    ];
  }
}

class ObjectTarget {
  String? key;
  List<DataType> dataTypes;
  int numberOfPanoramas;
  int numberOfImages;
  String coverImage;
  ObjectTarget(this.dataTypes,
      {String this.key = '',
      this.numberOfPanoramas = 1,
      this.numberOfImages = 1,
      this.coverImage = ""});
}
