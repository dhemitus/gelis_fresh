import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:gelis/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:gelis/modules/modules.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepository {

  Future<LocationMap> sendLocation(LocationModel l) async {
    try {
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final TokenModel token = TokenModel.fromString(storage.getString('token')!);
      final http.Response response = await http.post(
        Uri.parse(Network.map),
        headers: Network.tokenHeader('Bearer ${token.token}'),
        body: l.toPost()
      ); 
      if (response.statusCode == 200) {
        debugPrint(response.body);
        return const LocationMap(status: LocationStatus.success);
      } else {
        throw LocationException(const LocationMap(status: LocationStatus.failure));
      }
    } catch (e) {
      throw LocationException(const LocationMap(status: LocationStatus.failure));
    }
  }


  Future<bool> getPermission() async {
    bool enable;
    LocationPermission permission;

    enable = await Geolocator.isLocationServiceEnabled();

    if(!enable) {
      print('service unable');
      return false;
    }

    permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {
        print('permission denied');
        return false;
      }
    }

    if(permission == LocationPermission.deniedForever) {
      print('permission no hope');
      return false;
    }

    return true;
  }

  Future<LocationMap> getCurrentLocation() async {
    final permission = await getPermission();

    if(!permission) return const LocationMap(status: LocationStatus.failure);

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    String place = await getAddress(position.latitude, position.longitude);

    LocationMap map = LocationMap(
      location: LocationModel(
        latitude: position.latitude,
        longitude: position.longitude,
        latitudeLongitude: '${position.latitude}, ${position.longitude}',
        address: place
      ),
      status: LocationStatus.drop
    );
    return map;
  }

  Future<String> getAddress(double latitude, double longitude) async {
    List<Placemark> places = await placemarkFromCoordinates(latitude, longitude);
    Placemark place = places[0];
    print('${place.street} ${place.subLocality} ${place.country} ${place.locality}');
    return place.street ?? '';
  }


}
