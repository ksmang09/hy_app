import 'package:get/get.dart';
import 'package:new_project/utill/jwt.dart';

const host = "http://13.209.230.98:5000/post";

// 통신
class JobopProvider extends GetConnect {

  Future<Response> findAllJobopening() =>
      get("$host/jobopen/", headers: {"authorization" : jwtToken ?? ""});

  Future<Response> findByopenId(int id) =>
      get("$host/jobopen/$id", headers: {"authorization" : jwtToken ?? ""});

  Future<Response> deleteByJobopenId(int id) =>
      delete("$host/jobopen/$id", headers: {"authorization" : jwtToken ?? ""});

  Future<Response> Jobopenupdate(int id, Map data) =>
      put("$host/jobopen/$id", data,headers: {"authorization" : jwtToken ?? ""});

  Future<Response> Jobopensave(Map data) =>
      post("$host/jobopen/", data, headers: {"authorization" : jwtToken ?? ""});

}