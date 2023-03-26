import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopProducts extends StatefulWidget {
  const TopProducts({Key? key}) : super(key: key);

  @override
  State<TopProducts> createState() => _TopProductsState();
}

class _TopProductsState extends State<TopProducts> {
  @override
  Widget build(BuildContext context) {
    bool _isFavorite = false;
    List<String> imageUrls = [
      'https://i.postimg.cc/X7cXv3bk/app-logo.png',
      'https://i.postimg.cc/CLQyWGw8/home.png',
      'https://i.postimg.cc/BnBKK4cg/aswin2.jpg',
      'https://i.postimg.cc/q7tvPBfJ/aswin-yellow.png'
    ];
    List<String> avatarTitles = [
      "hope &\nspontaneity",
      "passion & \njoy",
      "Torpedo",
      'Simply\nClever'
    ];
  //  List<String> _rate = ["49", "400", "350", '500'];
    return SizedBox(
        height: 250,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount:
              imageUrls.length, // Set the number of cards you want to display
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(10.0),
              width: 170.0,
              child: Card(
                margin: EdgeInsets.all(8),
                elevation: 4,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(5),
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        // borderRadius:
                        //     BorderRadius.vertical(top: Radius.circular(16)
                        //     ),
                        child: FadeInImage(
                            placeholder: const AssetImage("images/icon.png"),
                            image: NetworkImage(imageUrls[index]),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset("images/icon.png");
                            },
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                avatarTitles[index],
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                              IconButton(
                                icon: Icon(
                                  _isFavorite
                                      ? Icons.favorite
                                      : Icons.flash_auto,
                                  color: Colors.teal,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isFavorite = !_isFavorite;
                                  });
                                },
                              ),
                            ],
                          ),
                          // SizedBox(height: 2),
                          // Row(
                          //   children: [
                          //     const Text(
                          //       'Price :    ',
                          //       style: TextStyle(
                          //         fontSize: 12.0,
                          //         color: Colors.grey,
                          //         fontWeight: FontWeight.normal,
                          //       ),
                          //     ),
                          //     Text(
                          //       '₹ ${_rate[index]}',
                          //       style: const TextStyle(
                          //           color: Colors.red,
                          //           decoration: TextDecoration.lineThrough),
                          //     ),
                          //     const SizedBox(width: 5),
                          //     Text(
                          //       '₹${_rate[index]}',
                          //       style: const TextStyle(
                          //           color: Colors.green,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 20),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
