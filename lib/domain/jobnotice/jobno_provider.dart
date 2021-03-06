import 'package:get/get.dart';
import 'package:new_project/utill/jwt.dart';

const host = "http://13.209.230.98:5000/post";

// 통신
class JobnoProvider extends GetConnect {

  Future<Response> findAllJobNotice() =>
      get("$host/jobnotice/", headers: {"authorization" : jwtToken ?? ""});

  Future<Response> findByJobnoId(int id) =>
      get("$host/jobnotice/$id", headers: {"authorization" : jwtToken ?? ""});

  Future<Response> deleteByJobnoId(int id) =>
      delete("$host/jobnotice/$id", headers: {"authorization" : jwtToken ?? ""});

  Future<Response> Jobnoupdate(int id, Map data) =>
      put("$host/jobnotice/$id", data,headers: {"authorization" : jwtToken ?? ""});

  Future<Response> Jobnosave(Map data) =>
      post("$host/jobnotice/", data, headers: {"authorization" : jwtToken ?? ""});


}