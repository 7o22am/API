import 'package:flutter/material.dart';
import 'package:untitled/posts.dart';
import 'package:untitled/remoat_servece.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   List<Post>? posts;
  var isload = false;
@override
void initState() {
    super.initState();
    getData();
  }
  getData() async{
     posts = (await remotserv().getPosts())!;
     if(posts != null){
       setState((){
          isload = true;
       });
     }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Visibility(
        visible: isload,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text(posts![index].url ,style: TextStyle(
                fontSize: 25.0
              ),),
            );
          },
        ),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
