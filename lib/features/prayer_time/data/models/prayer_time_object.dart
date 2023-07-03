import 'package:geocoding/geocoding.dart';

class PrayerTimeObjcet {
  final Placemark? address;
  final String? lat;
  final String? long;
  final String? country;
  final String? city;

  PrayerTimeObjcet(
      {this.address, this.lat, this.long, this.city, this.country});
}
