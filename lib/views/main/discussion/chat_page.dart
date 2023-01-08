import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diskusi Soal"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    children: [
                      Text("Nama User"),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Text("Pesan"),
                      ),
                      Text("Waktu Kirim"),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
