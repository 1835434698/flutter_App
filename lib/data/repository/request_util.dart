
import 'package:flutter_app/common/component_index.dart';
import 'package:flutter_app/data/repository/wan_repository.dart';

class RequestUtil{

  WanRepository wanRepository = new WanRepository();


  Future getLogin(ReqData _loginReq) {
    return wanRepository.getLogin(data:_loginReq.toJson());
  }

}