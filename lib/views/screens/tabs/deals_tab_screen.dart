import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DealsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: [
          BookingCard(
            price: "AU\$90",
            description: "Classic room - Pay at Hotel",
            feature1: "Free Cancellation",
          ),
          SizedBox(height: 16),
          BookingCard(
            price: "AU\$90",
            description: "Classic room - Pay at Hotel",
            feature1: "Free Cancellation",
            feature2: "Free Breakfast",
          ),
        ],
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String price;
  final String description;
  final String feature1;
  final String? feature2;

  BookingCard({
    required this.price,
    required this.description,
    required this.feature1,
    this.feature2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Booking.com title
              Text(
                'Booking.com',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              // Room description
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 8),
              // Features
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: Colors.orange),
                      SizedBox(width: 4),
                      Text(
                        feature1,
                        style: GoogleFonts.poppins(fontSize: 14,color: Colors.orange),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      feature2 == null ? SizedBox(): Icon(Icons.circle, size: 8, color: Colors.orange),
                      SizedBox(width: 4),
                      Text(
                        feature2 ?? "",
                        style: GoogleFonts.poppins(fontSize: 14,color: Colors.orange),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Per Night",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Book Now",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 8,),
              Icon(Icons.arrow_forward_ios, size: 15, color: Colors.orange)
            ],
          ),
        ],
      ),
    );
  }
}