import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSelectionPopup extends StatefulWidget {
  @override
  _MapSelectionPopupState createState() => _MapSelectionPopupState();
}

class _MapSelectionPopupState extends State<MapSelectionPopup> {
  GoogleMapController? _mapController;
  LatLng? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select Location',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              )),
          SizedBox(
            width: double.maxFinite,
            height: 300,
            child: GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                setState(() {
                  _mapController = controller;
                });
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(0, 0), // Initial map center
                zoom: 15, // Initial zoom level
              ),
              onTap: (LatLng location) {
                setState(() {
                  _selectedLocation = location;
                });
              },
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context, null); // Return null when canceled
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, _selectedLocation);
          },
          child: const Text('Select'),
        ),
      ],
    );
  }
}
