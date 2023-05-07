import 'package:flutter/material.dart';
import 'package:garage_repair/Screen/onboarding/login.dart';

class OnBoardingSteps extends StatefulWidget {
  const OnBoardingSteps({Key? key}) : super(key: key);

  @override
  State<OnBoardingSteps> createState() => _OnBoardingStepsState();
}

class _OnBoardingStepsState extends State<OnBoardingSteps> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: demo_data.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                  image: demo_data[index].image,
                  title: demo_data[index].title,
                  description: demo_data[index].description,
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Login()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text('Skip', style: TextStyle(
                      color: Color(0xff21B24B
                      ),
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                      fontStyle: FontStyle.normal
                    ),),
                  ),
                ),


                // ...List.generate(
                //     demo_data.length,
                //     (index) => Padding(
                //           padding: const EdgeInsets.only(right: 4.0),
                //           child: DotIndicator(
                //             isActive: index == _pageIndex,
                //           ),
                //         )),
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_pageController.page == 3) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Login()));
                      } else {
                        _pageController.nextPage(
                            curve: Curves.decelerate,
                            duration: const Duration(milliseconds: 1200));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(), primary: Colors.green),
                    child:
                        const Icon(Icons.arrow_forward_rounded, color: Colors.white),
                    // child: SvgPicture.asset("assets/Unkown.png",
                    //     color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

// class DotIndicator extends StatelessWidget {
//   const DotIndicator({
//     Key? key,
//     this.isActive = false,
//   }) : super(key: key);
//
//   final bool isActive;
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 300),
//       height: isActive ? 12 : 4,
//       width: 4,
//       decoration: BoxDecoration(
//           color: isActive ? Colors.green : Colors.green.withOpacity(0.4),
//           borderRadius: const BorderRadius.all(Radius.circular(12))),
//     );
//   }
// }

class Onboard {
  final String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

final List<Onboard> demo_data = [
  Onboard(
    image: "assets/images/splash1.png",
    title: "Car Repair",
    description:
        "We provide you with services that enhances your car is perfectly working well and fine,we also save your time and work till the end your satisfaction is met.",
  ),
  Onboard(
    image: "assets/images/splash2.png",
    title: "Insurance",
    description:
        "We've got your back in this! We provide various types of insurance to ensure your car is secured from any damage",
  ),
  Onboard(
    image: "assets/images/splash4.png",
    title: "Tow vehicle",
    description:
        "Name the location, we're always ready to help you tow your automobile, we offer fast services and also provide the fastest means of achieving this aim.",
  ),
  Onboard(
    image: "assets/images/splash5.png",
    title: "Vehicle Servicing",
    description:
        "Name the location, we’re always ready to help you tow your automobile, we offer fast services and also provide the fastest means of achieving this aim.",
  )
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Center(child: Image.asset(image)),
        const SizedBox(
          height: 50,
        ),
        Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontSize: 22,
                fontFamily: "manrope")),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                height: 1.5,
                color: Colors.black,
                fontSize: 14,
                fontFamily: "manrope"),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
