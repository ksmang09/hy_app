import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/controllers/jobnotice_controller.dart';
import '../view/pages/post/jobnodetail.dart';
import '../view/pages/post/write_page.dart';

class Jobnotice extends StatefulWidget {
  @override
  _JobnoticeState createState() => _JobnoticeState();
}

class _JobnoticeState extends State<Jobnotice> {
  @override
  Widget build(BuildContext context) {
    // UserController u = Get.find();

    //객체 생성 (create),  onInit 함수실행(initialize)
    JobnoController jn = Get.put(JobnoController());
    // jn.findAllJobnotice();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("취업 게시판",
            style: TextStyle(
              fontSize: 20,
              color: Colors.indigo
            ),
        ),
        leading: Container(),
        elevation: 2,
        actions: <Widget>[
          IconButton(
              onPressed: (){
                Get.to(WritePage());
              },
              icon: Icon(Icons.add),
              color: Colors.indigo,
          )
        ],
      ),
      body: Obx(
        ()=> ListView.separated(
              itemCount: jn.posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    jn.findById(jn.posts[index].id!);
                    Get.to(jobnoDetailPage(jn.posts[index].id));
                    },
                    title: Text(
                      "${jn.posts[index].title}",
                      style: TextStyle(fontSize: 17),
                      ),
                    subtitle: Text("작성자 : username(마지막에할당)"
                      ,style: TextStyle(fontSize: 13),
                      ),
                    leading: Text(
                      "{yyyy_mm_dd}",
                        style: TextStyle(fontSize: 8),
                        ),
              );
            },
              separatorBuilder: (context, index) {
                return Divider();
          },
        ),
      ),
    );
  }
}