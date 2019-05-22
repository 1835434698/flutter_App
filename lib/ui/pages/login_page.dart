import 'package:flutter/material.dart';
import 'package:flutter_app/common/component_index.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  String tag = "LoginPage";
  TextEditingController _phone_controller = TextEditingController();
  TextEditingController _password_controller = TextEditingController();
  FocusNode _phone_focusNode = FocusNode();
  FocusNode _password_focusNode = FocusNode();
  bool _phone_close = false;
  bool _password_close = false;
  bool _sye_ico = false;
  bool check = true;

//  VoidCallback _loginBtn = VoidCallback();

  @override
  void initState() {
    initListener();
    initFromCache();
    super.initState();
  }

  void setState_() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.e("build...... ", tag: tag);
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(IntlUtil.getString(context, Ids.titleLogin)),
//        centerTitle: true,
//      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 180.0,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 40),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Card(
                  color: Colours.transparent_00,
                  elevation: 0.0,
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.all(Radius.circular(6.0))
//                ),
                  child: new Image.asset(
                    Utils.getImgPath("ico_logo"),
                    width: 90.0,
                    fit: BoxFit.fill,
                    height: 90.0,
                  ),
                ),
                Gaps.vGap5,
              ],
            ),
          ),
          new Container(
              margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
              child: new Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      new Padding(
                        padding: new EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
                        child: new Image.asset(
                          Utils.getImgPath(_phone_focusNode.hasFocus == true
                              ? 'login_username_focused'
                              : 'login_username'),
                          width: 18.0,
                          height: 18.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      new Expanded(
                          child: new TextField(
                        controller: _phone_controller,
                        focusNode: _phone_focusNode,
                        maxLines: 1,
                        textInputAction: TextInputAction.next,
                        onSubmitted: (term) {
                          LogUtil.e("onSubmitted......term = " + term,
                              tag: tag);
                          FocusScope.of(context)
                              .requestFocus(_password_focusNode);
                        },
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: "手机号",
                        ),
                        onChanged: (val) {
                          if (val == "") {
                            _phone_close = false;
                          } else {
                            _phone_close = true;
                          }
                          setState_();
                        },
                      )),
                      new Padding(
                        padding: new EdgeInsets.fromLTRB(3.0, 10.0, 3.0, 0.0),
                        child: new InkWell(
                          onTap: () {
                            _phone_controller.text = "";
                            setState_();
                          },
                          child: new Image.asset(
                            Utils.getImgPath(_phone_close == true
                                ? 'android_delete_dark'
                                : ''),
                            width: 13.0,
                            height: 13.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Container(
                      margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                      child: new Divider(
                        height: 1,
                        color: Colours.green_62,
                      )),
                ],
              )),
          new Container(
              margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
              child: new Column(
                children: <Widget>[
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Padding(
                          padding: new EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
                          child: new Image.asset(
                            Utils.getImgPath(
                                _password_focusNode.hasFocus == true
                                    ? 'ico_password_onfocus'
                                    : 'ico_password_losefocus'),
                            width: 18.0,
                            height: 18.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                        new Expanded(
                            child: new TextField(
                          controller: _password_controller,
                          focusNode: _password_focusNode,
                          obscureText: !_sye_ico,
                          maxLines: 1,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: "密码",
                          ),
                          onChanged: (val) {
                            if (val == "") {
                              _password_close = false;
                            } else {
                              _password_close = true;
                            }
                            setState_();
                          },
                        )),
                        new Padding(
                          padding: new EdgeInsets.fromLTRB(3.0, 10.0, 8.0, 0.0),
                          child: new InkWell(
                            onTap: () {
                              _password_controller.text = "";
                              setState_();
                            },
                            child: new Image.asset(
                              Utils.getImgPath(_password_close == true
                                  ? 'android_delete_dark'
                                  : ''),
                              width: 13.0,
                              height: 13.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.fromLTRB(7.0, 10.0, 3.0, 0.0),
                          child: new InkWell(
                            onTap: () {
                              _sye_ico = !_sye_ico;
                              LogUtil.e(
                                  "onChanged......_sye_ico = " +
                                      _sye_ico.toString(),
                                  tag: tag);
                              setState_();
                            },
                            child: new Image.asset(
                              Utils.getImgPath(_sye_ico == true
                                  ? 'password_shown'
                                  : 'password_hidden'),
                              width: 13.0,
                              height: 13.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ]),
                  new Container(
                      margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                      child: new Divider(
                        height: 1,
                        color: Colours.green_62,
                      )),
                ],
              )),
          new Container(
            margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
            child: new Row(
              children: <Widget>[
                new Container(
                  child: new Checkbox(
                    value: check,
                    onChanged: (bool val) {
                      check = !check;
                      setState_();
                    },
                  ),
                  width: 30,
                  height: 30,
                ),
                new Expanded(
                    child: new Text(
                  '记住账号与密码',
                  style: TextStyle(color: Colours.blue_1184fa),
                )),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 3.0),
            child: new MaterialButton(
              color: Colours.green_53B890,
              textColor: Colours.gray_33,
              child: new Text('登录'),
              onPressed: () {
                LogUtil.e("onPressed......check = " + check.toString(),
                    tag: tag);
                if (check) {
                  saveMethodName(
                      _phone_controller.text, _password_controller.text);
                } else {
                  saveMethodName("", "");
                }

                if (_phone_controller.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: "手机号不能为空1", toastLength: Toast.LENGTH_SHORT);
                  return;
                }
                if (_password_controller.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: "密码不能为空", toastLength: Toast.LENGTH_SHORT);
                  return;
                }
                LoginReq _loginReq = new LoginReq(
                    _phone_controller.text, _password_controller.text);

                _getBatteryLevel().then((onValue) {
                  LogUtil.e("onValue = " + onValue, tag: tag);
                });
//                _loginReq.toString()
                LogUtil.e(
                    "_loginReq.toJson().toString() = " + _loginReq.toString(),
                    tag: tag);

                _getEncryptionAES(_loginReq.toString()).then((onValue) {
                  LogUtil.e("onValue2 = " + onValue, tag: tag);
                  ReqData reqData = new ReqData(onValue);
                  RequestUtil mainBloc = new RequestUtil();
                  mainBloc.getLogin(reqData).then((login) {
                    LogUtil.e("getLogin....2.." + login.toString(),
                        tag: 'LoginPage');
                    Navigator.of(context).pushReplacementNamed('/WelcomPage');
//                  NavigatorUtil.pushPage(context, WelcomePage(),
//                      pageName: "WelcomePage");
                  }).catchError((error) {
                    LogUtil.e("error......" + error.toString(), tag: tag);
//                  Fluttertoast.showToast(msg: error.toString(),
//                      toastLength: Toast.LENGTH_SHORT);
                  });
                });
              },
            ),
          )
        ],
      ),
    );
  }

  void initListener() {
    _phone_focusNode.addListener(() {
      LogUtil.e(
          "onChanged......_phone_focusNode.hasFocus = " +
              _phone_focusNode.hasFocus.toString(),
          tag: tag);
      setState_();
    });
    _password_focusNode.addListener(() {
      LogUtil.e(
          "onChanged......_password_focusNode.hasFocus = " +
              _password_focusNode.hasFocus.toString(),
          tag: tag);
      setState_();
    });
  }

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  //保存数据
  void saveMethodName(String username, String password) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString("username", username);
    prefs.setString("password", password);
  }

//获取数据
  void initFromCache() async {
    SharedPreferences prefs = await _prefs;
    _phone_controller.text = prefs.getString("username");
    _password_controller.text = prefs.getString("password");
    setState_();
  }

  static const platform = const MethodChannel("tangzy.flutter.io/java");

  Future<String> _getBatteryLevel() async {
    String batteryLevel;
    try {
      // 在通道上调用此方法
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    return batteryLevel;
  }

  Future<String> _getEncryptionAES(String params) async {
    String result;
    try {
//      Map<String, String> map = { "params": params };
      Map<String, String> map = {"params": params};
      // 在通道上调用此方法
      result = await platform.invokeMethod('getEncryptionAES', map);
    } on PlatformException catch (e) {
      result = "Failed to get battery level: '${e.message}'.";
    }
    return result;
  }
}
