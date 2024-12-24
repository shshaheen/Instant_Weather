import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 239, 162, 18),
        title: Text(
          "Weather ⛅",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,

          ),
        ),
        centerTitle: true,
        actions: [
          // GestureDetector(
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
              onTap: () => {
                debugPrint("Refresh"),
              },
              child: Icon(Icons.refresh)
              ),
            ),
            // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          children: [
            // Main Card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(16) ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Column(
                      children: [
                        const SizedBox(height: 12,),
                        Text(
                          "300°F",
                          style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        const SizedBox(height: 12,),
                        Icon(Icons.cloud,size: 55),
                        const SizedBox(height: 12,),
                        Text("Rain",style: TextStyle(fontSize: 16),),
                        const SizedBox(height: 12,),
                      ],
                    ),
                  ),
                ),
              
              ),
            ),
            const SizedBox(height: 20),

            
            Align(
              alignment: Alignment.centerLeft,
              
              child: const Text(
                "Weather Forecast",
                style: TextStyle(
                  fontSize: 24,
                    fontWeight: FontWeight.bold),
                    )
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                            SizedBox(
                              width: 120,
                              child: Card (
                                elevation: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                    child: Padding(  
                                      padding: const EdgeInsets.only(left: 15, right: 15,top: 10, bottom: 10),                                    
                                      child: Column(
                                        children: [
                                          const SizedBox(height:10),
                                          Text('03:00',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ), ),
                                          const SizedBox(height: 8,),
                                          Icon(Icons.cloud , size: 32,),
                                          const SizedBox(height: 8,),
                                          Text('320.12',
                                          ),
                                          const SizedBox(height: 8,),
                                          ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              
                            ),
                            SizedBox(
                              width: 120,
                              child: Card (
                                elevation: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                    child: Padding(  
                                      padding: const EdgeInsets.only(left: 15, right: 15,top: 10, bottom: 10),                                    
                                      child: Column(
                                        children: [
                                          const SizedBox(height:10),
                                          Text('03:00',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ), ),
                                          const SizedBox(height: 8,),
                                          Icon(Icons.cloud , size: 32,),
                                          const SizedBox(height: 8,),
                                          Text('320.12',
                                          ),
                                          const SizedBox(height: 8,),
                                          ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              
                            ),
                            SizedBox(
                              width: 120,
                              child: Card (
                                elevation: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                    child: Padding(  
                                      padding: const EdgeInsets.only(left: 15, right: 15,top: 10, bottom: 10),                                    
                                      child: Column(
                                        children: [
                                          const SizedBox(height:10),
                                          Text('03:00',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ), ),
                                          const SizedBox(height: 8,),
                                          Icon(Icons.cloud , size: 32,),
                                          const SizedBox(height: 8,),
                                          Text('320.12',
                                          ),
                                          const SizedBox(height: 8,),
                                          ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              
                            ),
                            SizedBox(
                              width: 120,
                              child: Card (
                                elevation: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                    child: Padding(  
                                      padding: const EdgeInsets.only(left: 15, right: 15,top: 10, bottom: 10),                                    
                                      child: Column(
                                        children: [
                                          const SizedBox(height:10),
                                          Text('03:00',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ), ),
                                          const SizedBox(height: 8,),
                                          Icon(Icons.cloud , size: 32,),
                                          const SizedBox(height: 8,),
                                          Text('320.12',
                                          ),
                                          const SizedBox(height: 8,),
                                          ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              
                            ),
                            SizedBox(
                              width: 120,
                              child: Card (
                                elevation: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                    child: Padding(  
                                      padding: const EdgeInsets.only(left: 15, right: 15,top: 10, bottom: 10),                                    
                                      child: Column(
                                        children: [
                                          const SizedBox(height:10),
                                          Text('03:00',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ), ),
                                          const SizedBox(height: 8,),
                                          Icon(Icons.cloud , size: 32,),
                                          const SizedBox(height: 8,),
                                          Text('320.12',
                                          ),
                                          const SizedBox(height: 8,),
                                          ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              
                            ),
                        ],
                        ),
                    ),
            // Weather Forecast Card
            Placeholder(
            fallbackHeight: 120,
            ),
            const SizedBox(height: 20),
        
            // Addition Information Card
            Placeholder(
            fallbackHeight: 120,
            ),
          ],
        ),
      ),
    );
  }
}
