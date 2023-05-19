import 'package:flutter/material.dart';
import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/features/maps/widgets/mapCards.dart';
import 'package:arestro_app/models/utils.dart';
import 'package:baato_api/baato_api.dart';
import 'package:baato_api/models/place.dart';
import 'package:baato_api/models/route.dart';
import 'package:baato_api/models/search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class Maps extends StatefulWidget {
  static const String routeName = '/maps';
  Maps({Key? key}) : super(key: key);

  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  MapboxMapController? mapController;
  RouteResponse? routeResponse;
  bool isLoading = false;
  int _circleCount = 0;
  String modeOfRoute = "";
  String baatoAccessToken = "bpk.-1qnhhwV8lwtB_fEb4PUihUl6nZH31auwQfa7MtDf6TJ";
  List<LatLng> _points = new List.empty(growable: true);
  List<Search>? searchResults = <Search>[];
  List<Search>? tempList = <Search>[];
  bool isPinToPin = true;
  bool isMap = true;
  TextEditingController _searchController = TextEditingController();
  static LatLng? currentPostion;

  void _getUserLocation() async {
    // await Geolocator.openAppSettings();
    // await Geolocator.openLocationSettings();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // temporary values for position
    // const Position position = Position(
    //     latitude: 27.7172,
    //     longitude: 85.3240,
    //     timestamp: null,
    //     accuracy: 1,
    //     altitude: 2,
    //     heading: 3,
    //     speed: 3,
    //     speedAccuracy: 2);

    setState(() {
      currentPostion = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _onMapCreated(MapboxMapController controller) {
    this.mapController = controller;
  }

  _requestRoutingDetails(BuildContext context, List<LatLng> latLngList) async {
    var points = [];
    for (LatLng latLng in latLngList) {
      points.add("${latLng.latitude},${latLng.longitude}");
    }
    BaatoRoute baatoRoute = BaatoRoute.initialize(
        accessToken: baatoAccessToken,
        points: points,
        mode: modeOfRoute,
        //can be 'bike', 'car', 'foot'
        alternatives: false,
        instructions: false);

    //get routes between start and destination point
    RouteResponse response = await baatoRoute.getRoutes();
    setState(() {
      routeResponse = response;
    });
    _showRouteDetails(response);
  }

  bool isRouteFull = false;
  _showRouteDetails(RouteResponse response) {
    if (response.data!.isEmpty) {
      print("No result found");
    } else {
      List<GeoCoord> geoCoordinates = BaatoUtils()
          .decodeEncodedPolyline(response.data![0].encodedPolyline!);
      //convert the list into list of LatLng to be used by Mapbox
      List<LatLng> latLngList = <LatLng>[];
      for (GeoCoord geoCoord in geoCoordinates) {
        latLngList.add(LatLng(geoCoord.lat, geoCoord.lon));
      }
      //show routes from the points decoded
      mapController!.clearLines();
      mapController!.addLine(
        LineOptions(
            geometry: latLngList,
            lineColor: "#000000",
            lineWidth: 5.458,
            lineOpacity: 0.5),
      );

      double distanceInKm = response.data![0].distanceInMeters! / 1000;
      distanceInKm = double.parse((distanceInKm).toStringAsFixed(2));

      double timeInSeconds = response.data![0].timeInMs! / 1000;
      String displayTime =
          Utils().giveMeTimeFromSecondsFormat(timeInSeconds.toInt());
      setState(() {
        isRouteFull = true;
        debugPrint("isRouteFull: $isRouteFull");
      });
      Fluttertoast.showToast(
          msg:
              "Distance: ${distanceInKm.toString()}km\nTime: $displayTime\n To Cancel this route, tap on the cross button",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: GlobalVariable.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0,
          webShowClose: true);
    }
  }

  void _addTappedPointToPointsList(BuildContext context, LatLng latLng) {
    debugPrint("InsideaddTappedPointToPointsList");
    debugPrint("circleCount: $_circleCount");

    if (_circleCount < 2) {
      _points.add(latLng);
      _addCircle(latLng);
      _circleCount++;
      if (_circleCount == 2) {
        _requestRoutingDetails(context, _points);
      }
    }
  }

  void _addCircle(LatLng latlng) {
    debugPrint("InsideaddCircle");
    String circleColor = "#081E2A";
    if (_circleCount == 1) circleColor = "#63A088";
    mapController!.addSymbol(
      SymbolOptions(
        geometry: latlng,
        iconImage: 'assets/images/Pins.png',
        iconSize: 0.25,
        iconColor: circleColor,
      ),
    );
    // mapController!.addCircle(
    //   CircleOptions(
    //       geometry: latlng,
    //       circleColor: circleColor,
    //       circleRadius: 6.0,
    //       circleStrokeColor: '#757575',
    //       circleStrokeWidth: 4.0),
    // );
  }

  Widget _mainData() {
    return Center(
      child: isLoading
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: searchResults!.length,
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      const EdgeInsets.only(top: 8.45, left: 8.45, right: 8.45),
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      // setState(() {
                      //   isMap = true;
                      //   isPinToPin = true;
                      // });
                      _searchController.clear();
                      // _points.clear();
                      // _circleCount = 0;
                      // mapController!.clearLines();
                      // mapController!.clearSymbols();
                      // // _addCircle(LatLng(
                      // //     searchResults![index].latitude!,
                      // //     searchResults![index].longitude!));
                      // // _points.add(LatLng(
                      // //     searchResults![index].latitude!,
                      // //     searchResults![index].longitude!));
                      // _circleCount++;
                      // _addCircle(currentPostion!);
                      // _points.add(currentPostion!);
                      // _circleCount++;
                      // _requestRoutingDetails(context, _points);
                    },
                    child: ListTile(
                      title: Text(
                        searchResults![index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.85,
                            fontFamily: 'Manrope',
                            letterSpacing: 0.45),
                      ),
                      subtitle: Text(
                        searchResults![index].address,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Manrope',
                          letterSpacing: 0.45,
                        ),
                      ),
                      leading: Icon(
                        Icons.location_pin,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  bool isClicked = false;
  Widget _searchBar(bool iclick) {
    isClicked = iclick;
    setState(() {
      isMap = false;
      isPinToPin = false;
    });
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.45),
        child: Row(
          children: [
            isClicked
                ? Container()
                : CircleAvatar(
                    radius: 22.45,
                    backgroundColor: isClicked ? Colors.black : Colors.white,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: isClicked ? Colors.white : Colors.black,
                        size: 24,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        // isClicked == false
                        //     ? Navigator.pop(context)
                        //     : setState(() {
                        //         isClicked = false;
                        //         // isMap = true;
                        //         // isPinToPin = true;
                        //       });
                      },
                    ),
                  ),
            const SizedBox(
              width: 8.45,
            ),
            Expanded(
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 251, 251, 251).withOpacity(0.95),
                  borderRadius: BorderRadius.circular(28.45),
                  border: isClicked
                      ? Border.all(
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.95),
                        )
                      : Border.all(
                          color: Color.fromARGB(255, 251, 251, 251)
                              .withOpacity(0.95),
                        ),
                ),
                child: TextField(
                  onTap: () {
                    setState(() {
                      iclick = true;
                      isClicked = true;
                    });
                  },
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Manrope',
                  ),
                  autocorrect: false,
                  controller: _searchController,
                  onChanged: (text) {
                    _searchBaatoPlaces(text);
                  },
                  cursorColor: Colors.black,
                  decoration: isClicked
                      // decoration: _searchController.text.isNotEmpty
                      ? InputDecoration(
                          //border
                          border: InputBorder.none,
                          prefixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isClicked = false;
                              });
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _searchController.clear();
                                      searchResults = [];
                                      iclick = false;
                                      isClicked = false;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.black,
                                  ),
                                )
                              : Container(),
                          hintText: "Search...",
                          hintStyle: TextStyle(
                            color: Color(0xff9C9C9C),
                            fontFamily: 'Manrope',
                          ),
                        )
                      : const InputDecoration(
                          prefixIcon: Icon(
                            Icons.pin_drop,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          hintText: "Search...",
                          hintStyle: TextStyle(
                            color: Color(0xff9C9C9C),
                            fontFamily: 'Manrope',
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _searchBaatoPlaces(String query) async {
    setState(() {
      isLoading = true;
    });
    tempList = <Search>[];
    BaatoSearch baatoSearch = BaatoSearch.initialize(
      query: query,
      accessToken: baatoAccessToken,
      type: 'restaurant', //optional parameter
      limit: 20, //optional parameter
    );
    //perform Search
    SearchResponse response = await baatoSearch.searchQuery();
    if (response == null) {
      setState(() {
        isLoading = false;
      });
    }
    if (response != null && response.status == 200) tempList = response.data;

    setState(
      () {
        searchResults = tempList;
        isLoading = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String mapStyle = "retro";
    return currentPostion == null
        ? Container(
            child: Center(
              child: Text(
                'loading map..',
                style:
                    TextStyle(fontFamily: 'Manrope', color: Colors.grey[400]),
              ),
            ),
          )
        : MaterialApp(
            theme: ThemeData(
              snackBarTheme: SnackBarThemeData(
                contentTextStyle: TextStyle(fontFamily: "Manrope"),
              ),
            ),
            home: Scaffold(
              floatingActionButton: isClicked
                  ? null
                  : Wrap(
                      direction: Axis.vertical,
                      children: [
                        //
                        Container(
                          margin: EdgeInsets.only(top: 8, bottom: 8, left: 8),
                          child: FloatingActionButton(
                            heroTag: "btn1",
                            elevation: 8,
                            backgroundColor: GlobalVariable.primaryColor,
                            onPressed: () {
                              Fluttertoast.showToast(
                                msg:
                                    "Tap on the map to select any two points to get routes between them...",
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 5,
                                backgroundColor: Colors.grey[700],
                                textColor: Colors.white,
                                fontSize: 16.0,
                                webPosition: "top",
                                webShowClose: true,
                              );
                              setState(
                                () {
                                  isPinToPin = !isPinToPin;
                                  debugPrint(isPinToPin.toString());
                                },
                              );
                            },
                            child: isPinToPin
                                ? IconButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          isPinToPin = false;
                                        },
                                      );
                                    },
                                    icon: const Icon(Icons.close),
                                  )
                                : Row(
                                    children: const [
                                      Icon(Icons.location_pin),
                                      Text("-"),
                                      Icon(Icons.location_pin),
                                    ],
                                  ),
                          ),
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                          child: FloatingActionButton(
                            heroTag: "btn2",
                            elevation: 8,
                            backgroundColor: GlobalVariable.primaryColor,
                            onPressed: () {
                              setState(() {
                                isMap = !isMap;
                              });
                            },
                            child: isMap
                                ? IconButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          isMap = false;
                                        },
                                      );
                                    },
                                    icon: const Icon(Icons.close),
                                  )
                                : Icon(Icons.map),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8, bottom: 8, left: 8),
                          child: FloatingActionButton(
                            heroTag: "btn3",
                            elevation: 8,
                            backgroundColor: GlobalVariable.primaryColor,
                            onPressed: () async {
                              var position = await GeolocatorPlatform.instance
                                  .getCurrentPosition();
                              setState(
                                () {
                                  currentPostion = LatLng(
                                      position.latitude, position.longitude);
                                },
                              );
                            },
                            child: Icon(Icons.location_pin),
                          ),
                        ),
                        isRouteFull
                            ? Container(
                                margin: const EdgeInsets.only(
                                    top: 8, bottom: 8, left: 8),
                                child: FloatingActionButton(
                                    heroTag: "btn4",
                                    elevation: 8,
                                    backgroundColor:
                                        GlobalVariable.primaryColor,
                                    onPressed: () {
                                      setState(() {
                                        isMap = !isMap;
                                      });
                                    },
                                    child: IconButton(
                                      onPressed: () {
                                        if (_circleCount == 2) {
                                          _circleCount = 0;
                                          _points.clear();
                                          mapController!.clearSymbols();
                                          mapController!.clearLines();
                                          setState(() {
                                            isRouteFull = false;
                                          });
                                        }
                                      },
                                      icon: const Icon(Icons.close),
                                    )),
                              )
                            : Container(
                                height: 0,
                                width: 0,
                              ),
                      ],
                    ),
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    // isPinToPin
                    MapboxMap(
                      myLocationEnabled: true,
                      compassEnabled: true,
                      accessToken:
                          'sk.eyJ1IjoiZGlwZW5raGF0cmkiLCJhIjoiY2xjeXQxenpoMHEwczN3cWxycGRxejhobiJ9.BWQ-dDBsvvwiaZ9NWu5upA',
                      onMapClick: isPinToPin
                          ? (point, latLng) {
                              debugPrint("Inside onMapClick");
                              _addTappedPointToPointsList(context, latLng);
                            }
                          : null,
                      trackCameraPosition: true,
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: currentPostion!,
                        zoom: 14.0,
                      ),
                      styleString:
                          "https://api.baato.io/api/v1/styles/$mapStyle?key=$baatoAccessToken",
                    ),
                    // : MapboxMap(
                    //     myLocationEnabled: true,
                    //     compassEnabled: true,
                    //     accessToken:
                    //         'sk.eyJ1IjoiZGlwZW5raGF0cmkiLCJhIjoiY2xjeXQxenpoMHEwczN3cWxycGRxejhobiJ9.BWQ-dDBsvvwiaZ9NWu5upA',
                    //     trackCameraPosition: true,
                    //     onMapCreated: _onMapCreated,
                    //     initialCameraPosition: CameraPosition(
                    //       target: currentPostion!,
                    //       zoom: 14.0,
                    //     ),
                    //     styleString:
                    //         "https://api.baato.io/api/v1/styles/$mapStyle?key=$baatoAccessToken",
                    //   ),
                    isMap
                        ? Positioned(
                            bottom: 2,
                            left: 2,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.81,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.45),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: Colors.grey[200],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 8,
                                    ),
                                    child: const Text(
                                      "Select Map Style",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.85,
                                        fontFamily: 'Manrope',
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            mapStyle = "Breeze";
                                            isMap = false;
                                          });
                                        },
                                        child: const MapCards(
                                          mapStyle: "Breeze",
                                          imageName: "breeze.png",
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            mapStyle = "Dark";
                                            isMap = false;
                                          });
                                        },
                                        child: const MapCards(
                                          mapStyle: "Dark",
                                          imageName: "dark.png",
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            mapStyle = "Outdoor";
                                            isMap = false;
                                          });
                                        },
                                        child: const MapCards(
                                          mapStyle: "Outdoor",
                                          imageName: "outdoor.png",
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            mapStyle = "Retro";
                                            isMap = false;
                                          });
                                        },
                                        child: const MapCards(
                                          mapStyle: "Retro",
                                          imageName: "retro.png",
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            mapStyle = "Monochrome";
                                            isMap = false;
                                          });
                                        },
                                        child: const MapCards(
                                          mapStyle: "Mono",
                                          imageName: "monochrome.png",
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            mapStyle = "Boundaries";
                                            isMap = false;
                                          });
                                        },
                                        child: const MapCards(
                                          mapStyle: "Boundary",
                                          imageName: "boundaries.png",
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    isPinToPin
                        ? Positioned(
                            bottom: 2,
                            // bottom: MediaQuery.of(context).size.height * 0.1,
                            left: 2,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.81,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.45),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: Colors.grey[200],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 8,
                                    ),
                                    child: const Text(
                                      "Select the mode of travel",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.85,
                                        fontFamily: 'Manrope',
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                modeOfRoute = "foot";
                                                debugPrint(modeOfRoute);
                                                isPinToPin = false;
                                              });
                                            },
                                            child: const MapCards(
                                              mapStyle: "Foot",
                                              imageName: "foot.png",
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                modeOfRoute = "bike";
                                                isPinToPin = false;
                                              });
                                            },
                                            child: const MapCards(
                                              mapStyle: "Bike",
                                              imageName: "bike.png",
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                modeOfRoute = "car";
                                                isPinToPin = false;
                                              });
                                            },
                                            child: const MapCards(
                                              mapStyle: "Car",
                                              imageName: "car.png",
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                modeOfRoute = "foot";
                                                isPinToPin = false;
                                              });
                                            },
                                            child: const MapCards(
                                              mapStyle: "Foot",
                                              imageName: "foot.png",
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                modeOfRoute = "bike";
                                                isPinToPin = false;
                                              });
                                            },
                                            child: const MapCards(
                                              mapStyle: "Bike",
                                              imageName: "bike.png",
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                modeOfRoute = "car";
                                                isPinToPin = false;
                                              });
                                            },
                                            child: const MapCards(
                                              mapStyle: "Car",
                                              imageName: "car.png",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    _searchController.text.isNotEmpty || isClicked
                        ? Positioned(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  _searchBar(true),
                                  Expanded(
                                    child: Container(child: _mainData()),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Positioned(
                            child: _searchBar(false),
                          )
                  ],
                ),
              ),
            ),
          );
  }
}
