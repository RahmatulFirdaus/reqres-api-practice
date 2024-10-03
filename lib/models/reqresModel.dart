import 'dart:convert';
import 'package:http/http.dart' as http;

class GetReqres {
  String id, email, fullname, avatar;

  GetReqres({
    required this.id,
    required this.email,
    required this.fullname,
    required this.avatar,
  });

  static Future<List<GetReqres>> connApi() async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    var hasilResponse = await http.get(url);

    if (hasilResponse.statusCode == 200) {
      var jsonData = jsonDecode(hasilResponse.body)["data"] as List;

      // Mengembalikan list data user
      return jsonData.map((user) {
        return GetReqres(
          id: user['id'].toString(),
          email: user['email'],
          fullname: "${user['first_name']} ${user['last_name']}",
          avatar: user['avatar'],
        );
      }).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }
}

class PostReqres{
  String id, name, job, createdAt;

  PostReqres({
    required this.id,
    required this.name,
    required this.job,
    required this.createdAt,
  });

  postApi(String name, String job) async{
    Uri url = Uri.parse("https://reqres.in/api/users");

    var hasilResponse = await http.post(
      url,
      body: {
        "name" : name,
        "job"  : job, 
      },
    );

    var data = jsonDecode(hasilResponse.body);

    print(data);
  }
}