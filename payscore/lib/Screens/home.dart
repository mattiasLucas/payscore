import 'package:flutter/material.dart';
import 'package:payscore/Widgets/mycontainer.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:payscore/Widgets/Smallcontainer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

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
        children: [
          SizedBox(
            height: 30.0,
          ),
          SizedBox(
            width: 394,
            height: 190,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: MyContainer(
                color: Colors.blue,
                child: Center(
                  child: Text(''),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallContainer(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send),
                      tooltip: 'Transfer',
                    ),
                    Text('Transfer')
                  ],
                ),
              ),
              SmallContainer(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.qr_code_2_outlined),
                      tooltip: 'QR Scan',
                    ),
                    const Text('QRScan')
                  ],
                ),
              ),
              SmallContainer(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.payment_outlined),
                      tooltip: 'NFC',
                    ),
                    const Text('CardTap')
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
