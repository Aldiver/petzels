import 'package:flutter/material.dart';
import 'package:petzels_app/Model/destination_model.dart';
import 'package:petzels_app/Utils/const.dart';


class TravelHomeScreen extends StatefulWidget {
  const TravelHomeScreen({super.key});

  @override
  State<TravelHomeScreen> createState() => _TravelHomeScreenState();
}

class _TravelHomeScreenState extends State<TravelHomeScreen> {
  String category = 'Consultation';
  int selectedIndex = 0;
  List<IconData> icons = [
    Icons.home_rounded,
    Icons.location_on_rounded,
    Icons.bookmark_outline_rounded,
    Icons.settings_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section (Search & Categories)
            Material(
              elevation: 1,
              color: primaryColor, // Match with content area
              child: Column(
                children: [
                  searchBar(),
                  const SizedBox(height: 10),
                  categorySelection(),
                ],
              ),
            ),

            // Scrollable Content Area
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // Placeholder for the card swiper
                  Container(
                    height: size.height * 0.52,
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  // Additional content can be added here
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomSheet: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 30,
        unselectedItemColor: Colors.black26,
        selectedItemColor: Colors.lightBlue,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          ...List.generate(
            icons.length,
            (index) => BottomNavigationBarItem(
              icon: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Icon(
                    icons[index],
                  ),
                  const SizedBox(height: 5),
                  selectedIndex == index
                      ? Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: blue),
                        )
                      : Container(),
                ],
              ),
              label: "",
            ),
          ),
        ],
      ),
    );
  }

  // Search Bar Widget
  Padding searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Place",
                hintStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.black26,
                ),
                prefixIcon: const Icon(Icons.search, size: 30),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: lightblue,
            ),
            child: const Icon(
              Icons.tune,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // Category Selection Widget
  SingleChildScrollView categorySelection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            categories.length,
            (index) => Padding(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    category = categories[index].title;
                    // Adjust your filtering logic here based on the category selected
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: category == categories[index].title
                            ? Colors.blue
                            : Colors.white,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            categories[index].iconPath,
                            height: 40,
                            color: category == categories[index].title
                                ? Colors.white
                                : Colors.grey[400],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            categories[index].title,
                            style: TextStyle(
                              color: category == categories[index].title
                                  ? Colors.white
                                  : Colors.grey[400],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}