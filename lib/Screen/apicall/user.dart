import 'dart:convert'; 
import 'package:http/http.dart' as http; 
import 'package:taskseclob/Screen/model/user.dart'; 
 
Future<ApiCall> fetchMedia() async { 
  final String apiUrl = 'https://rubidya.com/api/users/get-media'; 
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjBiZmUxODE3ZmYzZjBkMmZjMmQwNGUiLCJpYXQiOjE3MTQ3MTkyMDMsImV4cCI6MTc4MzgzOTIwM30.HfsYDcVEzMsdi6pU24IzHzmGAxfDQ2NAJYIptOAu_9I'; 
 
  try { 
    var response = await http.get( 
      Uri.parse(apiUrl), 
      headers: {'Authorization': 'Bearer $token'}, 
    ); 
 
    if (response.statusCode == 200) { 
      return ApiCall.fromJson(jsonDecode(response.body)); 
    } else { 
      throw Exception('Failed to load media'); 
    } 
  } catch (e) { 
    throw Exception('Error occurred: $e'); 
  } 
}
