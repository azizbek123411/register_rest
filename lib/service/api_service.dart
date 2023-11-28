import 'dart:convert';

import 'package:http/http.dart';
import 'package:register_rest/models/user_model.dart';

class ApiService{
   static const String base='localhost:8080';
   static const String loginPath='/login';
   static const String registerpath="/register";
   static const Map<String,String> headers={
     'content-type':'application-json'
   };
   static Future<String?> registerUser(UserModel userModel)async{
     final body=jsonEncode(userModel.toMap());
     Uri uri=Uri.https(base,registerpath );
     final response= await post(uri,headers: headers,body: body);
     if(response.statusCode==200){
       final responseBody=jsonDecode(response.body);
       return responseBody['token'];
     }
     return null;
   }

   static Future<String?> loginUser(UserModel user) async {
     final body = jsonEncode(user.toMap());
     Uri uri = Uri.http(base, loginPath);
     final response = await post(uri, headers: headers, body: body);
     if (response.statusCode == 200) {
       final responseBody = jsonDecode(response.body);
       return responseBody['token'];
     }
     return null;
   }
}