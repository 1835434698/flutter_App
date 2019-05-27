import 'package:flutter/material.dart';
import 'package:flutter_app/common/component_index.dart';
import 'page_index.dart';

class OrderPage extends StatefulWidget {
  OrderListModel orderListModel;

  OrderPage({this.orderListModel});

  @override
  State<StatefulWidget> createState() {
    return new OrderPageState();
  }
}

class TabTitle {
  String title;
  int id;

  TabTitle(this.title, this.id);
}

class OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  String tag = "OrderPage";
  RefreshController _refreshController;
  var _items = [];
  var _items_0 = [];
  var _items_1 = [];
  var _items_2 = [];
  var _items_3 = [];
  int mCurIndex = -1;
  int pageNo = 1;

  OrderListModel orderListModel;

  TabController mTabController;
  PageController mPageController = PageController(initialPage: 0);
  List<TabTitle> tabList;
  var currentPage = 0;
  var isPageCanChanged = true;

  @override
  void initState() {
    _items_0 = widget.orderListModel.orderList;
    super.initState();
    _refreshController = RefreshController();
    initTabData();
    mTabController = TabController(
      length: tabList.length,
      vsync: this,
    );
    mTabController.addListener(() {
      LogUtil.e("addListener ", tag: tag);
      //TabBar的监听
      if (mTabController.indexIsChanging) {
        LogUtil.e("mTabController.indexIsChanging = "+mTabController.indexIsChanging.toString(), tag: tag);
        //判断TabBar是否切换
        print(mTabController.index);
        onPageChange(mTabController.index, p: mPageController);
      }
    });
    orderListModel = widget.orderListModel;
  }

  void setState_() {
    setState(() {});
  }
  initTabData() {
    tabList = [
      new TabTitle('待确认', 0),
      new TabTitle('待支付', 1),
      new TabTitle('已支付', 2),
      new TabTitle('全部', 3)
    ];
  }

  onPageChange(int index, {PageController p, TabController t}) async {
    mCurIndex = index;
    switch (mCurIndex) {
      case 0:
        _items = _items_0;
        break;
      case 1:
        _items = _items_1;
        break;
      case 2:
        _items = _items_2;
        break;
      case 3:
        _items = _items_3;
        break;
    }
    LogUtil.e("onPageChange mCurIndex = "+mCurIndex.toString(), tag: tag);
    if (p != null) {
      //判断是哪一个切换
      isPageCanChanged = false;
      await mPageController.animateToPage(index,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease); //等待pageview切换完毕,再释放pageivew监听
      isPageCanChanged = true;
    } else {
      mTabController.animateTo(index); //切换Tabbar
    }
//    setState_();

  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
    mTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
//        title: new Text(IntlUtil.getString(context, )),
        title: new Text(
          "订单列表",
          style: new TextStyle(color: Colors.black),
        ),
        backgroundColor: Colours.color_45A0EF,
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
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 38.0,
//            width: double.infinity,
            child: TabBar(
              isScrollable: true,
              //是否可以滚动
              controller: mTabController,
              labelColor: Colours.color_45A0EF,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colours.color_45A0EF,
              labelStyle: TextStyle(fontSize: 16.0),
              tabs: tabList.map((item) {
                return Tab(
                  text: item.title,
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: tabList.length,
              onPageChanged: (index) {
                if (isPageCanChanged) {
                  //由于pageview切换是会回调这个方法,又会触发切换tabbar的操作,所以定义一个flag,控制pageview的回调
                  onPageChange(index);
                }
              },
              controller: mPageController,
              itemBuilder: (BuildContext context, int index) {
                LogUtil.e("itemBuilder index = "+index.toString(), tag: tag);
                switch (index) {
                  case 0:
                    _items = _items_0;
                    break;
                  case 1:
                    _items = _items_1;
                    break;
                  case 2:
                    _items = _items_2;
                    break;
                  case 3:
                    _items = _items_3;
                    break;
                }
//                _items = orderListModel.orderList;

                return new SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
//        header: defaultTargetPlatform == TargetPlatform.iOS?WaterDropHeader():WaterDropMaterialHeader(),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child:  new ListView.builder(itemCount: _items.length, itemBuilder: itemView),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget itemView(BuildContext context, int index) {
    LogUtil.e("itemView index = "+index.toString(), tag: tag);
    OrderBeanModel model = this._items[index];
    LogUtil.e("itemView model.hallMark = "+model.hallMark, tag: tag);
    //设置分割线
//    if (index.isOdd) return new Divider(height: 2.0);
    return new Container(
        color: Color.fromARGB(0x22, 0x49, 0xa9, 0x8d),
        child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(model.hallMark))));
  }


  void _onRefresh(){
    LogUtil.e("_onRefresh ", tag: tag);
    _items.clear();
    switch (mCurIndex) {
      case 0:
        _items_0.clear();
        break;
      case 1:
        _items_1.clear();
        break;
      case 2:
        _items_2.clear();
        break;
      case 3:
        _items_3.clear();
        break;
    }
    pageNo = 1;
    statistics(mCurIndex, pageNo);
  }

  void _onLoading(){
    LogUtil.e("_onLoading ", tag: tag);
    statistics(mCurIndex, pageNo);
  }

  void statistics(int i, int page) {
    DateTime now = new DateTime.now();
    LogUtil.e("statistics ", tag: tag);
    var startTime = now.year.toString()+'-'+now.month.toString()+"-"+now.day.toString()+" 01:00:00";
    var endTime = now.year.toString()+'-'+now.month.toString()+"-"+now.day.toString()+" 23:59:59";
    OrderListReq orderListReq = new OrderListReq();
    switch (i) {
      case 0:
        orderListReq.setStatus(-2);
        break;
      case 1:
        orderListReq.setStatus(0);
        break;
      case 2:
        orderListReq.setStatus(2);
        break;
      case 3:
        orderListReq.setStatus(100);
        break;
    }
    orderListReq.setSellerId(Constant.loginModel.sellerId);
    orderListReq.setStartTime(startTime);
    orderListReq.setEndTime(endTime);
    orderListReq.setPageNo(page);

    RequestUtil requestUtil = new RequestUtil();
    requestUtil.getOrderList(orderListReq).then((orderListModel){
      LogUtil.e("orderListModel = " + orderListModel.toString(), tag: tag);
      this.orderListModel = orderListModel;
      switch (i) {
        case 0:
          _items_0.addAll(orderListModel.orderList);
          break;
        case 1:
          _items_1.addAll(orderListModel.orderList);
          break;
        case 2:
          _items_2.addAll(orderListModel.orderList);
          break;
        case 3:
          _items_3.addAll(orderListModel.orderList);
          break;
      }
      
      _refreshController.refreshCompleted();
      _refreshController.loadComplete();
      pageNo=pageNo+1;
      setState_();
//      Navigator.push( context, MaterialPageRoute(
//          builder: (_) => OrderPage(orderListModel: orderListModel))
//      );
    }).catchError((onError){
      LogUtil.e("onError......" + onError.toString(), tag: tag);
    });
  }
}
//
//class Model {
//  String _id;
//  String title;
//  String pic;
//  int year;
//  int month;
//  int day;
//  String des;
//  String lunar;
//
//  Model(this._id, this.title, this.pic, this.year, this.month, this.day,
//      this.des, this.lunar);
//}