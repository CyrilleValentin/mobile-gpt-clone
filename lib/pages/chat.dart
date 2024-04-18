import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:my_ai/widgets/input.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController _message = TextEditingController();
  String _textFieldValue = '';
  String _response = '';
  bool _isLoading = false;
  void main() async {
    setState(() {
      _isLoading = true;
    });
    final content = _message.text;
    final headers = {
      'content-type': 'application/json',
      'X-RapidAPI-Key': 'd0eb41d98amsh64aefb7cfcc12b9p1568dbjsnd4c620f549ef',
      'X-RapidAPI-Host': 'chatgpt-api8.p.rapidapi.com'
    };
    final body = jsonEncode([
      {
        'content':
            'Hello! I\'m an AI assistant bot based on ChatGPT 3. How may I help you?',
        'role': 'system'
      },
      {'content': content, 'role': 'user'}
    ]);
    final response = await http.post(
      Uri.parse('https://chatgpt-api8.p.rapidapi.com/'),
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _response = data["text"];
        _isLoading = false;
      });
      print(data);
    } else {
      throw Exception('Failed to load data');
    }
    _message.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My AI"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_document)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  // height: MediaQuery.of(context).size.height * (0.5),

                  child: Column(
                    children: [
                      Text(_message.text,style: const TextStyle(fontSize: 12),),
                      _isLoading
                          ? const CircularProgressIndicator()
                          : Text(_response,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * (0.8),
                    child: Form(
                        key: formkey,
                        child: myInput(
                            onChanged: (value) {
                              setState(() {
                                _textFieldValue = value;
                              });
                            },
                            hintText: "Message",
                            controller: _message,
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.mic_rounded)))),
                  ),
                  Container(
                      alignment: Alignment.center,
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                          onPressed: () {
                            _submitForm();
                          },
                          icon: _textFieldValue.isEmpty
                              ? const Icon(
                                  Icons.headphones,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        main();
      });
    }
  }
}
