import 'package:flutter/material.dart';
import 'package:flutter_app/common/component_index.dart';
import 'package:flutter_app/ui/pages/page_index.dart';

class WelcomePage extends StatefulWidget{
  LoginModel loginModel;

  WelcomePage({@required this.loginModel});

  @override
  State<StatefulWidget> createState() {
    return new WelcomPageState();
  }
}

class WelcomPageState extends State<WelcomePage>{
  String imageUrl="";

  @override
  void initState() {
    getPic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.e("build -> imageUrl = "+imageUrl, tag: "tangzy");
    return new WillPopScope(child: new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            child: new CachedNetworkImage(imageUrl: imageUrl,
            placeholder: (context, url) => new Image.asset(Utils.getImgPath('ico_first_bg')),),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(10, 50, 10, 50),
            height: 40,
            width: 180,
            child: InkWell(
              onTap: (){
                LogUtil.e("toLobby", tag: "tangzy");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => LobbyPage(loginModel: widget.loginModel))).then((message){
                  LogUtil.e("onResult -> message = "+message, tag: "tangzy");
                  Navigator.of(context).pop(message);
                });
              },
              child: Image.asset(Utils.getImgPath('ico_look')),
            ),
          ),
        ],
      ),
    ), onWillPop: onWillBack);
  }

  Future<bool> onWillBack() async{
    LogUtil.e("onWillBack", tag: "tangzy");
    toPhoneHome();

    return new Future.value(false);
  }

  void toPhoneHome(){
    Constant.platform.invokeMethod('toPhoneHome');
  }



  void getPic(){
    ImageReq imageReq;
    if(widget.loginModel.type == 3){
      imageReq = new ImageReq(42);
    }else{
      imageReq = new ImageReq(43);
    }
    RequestUtil requestUtil = new RequestUtil();
    requestUtil.getImage(imageReq).then((value){
      WelcomeModel welcomeModel = value;
      imageUrl = welcomeModel.imageList[0].imageUrl;
      LogUtil.e(         "imageUrl = " +imageUrl,          tag: "tangzy");
      setState(() {

      });
    });

  }

}