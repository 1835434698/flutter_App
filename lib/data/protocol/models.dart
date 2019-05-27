import 'package:azlistview/azlistview.dart';

class ComData {
  int size;
  List datas;

  ComData.fromJson(Map<String, dynamic> json)
      : size = json['size'],
        datas = json['datas'];
}

class ComReq {
  int cid;

  ComReq(this.cid);

  ComReq.fromJson(Map<String, dynamic> json) : cid = json['cid'];

  Map<String, dynamic> toJson() => {
        'cid': cid,
      };
}

class ComListResp<T> {
  int status;
  List<T> list;

  ComListResp(this.status, this.list);
}

class ReposModel {
  int id;
  String title;
  String desc;
  String author;
  String link;
  String projectLink;
  String envelopePic;
  String superChapterName;
  int publishTime;
  bool collect;

  ReposModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        desc = json['desc'],
        author = json['author'],
        link = json['link'],
        projectLink = json['projectLink'],
        envelopePic = json['envelopePic'],
        superChapterName = json['superChapterName'],
        publishTime = json['publishTime'],
        collect = json['collect'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'desc': desc,
        'author': author,
        'link': link,
        'projectLink': projectLink,
        'envelopePic': envelopePic,
        'superChapterName': superChapterName,
        'publishTime': publishTime,
        'collect': collect,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"title\":\"$title\"");
    sb.write(",\"id\":$id");
    sb.write(",\"author\":\"$author\"");
    sb.write(",\"envelopePic\":\"$envelopePic\"");
    sb.write('}');
    return sb.toString();
  }
}

class BaseModel{
  fromJson(Map<String, dynamic> json){
  }
}



class LoginModel extends BaseModel{
  int sellerId;
  int type;//0，商家，1 服务员，2 相关人员 ，3 老板
  int orderCount;
  String serviceId;
  SellerInfoModel sellerInfo;
  List<RomeModel> romes = new List();

  LoginModel.fromJson(Map<String, dynamic> json){
    sellerId = json['sellerId'];
    type = json['type'];
    orderCount = json['orderCount'];
    serviceId = json['serviceId'];
    sellerInfo = new SellerInfoModel.fromJson(json['sellerInfo']);
    for(var dataItem in json['romes']){
      romes.add(new RomeModel.fromJson(dataItem));
    }
  }

  Map<String, dynamic> toJson() => {
    'sellerId': sellerId,
    'type': type,
    'serviceId': serviceId,
    'orderCount': orderCount,
    'sellerInfo': sellerInfo.toJson(),
    'romes': romes,
  };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write('"sellerId":$sellerId');
    sb.write(',"type":$type');
    sb.write(',"orderCount":$orderCount');
    sb.write(',"serviceId":"$serviceId"');
    sb.write(',"sellerInfo":'+sellerInfo.toString());
    sb.write(',"romes":'+romes.toString());
    sb.write('}');
    return sb.toString();
  }
}

class SellerInfoModel extends BaseModel{
  String sellerName;
  String mobile;

  SellerInfoModel.fromJson(Map<String, dynamic> json)
      :
        mobile = json['mobile'],
        sellerName = json['sellerName']
  ;

  Map<String, dynamic> toJson() => {
    'mobile': mobile,
    'sellerName': sellerName,
  };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write('"mobile":$mobile');
    sb.write(',"sellerName":"$sellerName"');
    sb.write('}');
    return sb.toString();
  }
}

class RomeModel extends BaseModel{
   int id;
   String name;
   String code;
   int stats;
   String orderNo;
   int preordainAmStatus = 0;//0 未预订  1,已预订
   int preordainPmStatus = 0;//0 未预订  1,已预订
   List<RomeOrdersModel> romeOrders = new List();

  RomeModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    code = json['code'];
    stats = json['stats'];
    name = json['name'];
    orderNo = json['orderNo'];
    preordainAmStatus = json['preordainAmStatus'];
    preordainPmStatus = json['preordainPmStatus'];
    for(var dataItem in json['romeOrders']){
      romeOrders.add(new RomeOrdersModel.fromJson(dataItem));
    }
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'code': code,
    'stats': stats,
    'orderNo': orderNo,
    'preordainAmStatus': preordainAmStatus,
    'preordainPmStatus': preordainPmStatus,
    'romeOrders': romeOrders,
  };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write('"id":$id');
    sb.write(',"name":"$name"');
    sb.write(',"code":"$code"');
    sb.write(',"stats":$stats');
    sb.write(',"orderNo":"$orderNo"');
    sb.write(',"preordainAmStatus":$preordainAmStatus');
    sb.write(',"preordainPmStatus":$preordainPmStatus');
    sb.write(',"romeOrders":'+romeOrders.toString());
    sb.write('}');
    return sb.toString();
  }
}


class RomeOrdersModel extends BaseModel{
   String orderNo;
   int status;
   int type;
   int preordain = 0;//
   int preordainAm ;//0 未预订  1,已预订
   int preordainPm ;//0 未预订  1,已预订
   var varStr;

   RomeOrdersModel.fromJson(Map<String, dynamic> json){
     orderNo = json['orderNo'];
     status = json['status'];
     type = json['type'];
     preordain = json['preordain'];
     varStr = (json['preordainAm']);
     if(varStr == null || varStr == "")
      varStr = 0;
     preordainAm = varStr is int ? varStr : int.parse(varStr);
     varStr = (json['preordainPm']);
     if(varStr == null || varStr == "")
       varStr = 0;
//     preordainPm = json['preordainPm'];
     preordainPm = varStr is int ? varStr : int.parse(varStr);

   }

  Map<String, dynamic> toJson() => {
    'orderNo': orderNo,
    'status': status,
    'type': type,
    'preordain': preordain,
    'preordainAm': preordainAm,
    'preordainPm': preordainPm,
  };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write('"orderNo":"$orderNo"');
    sb.write(',"status":$status');
    sb.write(',"type":$type');
    sb.write(',"preordain":$preordain');
    sb.write(',"preordainAm":$preordainAm');
    sb.write(',"preordainPm":$preordainPm');
    sb.write('}');
    return sb.toString();
  }
}

class WelcomeModel extends BaseModel{
  int imageType =  -1;
  int imageNum =  -1;
  String imageName;
  List<PicModel> imageList = new List();

  WelcomeModel.fromJson(Map<String, dynamic> json){
    Map<String, dynamic> appPics = json['appPics'];
    imageType = appPics['imageType'];
    imageNum = appPics['imageNum'];
    imageName = appPics['imageName'];
    for(var dataItem in appPics['imageList']){
      imageList.add(new PicModel.fromJson(dataItem));
    }
  }

  Map<String, dynamic> toJson() => {
    'imageType': imageType,
    'imageNum': imageNum,
    'imageName': imageName,
    'imageList': imageList,
  };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write('"imageType":$imageType');
    sb.write(',"imageNum":$imageNum');
    sb.write(',"imageName":"$imageName"');

    sb.write(',"romes":'+imageList.toString());
    sb.write('}');
    return sb.toString();
  }
}

class PicModel extends BaseModel{
  String imageName;
  String imageUrl;

  PicModel.fromJson(Map<String, dynamic> json){
    imageName = json['imageName'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() => {
    'imageName': imageName,
    'imageUrl': imageUrl,
  };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write('"imageName":"$imageName"');
    sb.write(',"imageUrl":"$imageUrl"');
    sb.write('}');
    return sb.toString();
  }
}

class OrderListModel extends BaseModel{
  List<OrderBeanModel> orderList = new List();

  OrderListModel.fromJson(Map<String, dynamic> json){
    for(var dataItem in json['orderList']){
      orderList.add(new OrderBeanModel.fromJson(dataItem));
    }
  }

  Map<String, dynamic> toJson() => {
    'orderList': orderList,
  };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write('"imageUrl":$orderList');
    sb.write('}');
    return sb.toString();
  }
}
class OrderBeanModel extends BaseModel{
  String orderNo;
  String createTime;
  int orderRomeType;
  int orderType;// 订单类型 0 线上订单 1线下订单
  String statusName;
  int statusColor = 0;
  String statusType;
  int status;//预订-2，预订确定中-1，下单未支付 0，支付中 1 ，支付成功2，支付失败 3，支付超时4，商家确认 5，取消 6
  int preordainAm;// 0 未预订  1,已预订
  int preordainPm;//0 未预订  1,已预订
  int sendMeal;//是否支持送餐 false 不支持 true 支持
  String price;
  String custormTel;
  String custormName;
  String hallMark;//就餐地点

  Rome2Model rome;
//  List<DishModel> changeIds = new List();

  bool isSelected = false;
  bool isRead = false;

  OrderBeanModel.fromJson(Map<String, dynamic> json){
    orderNo = json['orderNo'];
    createTime = json['createTime'];
    orderRomeType = json['orderRomeType'];
    orderType = json['orderType'];
    statusName = json['statusName'];
    statusColor = json['statusColor'];
    statusType = json['statusType'];
    status = json['status'];
    preordainAm = json['preordainAm'];
    preordainPm = json['preordainPm'];
    sendMeal = json['sendMeal'];
    price = json['price'].toString();
    custormTel = json['custormTel'];
    custormName = json['custormName'];
    hallMark = json['hallMark'];
    isSelected = json['isSelected'];
    isRead = json['isRead'];
    rome = new Rome2Model.fromJson(json['rome']);
//    for(var dataItem in json['changeIds']){
//      changeIds.add(new DishModel.fromJson(dataItem));
//    }
  }

  Map<String, dynamic> toJson() => {
    'orderNo': orderNo,
    'createTime': createTime,
    'orderRomeType': orderRomeType,
    'orderType': orderType,
    'statusName': statusName,
    'statusColor': statusColor,
    'statusType': statusType,
    'status': status,
    'preordainAm': preordainAm,
    'preordainPm': preordainPm,
    'sendMeal': sendMeal,
    'price': price,
    'custormTel': custormTel,
    'custormName': custormName,
    'hallMark': hallMark,
    'isSelected': isSelected,
    'isRead': isRead,
    'rome': rome,
  };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write('"orderNo":"$orderNo"');
    sb.write(',"createTime":"$createTime"');
    sb.write(',"orderRomeType":$orderRomeType');
    sb.write(',"orderType":$orderType');
    sb.write(',"statusName":"$statusName"');
    sb.write(',"statusColor":$statusColor');
    sb.write(',"statusType":"$statusType"');
    sb.write(',"status":$status');
    sb.write(',"preordainAm":$preordainAm');
    sb.write(',"preordainPm":$preordainPm');
    sb.write(',"sendMeal":$sendMeal');
    sb.write(',"price":"$price"');
    sb.write(',"custormTel":"$custormTel"');
    sb.write(',"custormName":"$custormName"');
    sb.write(',"hallMark":"$hallMark"');
    sb.write(',"isSelected":$isSelected');
    sb.write(',"isRead":$isRead');
    sb.write(',"rome":$rome');
    sb.write('}');
    return sb.toString();
  }
}


class Rome2Model extends BaseModel{
  int romeId;
  String romeName;
  int status;
  int preordainAmStatus = 0;//0 未预订  1,已预订
  int preordainPmStatus = 0;//0 未预订  1,已预订

  Rome2Model.fromJson(Map<String, dynamic> json){
    romeId = json['romeId'];
    romeName = json['romeName'];
    status = json['status'];
    preordainAmStatus = json['preordainAmStatus'];
    preordainPmStatus = json['preordainPmStatus'];
  }

  Map<String, dynamic> toJson() => {
    'romeId': romeId,
    'romeName': romeName,
    'status': status,
    'preordainAmStatus': preordainAmStatus,
    'preordainPmStatus': preordainPmStatus,
  };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write('"romeId":$romeId');
    sb.write(',"romeName":"$romeName"');
    sb.write(',"status":$status');
    sb.write(',"preordainAmStatus":$preordainAmStatus');
    sb.write(',"preordainPmStatus":$preordainPmStatus');
    sb.write('}');
    return sb.toString();
  }
}
class DishModel extends BaseModel{
  int dishId;
  String practice;
  int dishCount;

  DishModel.fromJson(Map<String, dynamic> json){
    dishId = json['dishId'];
    practice = json['practice'];
    dishCount = json['dishCount'];
  }

  Map<String, dynamic> toJson() => {
    'dishId': dishId,
    'practice': practice,
    'dishCount': dishCount,
  };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write('"dishId":$dishId');
    sb.write(',"practice":"$practice"');
    sb.write(',"dishCount":$dishCount');
    sb.write('}');
    return sb.toString();
  }
}



class BannerModel {
  String title;
  int id;
  String url;
  String imagePath;

  BannerModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json['id'],
        url = json['url'],
        imagePath = json['imagePath'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'id': id,
        'url': url,
        'imagePath': imagePath,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"title\":\"$title\"");
    sb.write(",\"id\":$id");
    sb.write(",\"url\":\"$url\"");
    sb.write(",\"imagePath\":\"$imagePath\"");
    sb.write('}');
    return sb.toString();
  }
}

class TreeModel extends ISuspensionBean {
  String name;
  int id;
  List<TreeModel> children;
  String tagIndex;

  TreeModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        children = (json['children'] as List)
            ?.map((e) => e == null
                ? null
                : new TreeModel.fromJson(e as Map<String, dynamic>))
            ?.toList();

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'children': children,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"name\":\"$name\"");
    sb.write(",\"id\":$id");
    sb.write(",\"children\":$children");
    sb.write('}');
    return sb.toString();
  }

  @override
  String getSuspensionTag() {
    return tagIndex;
  }
}

class ReqData{
  String key;
  ReqData(this.key);

  ReqData.fromJson(Map<String, dynamic> json)
      : key = json['key'];

  Map<String, dynamic> toJson() => {
    'key': key,
  };

  @override
  String toString() {
    return '{' +
        '"key":"' + key + '"' +
        '}';
  }

}

class LoginReq {
  String username;
  String password;

  LoginReq(this.username, this.password);

  LoginReq.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };

  @override
  String toString() {
    return '{' +
        "\"username\":\"" +
        username +
        "\"" +
        ",\"password\":\"" +
        password +
        "\"" +
        '}';
  }
}
class ImageReq {
  int imageType;

  ImageReq(this.imageType);

  ImageReq.fromJson(Map<String, dynamic> json)
      : imageType = json['imageType'];

  Map<String, dynamic> toJson() => {
        'imageType': imageType,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write('"imageType":$imageType');
    sb.write('}');
    return sb.toString();
  }
}
class OrderListReq {
  int sellerId ;//包间id,  大厅时传啥？
  int pageNo = 1 ;//页码
  int pageSize = 10 ;//分页大小
  int status ;//默认查询订单支付前订单
  String startTime;
  String endTime;

  OrderListReq();

  void setStartTime(String startTime) {
    this.startTime = startTime;
  }

  void setEndTime(String endTime) {
    this.endTime = endTime;
  }

  void setSellerId(int sellerId) {
    this.sellerId = sellerId;
  }

  void setPageNo(int pageNo) {
    this.pageNo = pageNo;
  }

  void setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }

  void setStatus(int status) {
    this.status = status;
  }

  OrderListReq.fromJson(Map<String, dynamic> json)
      : pageSize = json['pageSize'],
        sellerId = json['sellerId'],
        pageNo = json['pageNo'],
       status = json['status'],
      startTime = json['startTime'],
      endTime = json['endTime'];

  Map<String, dynamic> toJson() => {
        'sellerId': sellerId,
        'pageNo': pageNo,
        'pageSize': pageSize,
        'status': status,
        'startTime': startTime,
        'endTime': endTime,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write('"pageSize":"$pageSize"');
    sb.write(',"sellerId":"$sellerId"');
    sb.write(',"pageNo":"$pageNo"');
    sb.write(',"status":"$status"');
    sb.write(',"startTime":"$startTime"');
    sb.write(',"endTime":"$endTime"');
    sb.write('}');
    return sb.toString();
  }
}

class RegisterReq {
  String username;
  String password;
  String repassword;

  RegisterReq(this.username, this.password, this.repassword);

  RegisterReq.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        repassword = json['repassword'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'repassword': repassword,
      };

  @override
  String toString() {
    return '{' +
        " \"username\":\"" +
        username +
        "\"" +
        ", \"password\":\"" +
        password +
        "\"" +
        ", \"repassword\":\"" +
        repassword +
        "\"" +
        '}';
  }
}
