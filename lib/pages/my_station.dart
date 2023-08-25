import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:krishakthi/components/card.dart';
import 'package:krishakthi/components/equipment_details.dart';
import 'package:krishakthi/components/map_icons.dart';

const LatLng currentLocation = LatLng(31.224020, 75.770798);
class MyStation extends StatefulWidget {
  const MyStation({super.key});

  @override
  State<MyStation> createState() => _MyStationState();
}

class _MyStationState extends State<MyStation> {
  late GoogleMapController mapController;

  final Map<String, Marker> _markers = {};
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, 
            icon: const ImageIcon(AssetImage("lib/Icons/Funnel.png"))
            )
          ],
          title: const Text(
                      'My Station',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      color: Color(0xFFE26B26),
                      fontSize: 20,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w600,
                      height: 1.38,
                        ),
)),
body: Stack(
        children: [
          // Google Map (Replace with actual Google Maps widget)
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: currentLocation,
              zoom: 16,
              ),
              onMapCreated: (controller) {
                mapController = controller;
                addMarker('test', currentLocation);
              },
              markers: _markers.values.toSet(),
            ),

          Positioned.fill(
              child: Container(
               padding: const EdgeInsets.only(top: 16.0),
              color: Colors.transparent, 
              child: Column(
                children: [
                  // Search Bar
                  SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.all(16.0),
                      color: Colors.white,
                      child: TextField(
                        
                        decoration: InputDecoration(
                          hintText: 'Search Area, Locality',
                          suffixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 200.0),
                  // Content Container
                  Expanded(
                    
                 child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            width: double.infinity,
                            // height: double.infinity,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    
                                    children: [
                                      SizedBox(width: 16.0,),
                                      MapIcons(imagePath: 'lib/Icons/drone.png', labelText: 'Drone Spray'),
                                      SizedBox(width: 24.0,),
                                      MapIcons(imagePath: 'lib/Icons/transport.png', labelText: 'Transport'),
                                      SizedBox(width: 24.0,),
                                      MapIcons(imagePath: 'lib/Icons/Warehouse.png', labelText: 'Storage'),
                                      SizedBox(width: 24.0,),
                                      MapIcons(imagePath: 'lib/Icons/Farmer.png', labelText: 'Manpower'),
                                      SizedBox(width: 24.0,),
                                      MapIcons(imagePath: 'lib/Icons/Report.png', labelText: 'Soil Texting'),
                                
                                  ],),
                                ),
                                SizedBox(height: 20,),
                                Padding(
                                  padding: EdgeInsets.all(14.0),
                                  child: Text(
                                              'Available Drone Spraying',
                                              style: TextStyle(
                                              color: Color(0xFF200E32),
                                              fontSize: 16,
                                              fontFamily: 'Mukta',
                                              fontWeight: FontWeight.w500,
                                              height: 1.38,
                                              ),
                                              ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: DetailCard(imagePath: 'lib/Icons/drones.jpg', equipment: 'Krishakthi', description: '  drones with smart nozzle spraying starting from ', price: '\$51'),
                                ),
                                 Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: DetailCard(imagePath: 'lib/Icons/drones.jpg', equipment: 'Krishakthi', description: '  drones with smart nozzle spraying starting from ', price: '\$32'),
                                ),
                                 Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: DetailCard(imagePath: 'lib/Icons/drones.jpg', equipment: 'Krishakthi', description: '  drones with smart nozzle spraying starting from ', price: '\$32'),
                                ),   
                                Padding(
                                  padding: EdgeInsets.all(14.0),
                                  child: Text(
                                              'Recommended for you',
                                              style: TextStyle(
                                              color: Color(0xFF200E32),
                                              fontSize: 16,
                                              fontFamily: 'Mukta',
                                              fontWeight: FontWeight.w500,
                                              height: 1.38,
                                              ),
                                              ),
                                ),    
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(width: 10.0,),
                                  RecommendationCard(
                                      imagePath: 'lib/Icons/farmland.png',
                                      title: 'Book Drone Spray',
                                      description: 'Spray your farms with smart precision spraying technology.',
                                    ),
                                    
                                    RecommendationCard(
                                      imagePath: 'lib/Icons/Tractor.png',
                                      title: 'Book Tractor',
                                      description: 'Spray your farms with smart precision spraying technology.',
                                    ),
                                   
                                    
                                ],
                              ),
                            )
                                  
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )
    );
  }
  addMarker(String id, LatLng location) {
    var marker = Marker(markerId: MarkerId(id),
    position: location,
    infoWindow: const InfoWindow(
      title: '1st location',
      snippet: 'Drone Spray Location',
    ),
    
    );

    _markers[id] = marker;
    setState(() {
      
    });
  }
}