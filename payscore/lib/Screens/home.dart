import 'package:flutter/material.dart';
import 'package:payscore/Widgets/mycontainer.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 18.0, right: 18.0, left: 2.0),
          child: CircularProfileAvatar(
            '',
            borderColor: const Color.fromARGB(255, 126, 125, 125),
            borderWidth: 5,
            elevation: 1,
            radius: 50,
            child: Image.asset('assets/images/chidera.jpg'),
          ),
        ),
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 30.0,
          ),
          SizedBox(
            width: 394,
            height: 190,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: MyContainer(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'continue',
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
