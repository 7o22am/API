import 'package:untitled/posts.dart';
import 'package:http/http.dart' as http;

class remotserv {
  Future<List<Post>?> getPosts() async {
    var clint = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var respon = await clint.get(uri);
    if (respon.statusCode == 200) {
      var json = respon.body;
      return postFromJson(json);
    }
  }
}
