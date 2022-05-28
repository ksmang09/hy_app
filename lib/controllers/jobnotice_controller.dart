import 'package:get/get.dart';
import 'package:new_project/domain/jobnotice/jobno_repository.dart';
import '../domain/post/post.dart';

class JobnoController extends GetxController {
  final JobnoRepository _jobnoRepository = JobnoRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;

  @override
  void onInit() {
    super.onInit();
    findAllJobnotice();
  }

  Future<void> deleteByJobnoId(int id) async{
    int result = await _jobnoRepository.deleteByJobnoId(id);

    if(result == 1){
      print("DB 삭제 성공");
      List<Post> result = posts.where((post) => post.id != id).toList();
      // print(result.length);  // DB 길이값 체크
      posts.value = result;
    }
  }

  Future<void> findAllJobnotice() async {
    List<Post> posts = await _jobnoRepository.findAllJobNotice();
    this.posts.value = posts;
  }

  Future<void> findByJobnoId(int id) async {
    Post post = await _jobnoRepository.findByJobnoId(id);
    this.post.value = post;
  }

}