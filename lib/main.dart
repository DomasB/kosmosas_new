import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'components/k_button.dart';
import 'pages/main_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('lt', 'LT')],
      fallbackLocale: const Locale('en', 'US'),
      path: 'assets/translations',
      child: const MaterialApp(home: KosmosasApp())));
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class KosmosasApp extends StatelessWidget {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  const KosmosasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kosmosas',
        theme: ThemeData(fontFamily: 'Sans Serif'),
        localizationsDelegates: context.localizationDelegates,
        navigatorObservers: [routeObserver],
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.black,
          ),
          body: SafeArea(
              bottom: false,
              child: Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage("assets/images/background.jpg"),
                        fit: BoxFit.fitWidth)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Image(image: AssetImage("assets/images/title.png")),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 40),
                        child: Column(
                          children: [
                            KButtonOutlined(
                              onPressed: () => setLtAndNavigate(context),
                              text: "LT",
                            ),
                            const SizedBox(height: 30),
                            KButtonOutlined(
                                onPressed: () => setEnAndNavigate(context),
                                text: "EN",
                                variation: KButtonVariation.bottom),
                          ],
                        ))
                  ],
                ),
              )),
        ));
  }

  Future<void> setLtAndNavigate(BuildContext context) async {
    await context.setLocale(const Locale('lt', 'LT'));
    Future.delayed(const Duration(milliseconds: 100), () {
      Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (context, _, __) => const MainMenu(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero));
    });
  }

  Future<void> setEnAndNavigate(BuildContext context) async {
    await context.setLocale(const Locale('en', 'US'));
    Future.delayed(const Duration(milliseconds: 100), () {
      Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (context, _, __) => const MainMenu(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero));
    });
  }
}
