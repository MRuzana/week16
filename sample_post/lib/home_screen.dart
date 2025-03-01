import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';  
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String result = ''; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('post Demo'),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                label: Text('name ')
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                label: Text('email')
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                postData;
              }, child: const Text('Submit')),
            ),
            Text( 
              result, 
              style: TextStyle(fontSize: 16.0), 
            ),
          ],
        ),
      )),
    );
  }

  
Future<void>postData()async{
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';  
  final TextEditingController nameController = TextEditingController(); 
  final TextEditingController emailController = TextEditingController(); 
  String result = ''; // To store the result from the API call 
  
  @override 
  void dispose() { 
    nameController.dispose(); 
    emailController.dispose(); 
    super.dispose(); 
  } 
  
  Future<void> _postData() async { 
    try { 

      final response = await http.post( 
        Uri.parse(apiUrl), 
        headers: <String, String>{ 
          'Content-Type': 'application/json; charset=UTF-8', 
        }, 
        body: jsonEncode(<String, dynamic>{ 
          'name': nameController.text, 
          'email': emailController.text, 
          // Add any other data you want to send in the body 
        }), 
      ); 
      print(result);
      if (response.statusCode == 201) { 
        // Successful POST request, handle the response here 
        final responseData = jsonDecode(response.body); 
        setState(() { 
          result = 'ID: ${responseData['id']}\nName: ${responseData['name']}\nEmail: ${responseData['email']}'; 
        }); 
      } else { 
        // If the server returns an error response, throw an exception 
        throw Exception('Failed to post data'); 
      } 
    } catch (e) { 
      setState(() { 
        result = 'Error: $e'; 
      }); 
    } 
  } 
}

}
