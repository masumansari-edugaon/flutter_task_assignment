import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/room_list_model.dart';

class RoomListController extends GetxController {
  Rx<RoomListModel> roomListModel = RoomListModel().obs;

  Future<void> fetchRoom() async {
    var startTime = DateTime.now();
    var endTime = startTime.add(Duration(days: 1)); // For the next day

    String startDate = "${startTime.year}-${startTime.month}-${startTime.day}";
    String endDate = "${endTime.year}-${endTime.month}-${endTime.day}";

    try {
      var hotelId = 74717;
      var url = Uri.parse('https://hotels-com-provider.p.rapidapi.com/v2/hotels/summary?hotel_id=1105156&locale=es_AR&domain=AR');
      var headers = {
        'Accept':'application/json',
        'Content-Type':'null',
        'x-rapidapi-ua':'RapidAPI-Playground',
        'x-rapidapi-host': 'hotels-com-provider.p.rapidapi.com',
        'x-rapidapi-key': 'cc19090772mshac9740f949a8255p146fb3jsne392aba920a5',
        'specificMethodHeaders':'[object Object]'
      };

      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print("response.statusCode ${response.statusCode}");
        var data = jsonDecode(response.body);
        print("_____________________$data ---______");
        roomListModel.value = RoomListModel.fromJson(data);
      } else {
        print("Failed to fetch rooms. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print("Error occurred while fetching rooms: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchRoom();
  }
}
