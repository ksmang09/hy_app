import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/Main/mainpage.dart';
import 'package:new_project/controllers/jobopen_controller.dart';
import 'package:new_project/controllers/user_controller.dart';
import 'package:new_project/view/pages/post/update/jobnoupdate.dart';
import 'package:file_picker/file_picker.dart';
import 'package:new_project/view/pages/post/update/jobopenupdate.dart';
import 'package:new_project/view/pages/post/write/jobopenwrite.dart';

import '../../../../utill/jwt.dart';
import '../../../../utill/mamagertoken.dart';

class jobopDetailPage extends StatelessWidget {
  final int? id;

  const jobopDetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    //String data = Get.arguments;
    UserController u = Get.find();
    JobopenController  jo = Get.find();

    //메타코딩 11강..5분쯤
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          elevation: 0.0,
          title: Text("글 상세 페이지"),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(()=>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${jo.post.value.title}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)
              ),       //오른쪽 정렬로다가 날짜 및 아이디 가능하면 좋겟당
              Divider(),
              Container(
                child: Text("작성일 : ${jo.post.value.created}"),
              ),
              Container(
                child: Text("작성자 : ${jo.post.value.user?.username} (이메일 : ${jo.post.value.user?.email})"),
              ),
              Divider(),
              if (u.principal.value.id == jo.post.value.user!.id
                  || jwtToken == managertoken
              ) Row(
                children: [
                  SizedBox(width: 7),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        _deleteDialog(context); // 상태관리로 갱신 시킬 수 있음.
                      },
                      child: Text("삭제")
                  ),
                  SizedBox(width: 7),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        Get.to(()=>JobopenUpdatePage());
                      },
                      child: Text("수정")
                  ),
                ],
              )else SizedBox() ,
            SizedBox(height:7),
              Expanded(
                  child: SingleChildScrollView(
                    child: Text("${jo.post.value.content}"),
                  )
              ),
            ],
          ),
        ),
        )
    );
  }
}


void _deleteDialog(BuildContext context) {
  JobopenController jo = Get.find();
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("정말로 게시물을 삭제하시겠습니까?"),
          content: SingleChildScrollView(
            child: ListBody(
                children: <Widget>[
                  Text('게시물을 삭제하면 되돌릴 수 없습니다.')
                ]
            ),
          ),
          actions: [
            FlatButton(
              child: Text("예"),
              onPressed: () async{
                Navigator.of(context).pop(); // 저장소에서 해당 게시물삭제
                _deleteDialog(context);
                await jo.deleteByJobopenId(jo.post.value.id!);
                Get.off(()=> MainPage());
                Get.to(MainPage());
              },
            ),
            FlatButton(
              child: Text("아니요"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}


