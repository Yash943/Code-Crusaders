import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/colors.dart';
import 'package:flutter_app/src/features/screens/notifications/notifications_view.dart';
import 'package:flutter_app/src/features/screens/search/search_view.dart';
import 'package:iconly/iconly.dart';

import '../../../common_widgets/custom_textfiled.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: bckgnd,
        toolbarHeight: 110,
        flexibleSpace: SafeArea(
            child: Container(
          margin: const EdgeInsets.only(top: 5, bottom: 0, left: 15, right: 15),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Price Bazaar',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: 'ADLaMDisplay',
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationPage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.notifications,
                      size: 38,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                child: SizedBox(
                  height: 60,
                  child: CostomTextFormFild(
                            hint: "Search Products",
                            prefixIcon: IconlyLight.search,
                            filled: true,
                            enabled: false,
                          ),
                ),
                // SizedBox(
                //   height: 40,
                //   child: TextFormField(
                //     textAlign: TextAlign.start,
                //     decoration: const InputDecoration(
                //         fillColor: Colors.white,
                //         enabled: true,
                //         filled: true,
                //         hintText: 'Search 10000+ Products',
                //         hintStyle: TextStyle(color: Colors.black),
                //         contentPadding: EdgeInsets.all(0),
                //         prefixIcon: Icon(
                //           Icons.search,
                //           color: Colors.black,
                //         ),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.all(Radius.circular(10)),
                //           borderSide: BorderSide(color: Colors.white),
                //         )),
                //   ),
                // ),
              
              )
            ],
          ),
        )),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: const [
                  carouselItems(img: 'assets/images/ad1.jpg'),
                  carouselItems(img: 'assets/images/ad2.jpg'),
                  carouselItems(img: 'assets/images/ad3.jpg'),
                ],
                options: CarouselOptions(
                    height: 180,
                    initialPage: 0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 10),
                    enableInfiniteScroll: true,
                    viewportFraction: 1.1),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categoryTitle.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (1 / 0.8),
                      // mainAxisExtent: 70,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        color: Colors.white.withOpacity(0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              categoryImg[index],
                              alignment: const Alignment(1, 1),
                              width: 120,
                            ),
                            Text(
                              categoryTitle[index],
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class carouselItems extends StatelessWidget {
  const carouselItems({
    super.key,
    required this.img,
  });

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

List<String> categoryTitle = [
  'Audio',
  'Automotive',
  'Baby',
  'Bags',
  'Beauty',
  'Books',
  'Cameras',
  'Clothing',
  'Computers',
  'Furntiure',
  'Gaming',
  'Health & Fitness',
  'Jewellery',
  'Laptops',
  'Mobiles',
  'Tablets',
];

List<String> categoryImg = [
  'assets/images/Audio.png',
  'assets/images/Automotive.jpg',
  'assets/images/Baby.jpg',
  'assets/images/Bags.jpg',
  'assets/images/Beauty.png',
  'assets/images/Books.png',
  'assets/images/Cameras.png',
  'assets/images/Clothing.png',
  'assets/images/Computer.png',
  'assets/images/Furntiure.jpg',
  'assets/images/Gaming.png',
  'assets/images/Health and Fitness.jpg',
  'assets/images/Jewelery.jpg',
  'assets/images/Laptop.jpg',
  'assets/images/Mobile.png',
  'assets/images/Tablets.png',
];
