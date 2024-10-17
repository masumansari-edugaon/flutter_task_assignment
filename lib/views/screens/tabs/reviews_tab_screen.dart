import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewsTab extends StatelessWidget {
  final List<Map<String, dynamic>> ratings = [
    {'category': 'Location', 'rating': 9.3},
    {'category': 'Staff', 'rating': 7.9},
    {'category': 'Cleanliness', 'rating': 8.0},
    {'category': 'Comfort', 'rating': 7.8},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Background color
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ratings",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          Column(
            children: ratings.map((rating) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            rating['category'],
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ),
                        Text(
                          rating['rating'].toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: rating['rating'] / 10,
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.orange,
                      minHeight: 6,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}