import 'package:flutter/material.dart';
import 'package:practice1/core/data/models/hotel_model.dart';
import 'package:practice1/core/data/models/room_model.dart';
import 'package:practice1/representation/screen/checkout_screen.dart';
import 'package:practice1/representation/screen/guest_and_room_booking.dart';
import 'package:practice1/representation/screen/hotel_detail_screen.dart';
import 'package:practice1/representation/screen/hotels_screen.dart';
import 'package:practice1/representation/screen/main_app.dart';
import 'package:practice1/representation/screen/select_date_screen.dart';
import 'package:practice1/representation/screen/select_room_screen.dart';
import 'package:practice1/representation/screen/splash_screen.dart';
import 'representation/screen/hotel_booking_screen.dart';
import 'representation/screen/intro_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  GuestAndRoomBooking.routeName: (context) => GuestAndRoomBooking(),
  HotelsScreen.routeName: (context) => HotelsScreen(),
  SelectRoomScreen.routeName: (context) => SelectRoomScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HotelDetailScreen.routeName:
      final HotelModel hotelModel = (settings.arguments as HotelModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelDetailScreen(
          hotelModel: hotelModel,
        ),
      );
    case CheckoutScreen.routeName:
      final RoomModel roomModel = (settings.arguments as RoomModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => CheckoutScreen(
          roomModel: roomModel,
        ),
      );
    case HotelBookingScreen.routeName:
      final String? destination = (settings.arguments as String?);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelBookingScreen(
          destination: destination,
        ),
      );
    default:
      return null;
  }
}
