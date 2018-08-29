import 'dart:async';
import 'package:dio/dio.dart';
import './DioUtils.dart';
import 'dart:math' show Random;

class Api {
  static Dio _dio = DioUtils.getDio();

  static isOk(int code) {
    return code == 0;
  }

  /// 获取轮播图
  static Future<Response> getRecommendList({Dio dio}) async {
    try {
      Response response = await (dio == null ? _dio : dio).get(
          'https://c.y.qq.com/musichall/fcgi-bin/fcg_yqqhomepagerecommend.fcg',
          data: {
            'platform': 'h5',
            'uin': 0,
            'needNewCode': 1,
          });
      print(response.data);
      return response;
    } on DioError catch (e) {
      print(e);
    }
  }

  /// 获取热门歌单推荐
  static Future<Response> getHotMusicList({Dio dio}) async {
    try {
      Response response = await (dio == null ? _dio : dio).get(
        'https://c.y.qq.com/splcloud/fcgi-bin/fcg_get_diss_by_tag.fcg',
        data: DioUtils.commonParams
          ..addAll({
            'platform': 'yqq',
            'hostUin': 0,
            'sin': 0,
            'ein': 29,
            'sortId': 5,
            'needNewCode': 0,
            'categoryId': 10000000,
            'rnd': Random().nextInt(1000),
            'format': 'json'
          }),
      );
      print(response.data);
      return response;
    } on DioError catch (e) {
      print(e);
    }
  }
}