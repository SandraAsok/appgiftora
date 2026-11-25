import 'package:appgiftora/core/app_colors.dart';
import 'package:appgiftora/features/products/all_products.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> circlepics = [
    'assets/images/flowers.jpg',
    'assets/images/frames.jpg',
    'assets/images/hamper.jpg',
    'assets/images/resin.jpg',
    'assets/images/stationary.jpg',
  ];

  List<String> circletxts = [
    'bouque',
    'frame',
    'hamper',
    'resin',
    'stationary',
  ];

  List<String> bannerpics = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'GIFTORA',
          style: GoogleFonts.abrilFatface(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.bgcolor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            /* ------  search bar  ------ */
            SizedBox(
              height: 45,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            /* ------  categories bar  ------ */
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => SizedBox(
                  height: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => AllProducts(),
                            ),
                          );
                        },
                        radius: 30,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(circlepics[index]),
                        ),
                      ),
                      Text(
                        circletxts[index],
                        style: GoogleFonts.adamina(
                          color: AppColors.bgcolor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: 5,
              ),
            ),

            /* --------  advertisment bar  -------- */
            CarouselSlider(
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
                viewportFraction: 0.99,
                enableInfiniteScroll: true,
              ),
              items: bannerpics.map((image) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 15),
            /*  ----------- features list -------------  */
            Container(
              height: 80,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.bgcolor),
              ),
              child: Row(
                children: [
                  Text(
                    "Want Customised Gifts ? ",
                    style: GoogleFonts.abrilFatface(fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
