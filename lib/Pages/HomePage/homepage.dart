import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_dbgetx/Controller/location_controller.dart';
import 'package:weatherapp_dbgetx/Controller/theme_comtroller.dart';
import 'package:weatherapp_dbgetx/Controller/weather_dbcontroller.dart';
import 'package:weatherapp_dbgetx/Services/ext.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  LiveLocationController liveLocationController =
      Get.put(LiveLocationController());
  WeatherController weather = Get.put(WeatherController());
  ThemeController theme = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: [
          Obx(() {
            return IconButton(
              onPressed: () {
                theme.ChangeTheme();
                theme.isdark.value
                    ? Get.changeTheme(ThemeData.dark())
                    : Get.changeTheme(ThemeData.light());
              },
              icon: Icon(
                theme.isdark.value ? Icons.light_mode : Icons.dark_mode,
              ),
            );
          }),
          IconButton(
            onPressed: () {
              Get.toNamed('/fav_Page');
            },
            icon: const Icon(
              Icons.favorite,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed('/search_Page');
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blue,
      body: Obx(() {
        return weather.allWeather.isEmpty
            ? const Center(
                child: LinearProgressIndicator(),
              )
            : Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 280,
                        width: double.infinity,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? Colors.black.withOpacity(0.5)
                              : Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                // Weather Icon
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Get.isDarkMode
                                        ? Colors.black.withOpacity(0.5)
                                        : Colors.white.withOpacity(0.5),
                                  ),
                                  child: Icon(
                                    Icons.cloud,
                                    size: 32.0,
                                    // color: Colors.grey[600],
                                  ),
                                ),
                                // Temperature
                                Text(
                                  '${weather.temp(0).toStringAsFixed(0)}°',
                                  style: const TextStyle(
                                    fontSize: 48.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 0.01),
                            // Weather Description
                            const Text(
                              '',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: h * 0.01),
                            // City Name
                            Text(
                              'Nagpur',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // 3 Day Forecast Section
                      Container(
                        padding: EdgeInsets.all(10),
                        height: h * 0.25,
                        width: double.infinity,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? Colors.black.withOpacity(0.5)
                              : Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today Forecast',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            Text(
                              '${"${DateTime.now().day.toString().padLeft(2, '0')}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year}"}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: h * 0.02),
                            Container(
                              height: 150,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: weather.allWeather.length,
                                itemBuilder: (context, index) => weather
                                            .allWeather[index].dtTxt.pickdate ==
                                        DateTime.now().pickdate
                                    ? Container(
                                        width: 100,
                                        height: 50,
                                        padding: const EdgeInsets.all(5),
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: theme.isdark.value
                                              ? Colors.white.withOpacity(0.3)
                                              : Colors.black.withOpacity(0.3),
                                        ),
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            Text(
                                              weather.allWeather[index].dtTxt
                                                  .pickTime,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              '${weather.temp(index).toStringAsFixed(0)}°',
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: theme.isdark.value
                                                    ? Colors.black
                                                    : Colors.white,
                                              ),
                                            ),
                                            Text(
                                              weather.allWeather[index]
                                                  .weather[0].main,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: <Widget>[
                            //     // Today's Forecast
                            //
                            //     Expanded(
                            //         child: Column(
                            //       children: [
                            //         Text('Today'),
                            //         Icon(Icons.cloud),
                            //         Text('temperature: 28°/23°'),
                            //       ],
                            //     )),
                            //     Expanded(
                            //         child: Column(
                            //       children: [
                            //         Text('Tomorrow'),
                            //         Icon(Icons.cloud),
                            //         Text('temperature: 28°/23°'),
                            //       ],
                            //     )),
                            //     Expanded(
                            //         child: Column(
                            //       children: [
                            //         Text('Monday'),
                            //         Icon(Icons.cloud),
                            //         Text('temperature: 28°/23°'),
                            //       ],
                            //     )),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      // 5 Day Forecast Section
                      Container(
                        // height: 200,
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? Colors.black.withOpacity(0.5)
                              : Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.0),
                            topRight: Radius.circular(24.0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '5 Day Forecast',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            SizedBox(height: h * 0.01),
                            // 5 Day Forecast Grid

                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 7,
                              itemBuilder: (BuildContext context, int index) {
                                var day = DateTime.now()
                                    .add(Duration(days: index + 1));
                                return Card(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${day}'),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: "${26 + index} /",
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 16,
                                                  )),
                                              TextSpan(
                                                  text: " 26",
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 16,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
