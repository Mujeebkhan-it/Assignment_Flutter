import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyMessageScreen extends StatefulWidget {
  DocumentSnapshot<Object?> userSnapshot;
  MyMessageScreen({super.key, required this.userSnapshot});

  @override
  State<MyMessageScreen> createState() => _MyMessageScreenState();
}

class _MyMessageScreenState extends State<MyMessageScreen> {
  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("------>>> sender ::: ${FirebaseAuth.instance.currentUser!.uid}");
    print("------>>> reciever ::: ${widget.userSnapshot.id}");
  }

  String formatTimeStamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    String formattedTime = DateFormat.jm().format(dateTime);
    String formattedDate = DateFormat.yMMMd().format(dateTime);
    return "$formattedTime at $formattedDate";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 113, 70, 213),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network("${widget.userSnapshot["profilepic"]}"),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text("${widget.userSnapshot["username"]}",style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 241, 99, 210),
              Color.fromARGB(255, 113, 70, 213),
            ],
          ),
          //   image: DecorationImage(
          //     opacity: 0.7,
          //     image: AssetImage("assets/images/bg.png"),
          //     fit: BoxFit.cover
          //   ),
        ),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Chat")
                    .where("reciever",
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .where("sender", isEqualTo: widget.userSnapshot.id)
                    .orderBy('timestamp')
                    .snapshots(),
                builder: (context, SenderSnapshot) {
                  if (SenderSnapshot.hasData) {
                    var senderMessage = SenderSnapshot.data!.docs;
        
                    return StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("Chat")
                          .where("sender",
                              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                          .where("reciever", isEqualTo: widget.userSnapshot.id)
                          .orderBy('timestamp')
                          .snapshots(),
                      builder: (context, receiverSnapshot) {
                        if (receiverSnapshot.hasData) {
                          var receiverMessage = receiverSnapshot.data!.docs;
        
                          var allMessage = [...senderMessage, ...receiverMessage];
        
                          allMessage.sort(
                            (a, b) => (a["timestamp"] as Timestamp)
                                .compareTo(b["timestamp"] as Timestamp),
                          );
        
                          return ListView.builder(
                            itemCount: allMessage.length,
                            itemBuilder: (context, index) {
                              var message = allMessage[index];
                              String SENDER_ID = message["sender"];
                              bool isCurrentUserISSender = SENDER_ID ==
                                  FirebaseAuth.instance.currentUser!.uid;
        
                              return Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: isCurrentUserISSender
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  children: [
                                    if (!isCurrentUserISSender)
                                      CircleAvatar(
                                        child: Text(
                                            "${widget.userSnapshot["username"][0].toString().toUpperCase()}"),
                                      )
                                    else
                                      SizedBox(
                                        width: 32,
                                      ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isCurrentUserISSender
                                                ? Color.fromRGBO(228, 17, 243, 1)
                                                : const Color.fromARGB(255, 160, 15, 238),
                                          ),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Text(
                                                "${message["message"]}",
                                                style:
                                                    TextStyle(color: Colors.white),
                                              ),
                                            ),
                                            // Text("${formatTimeStamp(message["timestamp"] as Timestamp)}",style: TextStyle(color : Colors.white),)
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    );
                  } else if (SenderSnapshot.hasError) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: _messageController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Type message here",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        String? messageText = _messageController.text.toString();
        
                        if (messageText.isNotEmpty) {
                          FirebaseFirestore.instance.collection("Chat").add({
                            "sender": FirebaseAuth.instance.currentUser!.uid,
                            "reciever": widget.userSnapshot.id,
                            "message": messageText,
                            "timestamp": Timestamp.now(),
                          });
                          _messageController.clear();
                        }
                      });
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
