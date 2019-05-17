import 'package:flutter_app/common/common.dart';
import 'package:flutter_app/data/api/apis.dart';
import 'package:flutter_app/data/net/dio_util.dart';
import 'package:flutter_app/data/protocol/models.dart';

class WanRepository {
  /**
   * 登录
   */
  Future<List<LoginModel>> getLogin({data}) async {
    BaseResp<List> baseResp = await DioUtil().request<List>(
        Method.post, WanAndroidApi.getPath(path: WanAndroidApi.USER_LOGIN),data: data);
    List<LoginModel> loginList;
    if (baseResp.code != Constant.status_success) {
      return new Future.error(baseResp.msg);
    }
    if (baseResp.data != null) {
      loginList = baseResp.data.map((value) {
        return LoginModel.fromJson(value);
      }).toList();
    }
    return loginList;
  }

  Future<List<BannerModel>> getBanner() async {
    BaseResp<List> baseResp = await DioUtil().request<List>(
        Method.get, WanAndroidApi.getPath(path: WanAndroidApi.BANNER));
    List<BannerModel> bannerList;
    if (baseResp.code != Constant.status_success) {
      return new Future.error(baseResp.msg);
    }
    if (baseResp.data != null) {
      bannerList = baseResp.data.map((value) {
        return BannerModel.fromJson(value);
      }).toList();
    }
    return bannerList;
  }

  Future<List<ReposModel>> getArticleListProject(int page) async {
    BaseResp<Map<String, dynamic>> baseResp = await DioUtil()
        .request<Map<String, dynamic>>(
            Method.get,
            WanAndroidApi.getPath(
                path: WanAndroidApi.ARTICLE_LISTPROJECT, page: page));
    List<ReposModel> list;
    if (baseResp.code != Constant.status_success) {
      return new Future.error(baseResp.msg);
    }
    if (baseResp.data != null) {
      ComData comData = ComData.fromJson(baseResp.data);
      list = comData.datas.map((value) {
        return ReposModel.fromJson(value);
      }).toList();
    }
    return list;
  }

  Future<List<ReposModel>> getArticleList({int page, data}) async {
    BaseResp<Map<String, dynamic>> baseResp = await DioUtil()
        .request<Map<String, dynamic>>(Method.get,
            WanAndroidApi.getPath(path: WanAndroidApi.ARTICLE_LIST, page: page),
            data: data);
    List<ReposModel> list;
    if (baseResp.code != Constant.status_success) {
      return new Future.error(baseResp.msg);
    }
    if (baseResp.data != null) {
      ComData comData = ComData.fromJson(baseResp.data);
      list = comData.datas.map((value) {
        return ReposModel.fromJson(value);
      }).toList();
    }
    return list;
  }

  Future<List<TreeModel>> getTree() async {
    BaseResp<List> baseResp = await DioUtil().request<List>(
        Method.get, WanAndroidApi.getPath(path: WanAndroidApi.TREE));
    List<TreeModel> treeList;
    if (baseResp.code != Constant.status_success) {
      return new Future.error(baseResp.msg);
    }
    if (baseResp.data != null) {
      treeList = baseResp.data.map((value) {
        return TreeModel.fromJson(value);
      }).toList();
    }
    return treeList;
  }

  Future<List<ReposModel>> getProjectList({int page: 1, data}) async {
    BaseResp<Map<String, dynamic>> baseResp = await DioUtil()
        .request<Map<String, dynamic>>(Method.get,
            WanAndroidApi.getPath(path: WanAndroidApi.PROJECT_LIST, page: page),
            data: data);
    List<ReposModel> list;
    if (baseResp.code != Constant.status_success) {
      return new Future.error(baseResp.msg);
    }
    if (baseResp.data != null) {
      ComData comData = ComData.fromJson(baseResp.data);
      list = comData.datas.map((value) {
        return ReposModel.fromJson(value);
      }).toList();
    }
    return list;
  }

  Future<List<ReposModel>> getWxArticleList({int id, int page: 1, data}) async {
    BaseResp<Map<String, dynamic>> baseResp = await DioUtil()
        .request<Map<String, dynamic>>(
            Method.get,
            WanAndroidApi.getPath(
                path: WanAndroidApi.WXARTICLE_LIST + '/$id', page: page),
            data: data);
    List<ReposModel> list;
    if (baseResp.code != Constant.status_success) {
      return new Future.error(baseResp.msg);
    }
    if (baseResp.data != null) {
      ComData comData = ComData.fromJson(baseResp.data);
      list = comData.datas.map((value) {
        return ReposModel.fromJson(value);
      }).toList();
    }
    return list;
  }

  Future<List<TreeModel>> getWxArticleChapters() async {
    BaseResp<List> baseResp = await DioUtil().request<List>(Method.get,
        WanAndroidApi.getPath(path: WanAndroidApi.WXARTICLE_CHAPTERS));
    List<TreeModel> treeList;
    if (baseResp.code != Constant.status_success) {
      return new Future.error(baseResp.msg);
    }
    if (baseResp.data != null) {
      treeList = baseResp.data.map((value) {
        return TreeModel.fromJson(value);
      }).toList();
    }
    return treeList;
  }

  Future<List<TreeModel>> getProjectTree() async {
    BaseResp<List> baseResp = await DioUtil().request<List>(
        Method.get, WanAndroidApi.getPath(path: WanAndroidApi.PROJECT_TREE));
    List<TreeModel> treeList;
    if (baseResp.code != Constant.status_success) {
      return new Future.error(baseResp.msg);
    }
    if (baseResp.data != null) {
      treeList = baseResp.data.map((value) {
        return TreeModel.fromJson(value);
      }).toList();
    }
    return treeList;
  }
}
