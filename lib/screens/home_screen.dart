import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:xwash/screens/profile_screen.dart';

import '../routes/route_names.dart';
import '../widgets/category_bottomsheet.dart';
import '../widgets/support_dialog.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer timer;

  @override
  void initState() {
    _pageController = PageController();
    timer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        if (_currentPage < 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: theme.primaryColor,
        backgroundColor: Colors.white.withOpacity(.2),
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              builder: (context) => const CategoryBottomSheet(),
            ),
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.monetization_on_outlined,
              size: 30,
              color: theme.primaryColor,
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => const SupportDialog(),
            ),
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.chat_outlined,
              size: 30,
              color: theme.primaryColor,
            ),
          ),
          IconButton(
            onPressed: () => context.pushNamed(RouteName.profile),
            iconSize: 30,
            padding: const EdgeInsets.only(right: 6),
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    leading: const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/logo1.jpg'),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          '4.8',
                          style: TextStyle(color: theme.primaryColor),
                        ),
                        const Text(
                          '(988)',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    subtitle: const Text('Dry cleaning . Laundry . Pressing'),
                  ),
                  SizedBox(
                    height: 200,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (value) => setState(() {
                        _currentPage = value;
                      }),
                      children: [
                        Container(
                          height: 200,
                          width: size.width,
                          alignment: AlignmentDirectional.bottomStart,
                          decoration: const BoxDecoration(
                            // color: Colors.green,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/laundry_.jpg'),
                            ),
                          ),
                          child: Text(
                            'Home Care . Clean and Press',
                            style: TextStyle(
                              backgroundColor: theme.primaryColor,
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          height: 200,
                          width: size.width,
                          alignment: AlignmentDirectional.bottomStart,
                          decoration: const BoxDecoration(
                            // color: Colors.green,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/laundryman.jpg'),
                            ),
                          ),
                          child: Text(
                            'At your finger tips',
                            style: TextStyle(
                              backgroundColor: theme.primaryColor,
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      indicator(theme, _currentPage == 0),
                      const SizedBox(width: 10),
                      indicator(theme, _currentPage == 1),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ProfileCard(
                    text: 'You have 0 active orders',
                    leadingImg: 'assets/images/orders.png',
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
                  ProfileCard(
                    text: 'Pricing',
                    leadingImg: 'assets/images/price.png',
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (_) => const CategoryBottomSheet(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            width: size.width,
            color: const Color(0xffD2CDF1),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: InkWell(
              onTap: () => showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (_) => const PlaceNewOrderBottomSheet(),
              ),
              child: Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Place New Order',
                      style: TextStyle(
                        color: Colors.white.withOpacity(.9),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container indicator(ThemeData theme, bool isActive) {
    return Container(
      height: 3,
      width: 15,
      color: isActive ? theme.primaryColor : theme.primaryColor.withOpacity(.4),
    );
  }
}

class PlaceNewOrderBottomSheet extends StatelessWidget {
  const PlaceNewOrderBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 3, 20, 0),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 40),
              Expanded(
                flex: 10,
                child: Text(
                  'Select Service',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.primaryColor,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.close, color: theme.primaryColor),
              )
            ],
          ),
          const Divider(),
          const SizedBox(height: 15),
          ServiceWidget(
            onTap: () {
              Navigator.of(context).pop();
              context.pushNamed(RouteName.order);
            },
            img: 'assets/images/cloths.jpg',
            label: 'Laundry & Dry Cleaning',
          ),
          const SizedBox(height: 20),
          ServiceWidget(
            onTap: () {
              Navigator.of(context).pop();
              context.pushNamed(RouteName.order);
            },
            img: 'assets/images/cleaning.jpg',
            label: 'Domestic & Comercial cleaning',
          ),
        ],
      ),
    );
  }
}

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({
    super.key,
    required this.img,
    required this.label,
    required this.onTap,
  });
  final GestureTapCallback onTap;
  final String label;
  final String img;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                img,
                height: 120,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
