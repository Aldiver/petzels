import 'package:flutter/material.dart';
import 'package:petzels_app/Model/destination_model.dart';
import 'package:petzels_app/Utils/const.dart';
import 'package:petzels_app/Utils/navigations.dart';

class TravelHomeScreen extends StatefulWidget {
  const TravelHomeScreen({super.key});

  @override
  State<TravelHomeScreen> createState() => _TravelHomeScreenState();
}

class _TravelHomeScreenState extends State<TravelHomeScreen> {
  String category = 'Consultation';
  int selectedIndex = 0;

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
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
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
      iconSize: 24,
      unselectedItemColor: Colors.grey[400],
      selectedItemColor: Colors.teal,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        setState(() {
          selectedIndex = value;
        });
      },
      items: [
        ...List.generate(
          navigationItems.length,
          (index) => BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  navigationItems[index].iconPath,
                  height: 20,
                  color: selectedIndex == index
                      ? Colors.teal
                      : Colors.grey[400],
                ),
                const SizedBox(height: 4),
                Text(
                  navigationItems[index].title,
                  style: TextStyle(
                    color: selectedIndex == index
                        ? Colors.teal
                        : Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            label: '',
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
      padding: const EdgeInsets.only(top: 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            categories.length,
            (index) => Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
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
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: category == categories[index].title
                                ? Colors.black
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        color: category == categories[index].title
                            ? Colors.white
                            : Colors.white,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            categories[index].iconPath,
                            height: 25,
                            color: category == categories[index].title
                                ? Colors.black
                                : Colors.grey[600],
                          ),
                          const SizedBox(height: 3),
                          Text(
                            categories[index].title,
                            style: TextStyle(
                              color: category == categories[index].title
                                  ? Colors.black
                                  : Colors.grey[400],
                              fontSize: 14,
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
