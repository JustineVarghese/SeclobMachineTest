import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:taskseclob/Screen/home.dart';

class NavigatePage extends StatefulWidget {
  const NavigatePage({super.key});

  @override
  State<NavigatePage> createState() => _NavigatePageState();
}

class _NavigatePageState extends State<NavigatePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return Search();
      case 2:
        return camera();
      case 3:
        return Rect();
      case 4:
        return Profile();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(_selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
        child: BottomAppBar(
          color: Color(0xff1E2E5D),
          child: NavigationBar(
            backgroundColor: Color(0xff1E2E5D),
            indicatorColor: Color(0xff1E2E5D),
            destinations: [
              NavigationDestination(
                  icon: Image.asset(
                    'asset/home.png',
                    height: 21.h,
                    width: 20.w,
                  ),
                  label: ''),
              NavigationDestination(
                  icon: Image.asset(
                    'asset/Search.png',
                    height: 19.h,
                    width: 19.w,
                  ),
                  label: ''),
              NavigationDestination(
                  icon: Image.asset(
                    'asset/camera.png',
                    height: 22.h,
                    width: 25.w,
                  ),
                  label: ''),
              NavigationDestination(
                  icon: Image.asset(
                    'asset/video.png',
                    height: 21.h,
                    width: 21.w,
                  ),
                  label: ''),
              NavigationDestination(
                  icon: Padding(
                    padding:  EdgeInsets.only(top: 16.h),
                    child: Column(
                      children: [
                        Image.asset(
                          'asset/Profile.png',
                          height: 22.h,
                          width: 22.w,
                        ),
                      
                        Icon(
                          Icons.minimize,
                          size: 10.sp,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  label: '')
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class camera extends StatelessWidget {
  const camera({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class Rect extends StatelessWidget {
  const Rect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
