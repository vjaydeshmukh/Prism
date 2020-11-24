import 'package:Prism/theme/jam_icons_icons.dart';
import 'package:Prism/theme/themeModel.dart';
import 'package:Prism/ui/widgets/animated/showUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController onboardingCarouselController = PageController();
  int _currentPage;
  int selectedTheme;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.initState();
    _currentPage = 0;
    onboardingCarouselController.addListener(() {
      setState(() {
        _currentPage = onboardingCarouselController.page.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentPage != 0) {
          onboardingCarouselController.previousPage(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOutCubic);
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFE57697),
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView(
                controller: onboardingCarouselController,
                physics: const BouncingScrollPhysics(),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShowUpTransition(
                        forward: true,
                        slideSide: SlideFromSlide.bottom,
                        delay: const Duration(milliseconds: 50),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 120, 8, 8),
                          child: Image.asset(
                            'assets/images/prism.png',
                            scale: 0.5,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const ShowUpTransition(
                            forward: true,
                            slideSide: SlideFromSlide.bottom,
                            delay: Duration(milliseconds: 150),
                            child: Text(
                              'Welcome to Prism!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: _currentPage == 0
                                ? const ShowUpTransition(
                                    forward: true,
                                    slideSide: SlideFromSlide.bottom,
                                    delay: Duration(milliseconds: 200),
                                    child: Text(
                                      'The Next Level in customisation!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 15,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
                          const SizedBox(
                            height: 179,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          const ShowUpTransition(
                            forward: true,
                            slideSide: SlideFromSlide.bottom,
                            delay: Duration(milliseconds: 50),
                            child: Text(
                              'Customise your experience!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.0),
                            child: ShowUpTransition(
                              forward: true,
                              slideSide: SlideFromSlide.bottom,
                              delay: Duration(milliseconds: 200),
                              child: Text(
                                'These preferences will enhance your experience. You can always change these later.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 36,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.0),
                            child: ShowUpTransition(
                              forward: true,
                              slideSide: SlideFromSlide.bottom,
                              delay: Duration(milliseconds: 200),
                              child: Text(
                                'Select a theme',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.935,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: MaterialButton(
                                      color: Theme.of(context).hintColor,
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        Provider.of<ThemeModel>(context,
                                                listen: false)
                                            .changeThemeByID(
                                                themes.keys.toList()[index]);
                                        setState(() {
                                          selectedTheme = index;
                                        });
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.27,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black12),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: themes[themes.keys
                                                      .toList()[index]]
                                                  .hintColor,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    themes.keys
                                                        .toList()[index]
                                                        .substring(2),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle2
                                                        .copyWith(
                                                            color: themes[themes
                                                                        .keys
                                                                        .toList()[
                                                                    index]]
                                                                .accentColor),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          index == selectedTheme
                                              ? Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.27,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.06,
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .accentColor
                                                          .withOpacity(0.5),
                                                      border: Border.all(
                                                          color:
                                                              Colors.black45),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        JamIcons.check,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.0),
                            child: ShowUpTransition(
                              forward: true,
                              slideSide: SlideFromSlide.bottom,
                              delay: Duration(milliseconds: 200),
                              child: Text(
                                'By clicking next you are agreeing to the Terms and Conditions and Privacy Policy.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 179,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      onboardingCarouselController.nextPage(
                          duration: const Duration(milliseconds: 150),
                          curve: Curves.easeOutCubic);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOutCubic,
                      padding: _currentPage == 0
                          ? const EdgeInsets.fromLTRB(4, 0, 4, 0)
                          : _currentPage == 1
                              ? const EdgeInsets.fromLTRB(2, 0, 2, 0)
                              : const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        _currentPage == 0
                            ? 'GET STARTED'
                            : _currentPage == 1
                                ? 'NEXT'
                                : 'FINISH',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFFE57697),
                          fontSize: 15,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  OBIndicator(currentPage: _currentPage),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OBIndicator extends StatelessWidget {
  const OBIndicator({
    Key key,
    @required int currentPage,
  })  : _currentPage = currentPage,
        super(key: key);

  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [0, 1, 2].map((i) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          width: _currentPage == i ? 12.0 : 7.0,
          height: 7.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500),
            color: _currentPage == i ? Colors.white : Colors.white38,
          ),
        );
      }).toList(),
    );
  }
}