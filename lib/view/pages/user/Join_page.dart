import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/utill/validator_util.dart';
import '../../../controllers/controller.dart';
import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import 'login_page.dart';

// 로그인이랑 똑같이 만들기 ( 상태관리 필요없음 )
class JoinPage extends StatelessWidget {

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<Controller>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0.0,
        title: Container(),

        ),
        extendBodyBehindAppBar: true,
         body:Padding(
         padding: const EdgeInsets.all(30.0),
         child: ListView(
           children: [
             Container(
               margin: EdgeInsets.all(10),
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('assets/image/시그니처(가로).jpg'),
                   fit: BoxFit.contain
                 ),
               ),
             child: Container(
               alignment: Alignment.center,
               margin: EdgeInsets.all(0),
               padding: EdgeInsets.fromLTRB(0, 125, 0,0),
               height: 170,
               child: Text(
                 "회원가입",
                 style: TextStyle(
                     color: Colors.black,
                     fontSize:30,
                     fontWeight: FontWeight.bold
                 ),
               ),
             ),

             ),
             _JoinForm()
          ],
      ),
       ),
    );
  }

  Widget _JoinForm() { // 항상 return 타입은 최상위보호타입으로 잡아주는게좋음(widget)
    return Form(    // 나중에 DB 서버에 한번에 날려야 하기 때문에 form안에 한꺼번에 감싸버려버려
          key: _formkey,
           child: Column(
             children: [
               CustomTextFormField(
                 hint: "UserName",
                 funValidator: validateUsername(),
               ),
               CustomTextFormField(
                 hint: "Password",
                 funValidator: validatePassword(),
               ),
               CustomTextFormField(
                 hint: "Email",
                 funValidator: validateEmail(),
               ),
               CustomElevatedButton(
                   text: "회원가입",
                   funpageRoute: () {
                     if( _formkey.currentState!.validate()) {
                       Get.to(LoginPage());
                        _
                     }
                   },
               ),
               TextButton(onPressed: (){
                 Get.to(LoginPage());
               },
                   child: Text("로그인페이지로")
               ),
             ],
           ),
         );
  }
}


