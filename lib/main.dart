import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_app/common/component_index.dart';
import 'package:flutter_app/data/net/dio_util.dart';
import 'package:flutter_app/ui/pages/main_page.dart';
import 'package:flutter_app/ui/pages/page_index.dart';

void main() => runApp(BlocProvider<ApplicationBloc>(
      bloc: ApplicationBloc(),
      child: BlocProvider(child: MyApp(), bloc: MainBloc()),
    ));

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Locale _locale;
  Color _themeColor = Colours.app_main;

  @override
  void initState() {
    LogUtil.e("initState......", tag: "tangzy");
    super.initState();
    setLocalizedValues(localizedValues);
    _init();
    _initAsync();
    _initListener();
  }

  @override
  void didChangeDependencies() {
    LogUtil.e("didChangeDependencies......", tag: "tangzy");
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    LogUtil.e("deactivate......", tag: "tangzy");
    super.deactivate();
  }
  @override
  void didUpdateWidget(MyApp oldWidget) {
    LogUtil.e("didUpdateWidget......", tag: "tangzy");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void reassemble() {
    LogUtil.e("reassemble......", tag: "tangzy");
    super.reassemble();
  }

  void _init() {
//    DioUtil.openDebug();
    Options options = DioUtil.getDefOptions();
    options.baseUrl = Constant.server_address;
    HttpConfig config = new HttpConfig(options: options);
    DioUtil().setConfig(config);
  }

  void _initAsync() async {
    await SpUtil.getInstance();
    if (!mounted) return;
    _loadLocale();
  }

  void _initListener() {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.appEventStream.listen((value) {
      _loadLocale();
    });
  }

  void _loadLocale() {
    setState(() {
      LanguageModel model =
          SpHelper.getObject<LanguageModel>(Constant.keyLanguage);
      if (model != null) {
        _locale = new Locale(model.languageCode, model.countryCode);
      } else {
        _locale = null;
      }

      String _colorKey = SpHelper.getThemeColor();
      if (themeColorMap[_colorKey] != null)
        _themeColor = themeColorMap[_colorKey];
    });
  }

  @override
  void dispose() {
    LogUtil.e("dispose......", tag: "tangzy");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.e("build......", tag: "tangzy");
    return new MaterialApp(
      routes: {
//        '/MainPage': (ctx) => MainPage(),
        '/WelcomPage': (ctx) => WelcomePage(),
        '/LoginPage': (ctx) => LoginPage(),
      },
      home: new SplashPage(),
      theme: ThemeData.light().copyWith(
        primaryColor: _themeColor,
        accentColor: _themeColor,
        indicatorColor: Colors.white,
      ),
      locale: _locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        CustomLocalizations.delegate
      ],
      supportedLocales: CustomLocalizations.supportedLocales,
    );
  }
}
