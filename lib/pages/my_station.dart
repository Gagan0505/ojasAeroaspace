import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:krishakthi/components/card.dart';
import 'package:krishakthi/components/equipment_details.dart';
import 'package:krishakthi/components/map_icons.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

const LatLng currentLocation = LatLng(31.224020, 75.770798);
class MyStation extends StatefulWidget {
  const MyStation({super.key});

  @override
  State<MyStation> createState() => _MyStationState();
}

class _MyStationState extends State<MyStation> {
  SheetController controller = SheetController();
  late GoogleMapController mapController;

  final Map<String, Marker> _markers = {};
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
 body: buildSheet(),
 ));

 }
 


 Widget buildSheet() {
  return SlidingSheet(
    openDuration: const Duration(milliseconds: 900),
    controller: controller,
    color: Colors.white,
    shadowColor: Colors.black26,
    elevation: 12,
    maxWidth: 500,
    cornerRadius: 16,
    cornerRadiusOnFullscreen: 0.0,
    closeOnBackdropTap: true,
    closeOnBackButtonPressed: true,
    addTopViewPaddingOnFullscreen: true,
    isBackdropInteractable: true,
    border: Border.all(color: Colors.grey.shade300,
    width: 3,
    ),
    snapSpec: const SnapSpec(
      snap: true,
      positioning: SnapPositioning.relativeToAvailableSpace,
      snappings: [
        0.1,
        0.6,
        1,
      ],
    ),
    // liftOnScrollHeaderElevation: 12.0,
    body: _buildBody(),
    headerBuilder: buildheader,
    builder: buildChild,

  );
 }


Widget buildheader(BuildContext context, SheetState state) {
  return Column(
    children: [
      const SizedBox(height: 2,),
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 16,
          height: 4,
           decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.grey.withOpacity(
                .5,
              ),
              ),
        ),
      ),
      const SizedBox(height: 5,),
      const  SingleChildScrollView(
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
             
              ],
            )
         ),
    const SizedBox(height: 5,),
    Container(
    height: 1,
    color: Colors.grey.shade300,
  )
    ],
  );
}

Widget buildChild(BuildContext context, SheetState state) {
  final divider = Container(
    height: 1,
    color: Colors.grey.shade300,
  );

  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      // mainAxisSize: MainAxisSize.min,
      children: <Widget>[
      divider,
       const Padding(
            padding: EdgeInsets.all(14.0),
          child: Text('Available Drone Spraying',
            style: TextStyle(
           color: Color(0xFF200E32),
            fontSize: 16,
            fontFamily: 'Mukta',
            fontWeight: FontWeight.w500,
            height: 1.38,
            ),
            ),
           ),
           const Padding(
             padding: EdgeInsets.all(8.0),
             child: DetailCard(imagePath: 'lib/Icons/drones.jpg', equipment: 'Krishakthi', description: '  drones with smart nozzle spraying starting from ', price: '\$51'),
           ),
            const Padding(
             padding: EdgeInsets.all(8.0),
             child: DetailCard(imagePath: 'lib/Icons/drones.jpg', equipment: 'Krishakthi', description: '  drones with smart nozzle spraying starting from ', price: '\$32'),
           ),
            const Padding(
             padding: EdgeInsets.all(8.0),
             child: DetailCard(imagePath: 'lib/Icons/drones.jpg', equipment: 'Krishakthi', description: '  drones with smart nozzle spraying starting from ', price: '\$32'),
           ),   
           const Padding(
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
       const SingleChildScrollView(
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
              
      
    ],)
    )
    ]
    ),
  );

}

Widget _buildBody() {
  
  return Stack(
    children: <Widget>[
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
      Container(
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
                  )
    ]
    ,);

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