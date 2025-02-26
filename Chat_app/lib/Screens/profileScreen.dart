import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo1/Screens/HomeScreen.dart';
import 'package:demo1/Screens/welcomeScreen.dart';
import 'package:demo1/Widgets/profileWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  User user;
  MyProfileScreen({super.key, required this.user});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  String? profilePic = "";

  Future<void> getUserInfo() async {
    var result = await FirebaseFirestore.instance
        .collection("Person")
        .doc(widget.user.uid)
        .get();

    setState(() {
      _nameController.text = result["username"];
      _emailController.text = result["email"];
      _cityController.text = result["city"];
      profilePic = result["profilepic"];
    });
  }

  Future<void> updateInfo() async {
    await FirebaseFirestore.instance
        .collection("Person")
        .doc(widget.user.uid)
        .update({
      "username": _nameController.text.toString(),
      "city": _cityController.text.toString()
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green.shade400,
        content: Text("Signed Up Succesfully"),
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomeScreen(
          user: widget.user,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 113, 70, 213),
        title: Text(
          "Profile Screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage("${profilePic}"),
                  backgroundColor: Colors.transparent,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color.fromARGB(255, 113, 70, 213).withOpacity(0.5),
                    width: 5.0,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width * .4,
                child: Row(
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    Text(
                      "${_nameController.text.toString()}",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      child: Icon(
                        Icons.done_all_rounded,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "${_emailController.text.toString()}",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: size.height * 0.47,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: "Name",
                          iconColor: const Color.fromARGB(255, 113, 70, 213),
                          fillColor: Colors.purple[300],
                          icon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          iconColor: const Color.fromARGB(255, 113, 70, 213),
                          fillColor: Colors.purple[300],
                          icon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
                      child: TextFormField(
                        controller: _cityController,
                        decoration: InputDecoration(
                          hintText: "City",
                          iconColor: const Color.fromARGB(255, 113, 70, 213),
                          fillColor: Colors.purple[300],
                          icon: Icon(Icons.location_city),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyWelcomeScreen()));
                      },
                      child: profile_widget(
                        icon: Icons.logout,
                        title: "Log Out",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Color.fromARGB(255, 113, 70, 213),
                    ),
                  ),
                  onPressed: () {
                    updateInfo();
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
