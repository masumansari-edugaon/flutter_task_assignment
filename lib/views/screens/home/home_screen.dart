import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controllers/room_list_controller.dart';
import '../../../models/room_list_model.dart';
import '../details/details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RoomListController roomListController = Get.put(RoomListController());
  int _currentIndex = 0;
  var ratings = 2.0;
  var dates  ='Wed, 30 Jun - Thu, 31 Jun | 1 Room, 2 Guests';
  var price ='AU${114}';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F1F4),
      appBar: AppBar(
        backgroundColor: Color(0xffFD7E14),
        foregroundColor: Colors.white,
        title: Column(
          children: [
            Text('Italy'),
            Text(
              dates,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (roomListController.roomListModel.value.typename == null) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: roomListController.roomListModel.value.propertyGallery?.images?.length,
          itemBuilder: (context, index) {
            var room = roomListController.roomListModel.value;
            return _buildHotelCard(context, roomModel: room);
          },
        );
      }),
    );
  }

  Widget _buildHotelCard(BuildContext context, {required RoomListModel roomModel}) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var roomList = [];
    roomList.clear();
    roomList.add(roomListController.roomListModel.value.propertyGallery?.images?[0].image?.url);
    roomList.add(roomListController.roomListModel.value.propertyGallery?.images?[1].image?.url);
    roomList.add(roomListController.roomListModel.value.propertyGallery?.images?[2].image?.url);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color(0xffFFFFFF),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Stack(
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
                    items: roomList.map((imageUrl) {
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
                        count: roomList.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Colors.orange,
                          dotHeight: 8,
                          dotWidth: 8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomModel.summary?.name.toString() ?? "Hotel Name",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            roomModel.summary?.location?.typename ?? "Location",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                            maxLines: 2,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Row(
                        children: [
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text('${roomModel.reviewInfo ?? "0"} km away',overflow: TextOverflow.ellipsis),

                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '${roomModel.summary?.overview?.propertyRating?.rating.toString()} good',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8),
                      RatingBar(
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        onRatingChanged: (value) {
                          setState(() {
                            ratings = value;
                          });
                        },
                        initialRating: roomModel.summary?.overview?.propertyRating?.rating?.toDouble() ?? ratings,
                        maxRating: 5,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            price ?? "Price",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Per night",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      MaterialButton(
                        onPressed: () {
                          Get.to(HotelBookingPage(list: roomList,date: dates,location: roomModel.summary?.location.toString() ?? "",name: roomModel.summary?.name.toString() ?? "",));
                        },
                        child: Text("View Deal"),
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
