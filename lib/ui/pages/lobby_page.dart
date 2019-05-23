import 'package:flutter/material.dart';
import 'package:flutter_app/common/component_index.dart';

class LobbyPage extends StatefulWidget {
  LoginModel loginModel;

  LobbyPage({this.loginModel});

  @override
  State<StatefulWidget> createState() {
    return new LobbyPageState();
  }
}

class LobbyPageState extends State<LobbyPage> {
  String tag = "LobbyPage";
  List<String> datas;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datas = getDataList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
//        title: new Text(IntlUtil.getString(context, )),
        title: new Text(
          widget.loginModel.sellerInfo.sellerName.isNotEmpty
              ? widget.loginModel.sellerInfo.sellerName
              : "大堂",
          style: new TextStyle(color: Colors.black),
        ),
        backgroundColor: Colours.color_EAEAEA,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before,
            color: Colours.green_62,
            size: 38,
          ),
          onPressed: (() {
            Navigator.pop(context);
          }),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.more_horiz,
              size: 28,
            ),
            onPressed: null,
          )
        ],
      ),
      body: new ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: new Row(
              children: <Widget>[
                new InkWell(
                  child: new Image.asset(
                    Utils.getImgPath('ico_refresh'),
                    width: 30,
                  ),
                  onTap: refreshAll,
                ),
                new Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: new MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    color: Colours.color_49B2B6,
                    textColor: Colors.white,
                    child: new Text('统计汇总'),
                    onPressed: statistics,
                  ),
                ),
                new MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  color: Colours.color_49B2B6,
                  textColor: Colors.white,
                  child: new Text('退出'),
                  onPressed: loginOut,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          new GridView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: datas.length,
              //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                  crossAxisCount: 3,
                  //纵轴间距
                  mainAxisSpacing: 20.0,
                  //横轴间距
                  crossAxisSpacing: 10.0,
                  //子组件宽高长度比例
                  childAspectRatio: 1.0),
              itemBuilder: (BuildContext context, int index) {
                //Widget Function(BuildContext context, int index)
                return getItemContainer(datas[index]);
              }),
        ],
      ),
    );
  }

  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(i.toString());
    }
    return list;
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(String item) {
    return Container(
      width: 5.0,
      height: 5.0,
      alignment: Alignment.center,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Colors.blue,
    );
  }

  void refreshAll() {
    LogUtil.e("刷新 ", tag: tag);
  }

  void loginOut() {
    LogUtil.e("退出 ", tag: tag);
    Navigator.of(context).pop('loginOut');
  }

  void statistics() {
    LogUtil.e("statistics ", tag: tag);
  }
}
