import 'package:flutter/material.dart';
import 'package:flutter_app/common/component_index.dart';
import 'package:flutter_app/ui/pages/page_index.dart';

class ListPage extends StatefulWidget{
  LoginModel loginModel;
  ListPage({this.loginModel});

  @override
  State<StatefulWidget> createState() {
    return new LobbyPageState();
  }

}

class ListPageState extends State<ListPage>{
  String tag = "ListPage";
  RefreshController _refreshController;

  var _items = [];

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    // 如果你需要开始就请求一次刷新
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshController.requestRefresh();
    });
  }

  void _onRefresh(){
    LogUtil.e("_onRefresh ", tag: tag);
    _items.clear();
    var length = _items.length;
    for(int i=length+1; i < length+15; i++){
      _items.add(Model('id:'+i.toString(), "title:"+i.toString(), "pic:"+i.toString(), i,
          i, i, "des:"+i.toString(), "lunar:"+i.toString()));
    }
    setState(() {

    });
    _refreshController.refreshCompleted();

    /*.  after the data return,
        use _refreshController.refreshComplete() or refreshFailed() to end refreshing
   */
  }

  void _onLoading(){
    LogUtil.e("_onLoading ", tag: tag);
    var length = _items.length;
    for(int i=length+1; i < length+15; i++){
      _items.add(Model('id:'+i.toString(), "title:"+i.toString(), "pic:"+i.toString(), i,
          i, i, "des:"+i.toString(), "lunar:"+i.toString()));
    }
    setState(() {

    });
    _refreshController.loadComplete();
    /*
        use _refreshController.loadComplete() or loadNoData() to end loading
   */
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
//        title: new Text(IntlUtil.getString(context, )),
        title: new Text(
            widget.loginModel.sellerInfo.sellerName.isNotEmpty ?widget.loginModel.sellerInfo.sellerName: "大堂",
          style: new TextStyle(color: Colors.black),
        ),
        backgroundColor: Colours.color_EAEAEA,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.navigate_before,
            color: Colours.green_62,
              size: 38,
            ),
            onPressed: ((){
              Navigator.pop(context);
            }),
        ),
        actions: <Widget>[new IconButton(
            icon: new Icon(Icons.more_horiz,
            size: 28,),
            onPressed: null,
        )],
      ),
      body: new SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
//        header: defaultTargetPlatform == TargetPlatform.iOS?WaterDropHeader():WaterDropMaterialHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child:  new ListView.builder(itemCount: _items.length, itemBuilder: itemView),
      ),

//      new ListView.builder(
//        padding: new EdgeInsets.all(5.0),
//        itemExtent: 50.0,
//          itemBuilder: (BuildContext context,int index){
//            return new Text("text $index");
//          },
//      ),
//      new ListView(
//        children: <Widget>[
//          new Container(
//            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
//            child: new Row(
//              children: <Widget>[
//                new InkWell(
//                  child: new Image.asset(
//                    Utils.getImgPath('ico_refresh'),
//                    width: 30,
//                  ),
//                  onTap: refreshAll,
//                ),
//                new Container(
//                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
//                  child: new MaterialButton(
//                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
//                    color: Colours.color_49B2B6,
//                    textColor: Colors.white,
//                    child: new Text('统计汇总'),
//                    onPressed: statistics,
//                  ),
//                ),
//                new MaterialButton(
//                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
//                  color: Colours.color_49B2B6,
//                  textColor: Colors.white,
//                  child: new Text('退出'),
//                  onPressed: loginOut,
//                )
//              ],
//              mainAxisAlignment: MainAxisAlignment.center,
//            ),
//
//          )
//        ],
//      ),

    );
  }
  Widget itemView(BuildContext context, int index) {
    Model model = this._items[index];
    //设置分割线
    if (index.isOdd) return new Divider(height: 2.0);
    return new Container(
        color: Color.fromARGB(0x22, 0x49, 0xa9, 0x8d),
        child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Text('${model.year}年${model.month}月${model.day}日',
                            style: new TextStyle(fontSize: 15.0)),
                        new Text('(${model.lunar})',
                            style: new TextStyle(fontSize: 15.0)),
                      ],
                    ),
                    new Center(
                      heightFactor: 6.0,
                      child: new Text("${model.title}",
                          style: new TextStyle(fontSize: 17.0)),
                    )
                  ],
                ))));
  }






  void dispose(){
    _refreshController.dispose();
    super.dispose();
  }
}

class Model {
  String _id;
  String title;
  String pic;
  int year;
  int month;
  int day;
  String des;
  String lunar;

  Model(this._id, this.title, this.pic, this.year, this.month, this.day,
      this.des, this.lunar);
}