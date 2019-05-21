import 'package:flutter/material.dart';
import 'package:flutter_app/common/component_index.dart';

class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            child: Image.asset(Utils.getImgPath('ico_first_bg')),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(10, 50, 10, 50),
            height: 40,
            width: 180,
            child: InkWell(
              onTap: (){
                LogUtil.e("toMain", tag: "LoginPage");
              },
              child: Image.asset(Utils.getImgPath('ico_look')),
            ),
          ),
        ],
      ),
    );
  }
}