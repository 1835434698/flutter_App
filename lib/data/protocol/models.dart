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
  int type;
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
   String preordainAm ;//0 未预订  1,已预订
   String preordainPm ;//0 未预订  1,已预订

   RomeOrdersModel.fromJson(Map<String, dynamic> json)
      :
        orderNo = json['orderNo'],
         status = json['status'],
         type = json['type'],
         preordain = json['preordain'],
         preordainAm = json['preordainAm'],
         preordainPm = json['preordainPm']
  ;

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
    sb.write(',"preordainAm":"$preordainAm"');
    sb.write(',"preordainPm":"$preordainPm"');
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
