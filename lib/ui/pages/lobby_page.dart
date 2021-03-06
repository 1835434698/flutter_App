import 'package:flutter/material.dart';
import 'package:flutter_app/common/component_index.dart';

import 'order_page.dart';

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

  List<RomeModel> datas;

  @override
  void initState() {
    datas = widget.loginModel.romes;
    // TODO: implement initState
    super.initState();
//    screenWidth = MediaQuery.of(context).size.width;
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
          new Container(
            child: new Container(
              margin: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
              child: new Divider(
                height: 1,
                color: Colours.color_7DC5CB,
              ),
              color: Colours.color_7DC5CB,
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(15, 0, 10, 10),
            child: new Text(
              '包间详情',
              style: new TextStyle(color: Colours.color_737270),
            ),
          ),
          new Row(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: new MaterialButton(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  color: Colours.color_49B2B6,
                  textColor: Colors.white,
                  child: new Text('请点击包间下单'),
                  minWidth: 80,
                  onPressed: () {},
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: new GridView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: datas.length,
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                  //横轴元素个数
                  crossAxisCount: 4,
                  //纵轴间距
                  mainAxisSpacing: 12.0,
                  //横轴间距
                  crossAxisSpacing: 10.0,
//                  //子组件宽高长度比例
                  childAspectRatio: 1.8,
                ),
                itemBuilder: (BuildContext context, int index) {
                  //Widget Function(BuildContext context, int index)
                  return getItemContainer(datas[index]);
                }),
          ),
        ],
      ),
    );
  }

  Widget getItemContainer(RomeModel item) {
    return new GestureDetector(
      onTap: (){
        LogUtil.e("onTap ", tag: tag);

      },
      child: new Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              side: BorderSide(
                color: Colours.color_A2A2A5,
                style: BorderStyle.solid,
                width: 1,
              )),
        ),
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Container(
                      child: Text(
                        "山海关",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
//                  width: 80,
                      alignment: Alignment.center,
                      height: 200,
                      padding: EdgeInsets.fromLTRB(2, 3, 2, 3),
                      decoration: BoxDecoration(
                        color: Colours.color_80CC37,
                        borderRadius:
                        new BorderRadius.vertical(top: Radius.circular(3)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Divider(
              height: 1,
              color: Colours.color_A2A2A5,
            ),
            new Expanded(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Expanded(
                    child: new Container(
                      decoration: BoxDecoration(
                        color: Colours.color_07A73B,
                        borderRadius:
                        new BorderRadius.only(bottomLeft: Radius.circular(3)),
                      ),
                      child: Text(
                        '中午',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      alignment: Alignment.center,
                      height: 200,
//                color: Colours.color_80CC37,
                      padding: EdgeInsets.fromLTRB(2, 3, 2, 3),
                    ),
                  ),
                  new VerticalDivider(
                    width: 1,
                    color: Colours.color_A2A2A5,
                  ),
                  new Expanded(
                    child: new Container(
                      decoration: BoxDecoration(
                        color: Colours.color_07A73B,
                        borderRadius: new BorderRadius.only(
                            bottomRight: Radius.circular(3)),
                      ),
                      child: Text(
                        '下午',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      alignment: Alignment.center,
                      height: 200,
//                  color: Colours.color_80CC37,
                      padding: EdgeInsets.fromLTRB(2, 3, 2, 3),
                    ),
                  ),
//              Text(
//                item.name,
//                style: TextStyle(color: Colors.white, fontSize: 14),
//              ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void refreshAll() {
    LogUtil.e("刷新 ", tag: tag);
    LoginReq _loginReq = new LoginReq(
        Constant.account, Constant.password);
    RequestUtil requestUtil = new RequestUtil();
    requestUtil.getLogin(_loginReq).then((login) {
      widget.loginModel = login;
      setState_();
    }).catchError((error) {
      LogUtil.e("error......" + error.toString(), tag: tag);
    });
  }


  void setState_() {
    setState(() {});
  }
  void loginOut() {
    LogUtil.e("退出 ", tag: tag);
    Navigator.of(context).pop('loginOut');
  }

  void statistics() {
//    NavigatorUtil.pushPage(context, OrderPage(), pageName: "OrderPage");

    DateTime now = new DateTime.now();
    LogUtil.e("statistics ", tag: tag);
    var startTime = now.year.toString()+'-'+now.month.toString()+"-"+now.day.toString()+" 01:00:00";
    var endTime = now.year.toString()+'-'+now.month.toString()+"-"+now.day.toString()+" 23:59:59";
//    OrderListReq orderListReq = new OrderListReq(sellerId: Constant.loginModel.sellerId, startTime: startTime, endTime: endTime, pageNo:  1);
    OrderListReq orderListReq = new OrderListReq();
    orderListReq.setStatus(-2);
    orderListReq.setSellerId(Constant.loginModel.sellerId);
    orderListReq.setStartTime(startTime);
    orderListReq.setEndTime(endTime);

    RequestUtil requestUtil = new RequestUtil();
    requestUtil.getOrderList(orderListReq).then((orderListModel){
      LogUtil.e("orderListModel = " + orderListModel.toString(), tag: tag);
      Navigator.push( context, MaterialPageRoute(
              builder: (_) => OrderPage(orderListModel: orderListModel))
      );
    }).catchError((onError){
      LogUtil.e("onError......" + onError.toString(), tag: tag);
    });
  }
}
