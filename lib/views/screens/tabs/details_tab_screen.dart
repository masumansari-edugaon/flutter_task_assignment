import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class DetailsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Details',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          ReadMoreText(
            "Don't miss out on recreational opportunities including an outdoor pool and a fitness center. This condo also features complimentary wireless Internet access, concierge services, and barbecue grills. Grab a bite from the grocery/convenience store serving guests of Get Aways at Jockey Club.",
            trimLines: 3,
            colorClickableText: Colors.orange,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Read more',
            trimExpandedText: 'Read less',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey.shade800,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Amenities',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Add any additional amenities information here
        ],
      ),
    );
  }
}