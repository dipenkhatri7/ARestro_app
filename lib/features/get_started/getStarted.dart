import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/features/auth/widgets/custom_button.dart';
import 'package:arestro_app/features/get_started/widgets/page_layout.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final PageController _pageController = PageController();
  final selectedIndex = ValueNotifier(0);
  final illustrations = [
    "assets/restaurant.json",
    "assets/scan.json",
    "assets/payment.json",
  ];
  final titles = [
    "Find your favourite restaurant",
    "Scan QR code to order food",
    "Pay online or cash on delivery",
  ];
  final subtitles = [
    "Find your favourite restaurant and order food from them",
    "View your food in ARestro mode or scan QR code to order food from your table",
    "Pay online or cash on delivery",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: illustrations.length,
                itemBuilder: (context, index) {
                  return Page_Layout(
                    illustration: illustrations[index],
                    title: titles[index],
                    subtitle: subtitles[index],
                  );
                },
                onPageChanged: (index) {
                  selectedIndex.value = index;
                },
              ),
            ),
            ValueListenableBuilder(
              valueListenable: selectedIndex,
              builder: (context, value, child) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    spacing: 8,
                    children: List.generate(
                      illustrations.length,
                      (indexIndicator) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          height: 8,
                          width:
                              selectedIndex.value == indexIndicator ? 28 : 10,
                          decoration: BoxDecoration(
                            color: selectedIndex.value == indexIndicator
                                ? Colors.black
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ValueListenableBuilder(
                valueListenable: selectedIndex,
                builder: (context, index, child) {
                  if (index == illustrations.length - 1) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CustomButtom(
                        text: "Get Started ",
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/signIn', (route) => false);
                        },
                        color: GlobalVariable.primaryColor,
                        textColor: Colors.white,
                        round: 16,
                        height: 44,
                      ),
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButtom(
                        text: "Skip",
                        onPressed: () {
                          _pageController.animateToPage(
                            illustrations.length - 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        },
                        color: GlobalVariable.primaryColor,
                        textColor: Colors.white,
                        round: 16,
                        size: 0.2,
                        height: 44,
                        textSize: 15,
                      ),
                      CustomButtom(
                        text: "Next",
                        onPressed: () {
                          _pageController.animateToPage(
                            index + 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        },
                        color: GlobalVariable.primaryColor,
                        textColor: Colors.white,
                        round: 16,
                        size: 0.2,
                        height: 44,
                        textSize: 15,
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
