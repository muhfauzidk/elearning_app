import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/constans/r.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final textController = TextEditingController();
  late CollectionReference chat;
  late QuerySnapshot chatData;
  // List<QueryDocumentSnapshot>? listChat;

  // getDataFromFirebase() async {
  //   chatData = await FirebaseFirestore.instance
  //       .collection("room")
  //       .doc("kimia")
  //       .collection("chat")
  //       .get();
  //   // listChat = chatData.docs;
  //   setState(() {});
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getDataFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    chat = FirebaseFirestore.instance
        .collection("room")
        .doc("kimia")
        .collection("chat");

    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text("Diskusi Soal"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<QuerySnapshot>(
                stream: chat.orderBy("time").snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.reversed.length,
                    reverse: true,
                    itemBuilder: (BuildContext context, int index) {
                      final currentChat =
                          snapshot.data!.docs.reversed.toList()[index];
                      final currentDate =
                          (currentChat["time"] as Timestamp?)?.toDate();

                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          crossAxisAlignment: user.uid == currentChat["uid"]
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentChat["nama"],
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xff5200ff),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: user.uid == currentChat["uid"]
                                    ? Colors.green.withOpacity(0.5)
                                    : Color(0xffffdcdc),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: user.uid == currentChat["uid"]
                                      ? Radius.circular(0)
                                      : Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  topLeft: user.uid != currentChat["uid"]
                                      ? Radius.circular(0)
                                      : Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                currentChat["content"],
                              ),
                            ),
                            Text(
                              currentDate == null
                                  ? ""
                                  : DateFormat("dd-MMM-yyy HH:mm")
                                      .format(currentDate),
                              style: TextStyle(
                                fontSize: 10,
                                color: R.colors.greySubtitles,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -1),
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.25),
                  )
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: R.colors.primary,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              child: TextField(
                                controller: textController,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: R.colors.primary,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "Ketuk untuk menulis...",
                                  hintStyle:
                                      TextStyle(color: R.colors.greySubtitles),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (textController.text.isEmpty) {
                        return;
                      }

                      final chatContent = {
                        "nama": user.displayName,
                        "uid": user.uid,
                        "content": textController.text,
                        "email": user.email,
                        "photo": user.photoURL,
                        "time": FieldValue.serverTimestamp(),
                      };
                      chat.add(chatContent).whenComplete(() {
                        textController.clear();
                      });
                    },
                    icon: Icon(
                      Icons.send,
                      color: R.colors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
