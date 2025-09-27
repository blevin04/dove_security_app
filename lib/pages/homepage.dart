import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.logo_dev),
        title: Text("Welcome username"),
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
                child: Text("Live location data"),
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
                                  labelText: "Email",
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
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Card(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
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
