import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo1/Screens/MyMessageScreen.dart';
import 'package:demo1/Screens/profileScreen.dart';
import 'package:demo1/Screens/welcomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  User? user;
  MyHomeScreen({super.key, required this.user});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  String? userName;
  TextEditingController _searchController = TextEditingController();

  List<DocumentSnapshot>? allUsers;
  List<DocumentSnapshot>? filterUser;

  Future<void> getUserInfo() async {
    var document = await FirebaseFirestore.instance
        .collection("Person")
        .doc(widget.user!.uid)
        .get();

    setState(() {
      userName = document["username"];
    });
  }

  void searchUser(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        filterUser = allUsers;
      } else {
        filterUser = allUsers!
            .where((user) =>
                user["username"].toLowerCase().contains(keyword.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 113, 70, 213),
        title: Text(
          "Hello $userName",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: (value) {
              if (value == "profile") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyProfileScreen(
                      user: widget.user!,
                    ),
                  ),
                );
              } else if (value == "logout") {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyWelcomeScreen()));
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  padding: EdgeInsets.all(10),
                  child: Text("Profile"),
                  value: "profile",
                ),
                PopupMenuItem(
                  child: Text("Log Out"),
                  value: "logout",
                ),
              ];
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 255, 255, 255),
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
            SizedBox(
              height: 90,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  onChanged: (value) {
                    searchUser(value);
                  },
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("Person").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  allUsers = snapshot.data!.docs
                      .where((element) => element.id != widget.user!.uid)
                      .toList();

                  // allUsers = snapshot.data!.docs.toList();
                  filterUser ??= List.from(allUsers!);
                  return ListView.builder(
                    itemCount: filterUser!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyMessageScreen(
                                  userSnapshot: filterUser![index],
                                ),
                              ),
                            );
                          },
                          child: Card(
                            color: Color.fromARGB(255, 204, 189, 240),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundImage: NetworkImage(
                                      "${filterUser![index]["profilepic"]}",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${filterUser![index]["username"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ))
          ],
        ),
      ),
    );
  }
}
