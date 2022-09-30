import 'dart:convert';

import 'package:http/http.dart' as http;

var link = "https://isro.vercel.app/api/centres";

getQuiz() async {
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    var data = jsonDecode(res.body.toString());
    print("data is loaded");
    print(data);
    return data;
  }
}
