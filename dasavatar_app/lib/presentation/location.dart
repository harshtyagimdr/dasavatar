import 'package:dasavatar_app/presentation/custom/customscafold.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  static const String routeNamed = '';

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<Marker> allMarkers = [];
  @override
  void initState() {
    super.initState();
    allMarkers.add(Marker(
      markerId: MarkerId('myMarker'),
      draggable: false,
      onTap: () {
        print('Marker Tapped');
      },
      position: LatLng(27.4924, 77.6737),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarText: 'Location',
      appbarOnTap: () {},
      body: Stack(
        children: [
          Container(
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: LatLng(27.4924, 77.6737), zoom: 12.0),
              markers: Set.from(allMarkers),
            ),
          ),
        ],
      ),
    );
  }
}
