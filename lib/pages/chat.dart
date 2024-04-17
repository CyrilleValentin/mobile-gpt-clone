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
                // height: MediaQuery.of(context).size.height * (0.5),
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * (0.8),
                    child: Form(
                        key: formkey,
                        child: myInput(
                            hintText: "Message",
                            controller: _message,
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.headphones)))),
                  ),
                  Container(
                    alignment: Alignment.center,
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                      color: Colors.black,
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.send,color: Colors.white,))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
