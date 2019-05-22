
import 'package:flutter_app/common/component_index.dart';
import 'package:flutter_app/data/repository/wan_repository.dart';

class RequestUtil{

  WanRepository wanRepository = new WanRepository();


  Future getLogin(LoginReq _req) async {
    ReqData reqData = new ReqData( await _getEncryptionAES(_req.toString()));
    return wanRepository.getLogin(data:reqData.toJson());
  }

  Future getImage(ImageReq _req) async {
    ReqData reqData = new ReqData( await _getEncryptionAES(_req.toString()));
    return wanRepository.getImage(data:reqData.toJson());
  }


  Future<String> _getEncryptionAES(String params) async {
    String result;
    try {
      Map<String, String> map = {"params": params};
      // 在通道上调用此方法
      result = await Constant.platform.invokeMethod('getEncryptionAES', map);
    } on PlatformException catch (e) {
      result = "Failed to get battery level: '${e.message}'.";
    }
    return result;
  }

}