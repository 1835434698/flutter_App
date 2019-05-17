import 'package:flutter/material.dart';
import 'package:flutter_app/common/component_index.dart';
import 'package:flutter_app/ui/pages/page_index.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>{
  String tag = "LoginPage";
  TextEditingController _phone_controller = TextEditingController();
  TextEditingController _password_controller = TextEditingController();
  FocusNode _phone_focusNode = FocusNode();
  FocusNode _password_focusNode = FocusNode();
  bool _phone_close =  false;
  bool _password_close =  false;
  bool _sye_ico =  false;
  bool check =  true;
//  VoidCallback _loginBtn = VoidCallback();

  @override
  void initState() {
   initListener();
    super.initState();
  }


  void setState_(){
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    LogUtil.e("build...... ", tag: tag);
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(IntlUtil.getString(context, Ids.titleLogin)),
//        centerTitle: true,
//      ),
      body: new ListView(children: <Widget>[
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
                      Utils.getImgPath(_phone_focusNode.hasFocus == true ? 'login_username_focused': 'login_username'),
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
                        onSubmitted: (term){
                          LogUtil.e("onSubmitted......term = "+term, tag: tag);
                          FocusScope.of(context).requestFocus(_password_focusNode);
                        },
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: "手机号",
                        ),
                        onChanged: (val){
                          if(val == ""){
                            _phone_close = false;
                          }else{
                            _phone_close = true;
                          }
                          setState_();
                        },
                      )),
                  new Padding(
                    padding: new EdgeInsets.fromLTRB(3.0, 10.0, 3.0, 0.0),
                    child: new InkWell(
                      onTap: (){
                        _phone_controller.text = "";
                        setState_();
                      },
                      child: new Image.asset(
                        Utils.getImgPath(_phone_close == true?'android_delete_dark':''),
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
                  )
              ),
            ],
          )
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
                        Utils.getImgPath(_password_focusNode.hasFocus == true ? 'ico_password_onfocus':'ico_password_losefocus'),
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
                          onChanged: (val){
                            if(val == ""){
                              _password_close = false;
                            }else{
                              _password_close = true;
                            }
                            setState_();
                          },
                        )),
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(3.0, 10.0, 8.0, 0.0),
                      child: new InkWell(
                        onTap: (){
                          _password_controller.text = "";
                          setState_();
                        },
                        child: new Image.asset(
                          Utils.getImgPath(_password_close == true?'android_delete_dark':''),
                          width: 13.0,
                          height: 13.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(7.0, 10.0, 3.0, 0.0),
                      child: new InkWell(
                        onTap: (){
                          _sye_ico = !_sye_ico;
                          LogUtil.e("onChanged......_sye_ico = "+_sye_ico.toString(), tag: tag);
                          setState_();
                        },
                        child: new Image.asset(
                          Utils.getImgPath(_sye_ico == true ?'password_shown':'password_hidden'),
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
                  )
              ),
            ],
          )
        ),
        new Container(
          margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
          child: new Row(
            children: <Widget>[
              new Container(
                child: new CheckboxListTile(
                value: check,
                onChanged: (bool val){
//                  setState(() {
                    check = !check;
//                  });
                  setState_();
                },
              ),
                width: 30,
              ),
              new Expanded(
                  child: new Text('记住账号与密码',
                  style: TextStyle(color: Colours.blue_1184fa),)
              ),
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
                LogUtil.e("onPressed......"+_phone_controller.text, tag: tag);
                MainBloc mainBloc = new MainBloc();

                List<LoginModel> lists = mainBloc.getLoginData(_phone_controller.text, _password_controller.text) as List<LoginModel>;
                LogUtil.e("onPressed......"+_phone_controller.text, tag: tag);

              },
            ),
        )
      ],),
    );
  }

  void initListener() {
    _phone_focusNode.addListener((){
      LogUtil.e("onChanged......_phone_focusNode.hasFocus = "+_phone_focusNode.hasFocus.toString(), tag: tag);
      setState_();
    });
    _password_focusNode.addListener((){
      LogUtil.e("onChanged......_password_focusNode.hasFocus = "+_password_focusNode.hasFocus.toString(), tag: tag);
      setState_();
    });
  }

}


