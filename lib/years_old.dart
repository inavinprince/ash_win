import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgeDisplay extends StatelessWidget {
  final DateTime dateOfBirth;

  AgeDisplay({required this.dateOfBirth});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final duration = now.difference(dateOfBirth);
    final years = duration.inDays ~/ 365;
    final months = (duration.inDays % 365) ~/ 30;
    final days = duration.inDays % 30;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Text(
        //   '$years years, $months months, $days days, $hours hours, and $minutes minutes',
        //   textAlign: TextAlign.center,
        //   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        // ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '$years\nYrs',
                      style: GoogleFonts.zeyada(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.pinkAccent,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '$months\nMonths',
                      style: GoogleFonts.zeyada(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.green,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '$days\nDays',
                      style: GoogleFonts.zeyada(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.purpleAccent,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '$hours\nHrs',
                      style: GoogleFonts.zeyada(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.indigoAccent,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '$minutes\nMins',
                      style: GoogleFonts.zeyada(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
