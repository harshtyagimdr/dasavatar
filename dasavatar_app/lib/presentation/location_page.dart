import 'package:dasavatar_app/presentation/custom/customscafold.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  double lat;
  double long;

  Location({this.lat, this.long});

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
      position: LatLng(widget.lat, widget.long),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarText: 'Location',
      appbarOnTap: () {
        Navigator.pop(context);
      },
      body: Stack(
        children: [
          Container(
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: LatLng(widget.lat, widget.long), zoom: 12.0),
              markers: Set.from(allMarkers),
            ),
          ),
        ],
      ),
    );
  }
}
