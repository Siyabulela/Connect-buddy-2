import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:Connect_buddy/Screens/Welcome/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Connect_buddy/Screens/Welcome/Community.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> _signOut() async {
  await _auth.signOut();
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // backgroundColor: Colors.transparent,

      // ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          // FloatingActionButton(
          //   backgroundColor: const Color(0xff03dac6),
          //   foregroundColor: Colors.black,
          //   mini: true,
          //   onPressed: () {
          //     // Respond to button press
          //   },
          //   child: Icon(Icons.add),
          // );
        },
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _currentLocation,
      //   label: Text('Get Location'),
      //   icon: Icon(Icons.location_on),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0, // this will be set when a new tab is tapped
      //   backgroundColor: Colors.blue,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: new Icon(Icons.home),
      //       title: new Text('Home'),
      //       backgroundColor: Colors.red,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: new Icon(Icons.mail),
      //       title: new Text('Messages'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.logout),
      //       title: Text('Logout'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       title: Text('Profile'),
      //     )
      //   ],
      // ),
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 31),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                onPressed: () {
                  _navigateToNextScreen(context);
                },
                child: Text("TroubleShoot"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            // child: FloatingActionButton(
            //   onPressed: _currentLocation,
            //   child: Icon(Icons.location_on),
            // ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  _signOut();
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ));
                }),
            Spacer(),
            IconButton(
                icon: Icon(Icons.location_on),
                onPressed: () {
                  _currentLocation();
                })
          ],
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CommunityPage()));
  }

  void _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    LocationData currentLocation;
    var location = new Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 17.0,
      ),
    ));
  }
}
