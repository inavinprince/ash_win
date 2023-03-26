import 'package:aashwin/family_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Text(
            'Family',
            style: GoogleFonts.shadowsIntoLight(
                fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        const CategoryView(),
        Center(
          child: Text(
            'Me time',
            style: GoogleFonts.shadowsIntoLight(
                fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        CarouselSlider(
          items: [
            //1st Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://i.postimg.cc/9MzW2Vxz/iron.jpg"), // ironman
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //2nd Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://i.postimg.cc/kXGhyG22/marvel.jpg"), // marvel
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //3rd Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://i.postimg.cc/Y0zkf90n/deadpool.jpg"), // deadpool
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //4th Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://i.postimg.cc/2S2FyRdn/buddies.jpg"), // buddies
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],

          //Slider Container properties
          options: CarouselOptions(
            height: 180.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
        TopProducts(),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            'Poem',
            style: GoogleFonts.shadowsIntoLight(
                fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlipCard(
            direction: FlipDirection.HORIZONTAL,
            side: CardSide.FRONT,
            speed: 1000,
            onFlipDone: (status) {
              print(status);
            },
            front: Container(
              decoration: BoxDecoration(
                color: Color(0xFF006666),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'aashwin, dear aashwin,\nAt just ten years old,\nYour love for gadgets,\nIs a story to be told,\nYour eyes light up,\nAt the sight of a screen,\nAnd your fingers move fast,\nLike a digital machine.\nYou are stubborn, \nit is true,\nBut it is part of your charm..',
                      style: GoogleFonts.indieFlower(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            back: Container(
              decoration: BoxDecoration(
                color: Color(0xFF006666),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      '\nAnd though you dont speak much,\nYour intelligence is disarm\nSo keep on exploring,\nThis world of tech and wonder,\nWith your smart, curious mind,\nAnd your determination like thunder.\naashwin, dear aashwin,\nYou are a gadget-loving star,\nAnd with every new discovery,\nYou wll surely go far.',
                      style: GoogleFonts.indieFlower(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
        ),
        Center(
            child: Text(
           textAlign: TextAlign.center,
          'Copyright © 2023-2024 developed by @navinprince\nAll rights reserved',
          style: TextStyle(color: Colors.grey, fontSize: 12,),
        ))
      ],
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      'https://i.postimg.cc/76DZ42TM/grandpa.jpg',
      'https://i.postimg.cc/7P5Zkw5R/grandma.jpg',
      'https://i.postimg.cc/ydtBd3Db/dad.jpg',
      'https://i.postimg.cc/prHtnBc7/mom.jpg',
      'https://i.postimg.cc/tC9v6CFS/uncle.jpg',
      'https://i.postimg.cc/bNvH8Gxh/aunty.jpg',
      'https://i.postimg.cc/JznCJ0K1/lidu4.jpg',
      'https://i.postimg.cc/6335TNYy/chhotu.jpg',
    ];
    List<String> avatarTitles = [
      "GrandPa",
      "GrandMa",
      "DAD",
      "MOM",
      "Uncle",
      "Aunty",
      "Avik",
      "Bro",
    ];
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Handle avatar tap event
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 32.0,
                    backgroundImage: NetworkImage(imageUrls[index]),
                  ),
                  SizedBox(height: 4.0),
                  Text(avatarTitles[index],
                      // style: TextStyle(
                      //   fontSize: 12.0,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      style: GoogleFonts.cookie(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
