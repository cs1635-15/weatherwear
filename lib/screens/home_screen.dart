import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:weatherwear/widgets/user_avatar.dart';
import '../widgets/greeting_section.dart';
import '../widgets/weather_info.dart';
import '../widgets/my_calendar.dart';
import '../widgets/outfit_suggestions.dart';
import '../models/outfit.dart';
import '../screens/closet_screen.dart';
import '../screens/camera_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

@override
  Widget build(BuildContext context) {
    // same vertical sapcing
    const double verticalSpacing = 16.0;
    // same horizontal spacing
    const double horizontalPadding = 16.0;

    // fake data
    final String verticalImagePath = 'assets/images/cj.jpeg';
    final List<String> squareImagePaths = [
      'assets/images/hat.jpeg',
      'assets/images/sungass.jpeg',
      'assets/images/boot.jpeg',
    ];

    // calculate the high on right one 
    final double rightImagesHeight = squareImagePaths.length * 100.0 + (squareImagePaths.length - 1) * 10.0;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Wear'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                // - 
                padding: EdgeInsets.fromLTRB(horizontalPadding, verticalSpacing, horizontalPadding, verticalSpacing / 2),
                child: const GreetingSection(username: 'Aaron'),
              ),
              Padding(
                // keep
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalSpacing / 2),
                child: const WeatherInfoSection(),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              //   child: const UserAvatar(), // suggestion avatar
              // ),

              // add suggestion 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // left
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: rightImagesHeight, // high
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(verticalImagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // right
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: squareImagePaths.map((path) {
                          return Container(
                            height: 100, // high
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: MyCalendar(), // calendar
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: OutfitSuggestions(
                    outfits: fakeOutfits), // suggestion about outfit
              ),
            ],
          ),
        ),
      ),
    );
  }
}
