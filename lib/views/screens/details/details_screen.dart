import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../tabs/deals_tab_screen.dart';
import '../tabs/details_tab_screen.dart';
import '../tabs/reviews_tab_screen.dart';

class HotelBookingPage extends StatefulWidget {
  final List list;
  final String date;
  final String name;
  final String location;

  const HotelBookingPage({
    super.key,
    required this.list,
    required this.date,
    required this.name,
    required this.location,
  });

  @override
  State<HotelBookingPage> createState() => _HotelBookingPageState();
}

class _HotelBookingPageState extends State<HotelBookingPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.sizeOf(context).width;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(widget.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text(
                widget.date,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.orange),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffF3F1F4)),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(CupertinoIcons.arrowshape_turn_up_right,
                  color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            // Carousel for hotel images
            SizedBox(
              height: size.height * 0.3,
              child: widget.list.isNotEmpty
                  ? Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: screenWidth * 0.6,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1.0,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: widget.list.map((imageUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            width: screenWidth,
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: _currentIndex,
                        count: widget.list.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Colors.orange,
                          dotHeight: 8,
                          dotWidth: 8,
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  : Center(child: Text("No images available")),
            ),
            // Hotel information and rating
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.location,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 24),
                      Icon(Icons.star, color: Colors.orange, size: 24),
                      Icon(Icons.star, color: Colors.orange, size: 24),
                      Icon(Icons.star, color: Colors.orange, size: 24),
                      Icon(Icons.star_half, color: Colors.orange, size: 24),
                      SizedBox(width: 8),
                      Row(
                        children: [
                          Text(
                            "4.0",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            "Very Good",
                            style: GoogleFonts.poppins(fontSize: 17),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            // TabBar
            TabBar(
              labelStyle: GoogleFonts.poppins(fontSize: 14),
              indicatorColor: Colors.orange,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(text: 'Deals'),
                Tab(text: 'Details'),
                Tab(text: 'Reviews'),
              ],
            ),
            // TabBarView
            Expanded(
              child: TabBarView(
                children: [
                  DealsTab(),
                  DetailsTab(),
                  ReviewsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
