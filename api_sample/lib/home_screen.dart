import 'dart:convert';

import 'package:api_sample/api.dart';
import 'package:api_sample/home_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<HomeModel>> data;
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/posts'; 
 //static const String apiUrl = 'https://run.mocky.io/v3/e8d52237-963b-40ba-bc77-34d3a5c79aa1'; 
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String result = '';

  @override
  void initState() {
    super.initState();
    data = Api().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(label: Text('name ')),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(label: Text('email')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    postData(_nameController.text,_emailController.text);
                  },
                  child: const Text('Submit')),
            ),
            Text(
              result,
              style: const TextStyle(fontSize: 16.0),
            ),
            Expanded(
              child: FutureBuilder(
                future: data,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data![index].title!,style: const TextStyle(fontSize: 20),),
                              const SizedBox(
                                height: 5,
                              ),
                              Image(
                                  image: NetworkImage(
                                      snapshot.data![index].image)),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
  
  Future<void> postData(String name,String email) async { 
    print('name = $name');
     print('email = $email');
    try { 

      final response = await http.post( 
        Uri.parse(apiUrl), 
        headers: <String, String>{ 
          'Content-Type': 'application/json; charset=UTF-8', 
        }, 
        body: jsonEncode(<String, dynamic>{ 
          'name':  name, 
          'email': email, 
          // Add any other data you want to send in the body 
        }), 
      ); 
      print(result);
      if (response.statusCode == 201) { 
        // Successful POST request, handle the response here 
        final responseData = jsonDecode(response.body); 
        print('re = $responseData');
        setState(() { 
         // result = responseData;
         print('respose = ${responseData['name']}');
          result = 'Name: ${responseData['name']}\nEmail: ${responseData['email']}'; 
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
