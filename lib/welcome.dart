import 'package:aashwin/years_old.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  height: 200, child: Lottie.asset('images/birthday.json')),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // const CircleAvatar(
                  //   radius: 72.0,
                  //   backgroundImage: NetworkImage(
                  //       'https://i.postimg.cc/Px0xc5k1/photo-2023-03-23-15-01-Photo-Room.png'),
                  // ),
                  SizedBox(
                      height: 250,
                      child: Image.network(
                          'https://i.postimg.cc/KvjftZGx/icon.png')),
                  const SizedBox(height: 4.0),
                  // Text(
                  //   'aashwin',
                  //   style: GoogleFonts.zeyada(
                  //     fontSize: 70,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.black,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 150, child: Lottie.asset('images/cake.json')),
              const SizedBox(height: 8),
              AgeDisplay(dateOfBirth: DateTime(2014, 03, 17)),
            ],
          ),
        ),
      ),
    );
  }
}
