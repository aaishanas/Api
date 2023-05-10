import 'package:exmstudy/Homepage.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Center(child: Image.asset("Assets/pic1.png")),
            ),
            Text(
              "Lets get Started!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text(
              "Login  to access your bookmarks \n and personal preferences.",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                    value: value,
                    onChanged: ((value) => setState(() {
                          this.value = value;
                        }))),
                SizedBox(
                  width: 2,
                ),
                Text("keep me logged in"),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                  backgroundColor:
                      Colors.purple[900], //background color of button
                  side: BorderSide(
                      width: 200, color: Colors.brown), //border width and color
                  elevation: 2, //elevation of button
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Myhomepage(),
                    ));
              },
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
