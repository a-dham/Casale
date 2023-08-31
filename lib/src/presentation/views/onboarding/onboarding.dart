import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../widgets/custome_text_button.dart';
import 'components/pageview_body.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: 0,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.10,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 50,
            ),
            SizedBox(
              height: screenHeight * 0.10,
            ),
            //page view start
            Container(
              alignment: Alignment.center,
              width: 400,
              height: screenHeight * 0.4,
              child: PageView(
                onPageChanged: (page) {
                  _currentPage = page;
                  setState(() {});
                },
                scrollDirection: Axis.horizontal,
                controller: _controller,
                allowImplicitScrolling: true,
                physics: const BouncingScrollPhysics(),
                children: const [
                  PageviewBody(
                    image: 'assets/images/onboarding1.png',
                    title: 'Rerports in your mobile',
                    explanationText:
                        'You can make alot of reports and analytic your sales .....',
                  ),
                  PageviewBody(
                    image: 'assets/images/onboarding2.png',
                    title: 'Your Invoices in you Mobile',
                    explanationText:
                        'You can make alot of reports and analytic your sales ................',
                  ),
                  PageviewBody(
                    image: 'assets/images/onboarding3.png',
                    title: 'Your Invoices in you Mobileasdad',
                    explanationText:
                        'You can make alot of reports and analytic your sales ................',
                  ),
                ],
              ),
            ),

            // page view end
            const SizedBox(
              height: 35,
            ),
            DotsIndicator(
              onTap: (index) {
                _currentPage = index;
                setState(() {
                  _controller.jumpToPage(_currentPage);
                });
              },
              dotsCount: 3,
              position: _currentPage,
              decorator: DotsDecorator(
                activeColor: AppColors.orangeColor,
                size: const Size(20.0, 5.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                activeSize: const Size(20.0, 5),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Visibility(
                  visible: isVisible(),
                  child: CustomeTextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.login, (route) => false);
                    },
                    minimumSize: const Size(120, 40),
                    borderwidth: 0,
                    childWidget: Text(
                      S.current.skip,
                      style: const TextStyle(
                        color: AppColors.orangeColor,
                      ),
                    ),
                    borderRaduis: BorderRadius.circular(10),
                    isBorder: BorderStyle.none,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ),
                const Spacer(),
                Visibility(
                  visible: isVisible(),
                  child: CustomeTextButton(
                    onPressed: () {
                      nextToSecondPage();
                      setState(() {});
                    },
                    minimumSize: const Size(120, 40),
                    borderwidth: 1,
                    childWidget: Text(
                      S.current.next,
                      style: const TextStyle(color: AppColors.orangeColor),
                    ),
                    isBorder: BorderStyle.solid,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    borderRaduis: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            startButton(screenHeight),
            SizedBox(
              height: screenHeight * 0.02,
            ),
          ],
        ),
      ),
    );
  }

  startButton(screenHeight) {
    if (_controller.hasClients && _controller.page == 2) {
      return CustomeTextButton(
          childWidget: Text(
            S.current.start,
            style: const TextStyle(
              color: AppColors.orangeColor,
              fontSize: 16,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
            ),
          ),
          borderwidth: 0,
          borderRaduis: BorderRadius.circular(10),
          isBorder: BorderStyle.none,
          backgroundColor: AppColors.whiteColor,
          elevation: 8,
          minimumSize: Size(150, screenHeight * 0.06),
          onPressed: () {
            CacheHelper.saveData(key: 'onboarding', value: true).then((value) {
              if (value!) {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.login, (route) => false);
              }
            });
          });
    } else {
      return const SizedBox();
    }
  }

  isVisible() {
    bool visibilty;
    if (_controller.hasClients && _controller.page == 2) {
      visibilty = false;
    } else {
      visibilty = true;
    }
    return visibilty;
  }

  nextToSecondPage() {
    if (_controller.hasClients && _controller.page == 0 ||
        _controller.hasClients && _controller.page == 1) {
      _controller.nextPage(
          duration: const Duration(
            milliseconds: 600,
          ),
          curve: Curves.easeIn);
    } else if (_controller.hasClients && _controller.page == 2) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.login, (route) => false);
    }
  }
}
