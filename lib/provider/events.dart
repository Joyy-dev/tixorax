import 'package:get/get.dart';

class EventController extends GetxController {
  final List<Map<String, dynamic>> _upcomingEvents = [
    {
      'title': 'Secret Garden Jazz',
      'date': 'Friday • 19:30',
      'distance': '2.4 miles away',
      'price': '\$25.00',
      'image': 'assets/images/concert.jpg',
    },
    {
      'title': 'Comedy Under the Stars',
      'date': 'Saturday • 20:00',
      'distance': '0.8 miles away',
      'price': '\$15.00',
      'image': 'assets/images/comedy.png',
    },
    {
      'title': 'Neo-Pop Collective',
      'date': 'Sunday • 18:00',
      'distance': '1.2 miles away',
      'price': '\$42.00',
      'image': 'assets/images/pop.png',
    },
    {
      'title': 'Midnight Rave',
      'date': 'Saturday • 23:30',
      'distance': '3.5 miles away',
      'price': '\$30.00',
      'image': 'assets/images/rave.png',
    },
  ];

  List<Map<String, dynamic>> get upcomingEvents => _upcomingEvents;
}
