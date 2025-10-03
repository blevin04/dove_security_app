import 'package:dove/pages/authpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double dimNum = 0.0;
    bool showContacts = false;
    bool showNewSafezone = false;

    ValueNotifier<bool> newSelection = ValueNotifier(false);
    List<double> selectedLocation = List.empty(growable: true);
    TextEditingController newSafeZoneName = TextEditingController();
    MapController mapController1 = MapController(
      initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
      areaLimit: const BoundingBox(
        east: 10.4922941,
        north: 47.8084648,
        south: 45.817995,
        west: 5.9559113,
      ),
    );
    MapController mapController2 = MapController(
      initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
      areaLimit: const BoundingBox(
        east: 10.4922941,
        north: 47.8084648,
        south: 45.817995,
        west: 5.9559113,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome username"),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              (MaterialPageRoute(builder: (context) => const Authpage())),
            ),
            icon: Icon(Icons.person),
          ),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text("Live chip Location: "),
                StatefulBuilder(
                  builder: (context, state) {
                    return AnimatedOpacity(
                      opacity: dimNum,
                      duration: Duration(milliseconds: 150),
                      onEnd: () {
                        state(() {});
                      },
                    );
                  },
                ),
              ],
            ),
            Card(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width - 10,
                child: OSMFlutter(
                  controller: mapController1,
                  osmOption: OSMOption(
                    showZoomController: true,
                    isPicker: true,
                    zoomOption: ZoomOption(initZoom: 16),
                  ),
                  onGeoPointClicked: (point) {
                    selectedLocation = [point.latitude, point.longitude];
                    newSelection.value = !newSelection.value;
                    print(point.latitude);
                  },
                ),
              ),
            ),

            Card(
              child: StatefulBuilder(
                builder: (context, state2) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text("Add new chip Safezone"),
                        trailing: Icon(
                          showNewSafezone
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),
                        onTap: () {
                          state2(() {
                            showNewSafezone = !showNewSafezone;
                          });
                        },
                      ),
                      Visibility(
                        visible: showNewSafezone,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.all(5),
                              alignment: Alignment.center,
                              child: ValueListenableBuilder(
                                valueListenable: newSelection,
                                builder:
                                    (
                                      BuildContext context,
                                      dynamic value,
                                      Widget? child,
                                    ) {
                                      return selectedLocation.isEmpty
                                          ? Text(
                                              "Select on the map the center of your safezone",
                                            )
                                          : Text(
                                              "${selectedLocation.first}, ${selectedLocation.last}",
                                            );
                                    },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: TextField(
                                controller: newSafeZoneName,
                                decoration: InputDecoration(
                                  labelText: "name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 3,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black),
                              ),
                              alignment: Alignment.center,
                              width: 200,
                              height: 40,
                              child: Text("Save"),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Card(
              child: StatefulBuilder(
                builder: (context, state1) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text("contacts "),
                        trailing: Icon(Icons.keyboard_arrow_down_sharp),
                        onTap: () {
                          state1(() {
                            showContacts = !showContacts;
                          });
                        },
                      ),
                      Visibility(
                        visible: showContacts,
                        child: FutureBuilder(
                          future: Future.delayed(Duration(seconds: 1)),
                          builder: (context, asyncSnapshot) {
                            if (asyncSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            }

                            return ListView.builder(
                              itemCount: 1,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile();
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Card(
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width - 20,
                child: Center(child: Text("Button Offline")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
