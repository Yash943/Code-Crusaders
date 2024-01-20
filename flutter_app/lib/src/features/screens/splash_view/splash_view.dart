import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/colors.dart';
import 'package:flutter_app/src/features/screens/login_view/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final PageController _controller = PageController();

  bool isLastPage = false;

  // void initsate(){
  //   super.initState();
  //   final user= FirebaseAuth.instance.currentUser!;
  //   if(user != null ){

  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: PageView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                //2 is our last page starting from 0
                isLastPage = index == 2;
              });
            },
            children: [
              //One page layout
              BuildIntroPage(
                img: 'assets/images/img_5.jpg',
                title: 'Welcome onboard',
                description: 'Price Bazzar is a free tool to check price history charts for millions of products ',
              ),

              BuildIntroPage(
                img: 'assets/images/img_6.jpg',
                title: '',
                description: 'With our advanced Price Tracker you can track price for popular Indian stores such as Amazon, Flipkart, Myntra, Ajio, Croma & many more ',
              ),

              BuildIntroPage(
                img: 'assets/images/img_7.jpg',
                title: '',
                description: 'It is used to represent a tool that automatically tracks the price of a product for you, so you don''t have to check the price manually several times a day. ',
              ),
            ],
          )),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              onDotClicked: (index) {
                _controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              effect: ExpandingDotsEffect(
                  activeDotColor: Theme.of(context).primaryColor,
                  dotHeight: 7.0,
                  dotWidth: 7.0,
                  dotColor: Colors.black12),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: bckgnd,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: isLastPage
                    ? () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const LoginPage()));
                      }
                    : () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                child: Text(
                  isLastPage ? 'Continue' : 'Next',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: const Text(
              'Skip',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),

        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class BuildIntroPage extends StatelessWidget {
  String title;
  String img;
  String description;
  BuildIntroPage({
    super.key,
    required this.title,
    required this.description,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          ),
        )),
        const SizedBox(
          height: 40,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}