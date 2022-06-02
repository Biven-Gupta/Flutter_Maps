import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../bloc/application_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Application>(context);
    debugPrint("Provider currentLocation: ${provider.currentLocation}");
    return Scaffold(
      body: provider.currentLocation == null
          ? const Center(
              child:
                  CircularProgressIndicator(backgroundColor: Colors.redAccent),
            )
          : ListView(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Location',
                    prefixIcon: Icon(Icons.search),
                    hoverColor: Colors.orangeAccent,
                  ),
                ),
                Container(
                  height: 500,
                  child: GoogleMap(
                    myLocationButtonEnabled: true,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(provider.currentLocation!.latitude,
                          provider.currentLocation!.longitude),
                      zoom: 14,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
