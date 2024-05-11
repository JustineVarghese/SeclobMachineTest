import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:taskseclob/Screen/apicall/user.dart';
import 'package:taskseclob/Screen/model/user.dart';
import 'package:taskseclob/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiCall? data;

  @override
  void initState() {
    getData();

    super.initState();
  }

  getData() async {
    data = await fetchMedia();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Center(
            child: Image.asset(
              'asset/back.png',
              height: 32.h,
              width: 32.w,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: Center(
              child: Image.asset(
                'asset/menu.png',
                height: 32.h,
                width: 32.w,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Row(
                children: [
                  data==null?CircularProgressIndicator():
                  ClipRRect(
                    borderRadius: BorderRadius.circular(46.r),
                    child: Image.network(
                      data!.media!.first.profilePic!,
                      height: 86.h,
                      width: 86.w,
                    ),
                  ),
                  Gap(42.w),
                  newrow(
                    text: '50',
                    text1: 'Post',
                  ),
                  Gap(31.w),
                  newrow(
                    text: '564',
                    text1: 'Followers',
                  ),
                  Gap(31.w),
                  newrow(
                    text: '564',
                    text1: 'Following',
                  )
                ],
              ),
            ),
            Gap(6.h),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rayan Moon',
                    style: font14fw5001E3167,
                  ),
                  Gap(6.h),
                  Text(
                    'Photographer',
                    style: font10fw4001E3167,
                  ),
                  Gap(6.h),
                  Text(
                    "🌟 You are beautiful, and \nI'm here to capture it! 🌟",
                    style: font12fw3001E3167,
                  ),
                  Gap(6.h),
                  Row(
                    children: [
                      Contain(
                        text2: 'Edit profile',
                        color: Color(0xff184AC0),
                      ),
                      Gap(7.w),
                      Contain(
                        text2: 'Wallet',
                        color: Color(0xff28426B),
                      ),
                      Gap(7.w),
                      Container(
                        height: 40.h,
                        width: 43.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            color: Color.fromARGB(255, 101, 137, 220)),
                        child: Center(
                          child: Image.asset(
                            'asset/phone.png',
                            height: 14.h,
                            width: 14.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(20.h),
            Divider(
              color: Color(0xffA7ACD0),
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Photos',
                  style: font12fw600white,
                ),
                Container(
                  height: 16.h,
                  width: 1,
                  decoration: BoxDecoration(color: Color(0xffA7ACD0)),
                ),
                Text(
                  'Videos',
                  style: font12fw600white,
                ),
              ],
            ),
            Divider(
              color: Color(0xffA7ACD0),
              height: 12.h,
            ),
            data == null
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 24),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 8.w,
                    ),
                    itemCount: data!.media!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Container(
                            height: 160.h,
                            width: 122.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.network(
                                data!.media![index].filePath.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.yellow),
                          ),
                          Positioned(
                            bottom: 5.h,
                            left: 26.w,
                            child: Column(
                              children: [
                                Icon(Icons.favorite_outline,color: Colors.white,size: 17.sp,),
                                Text(data!.media![index].likeCount.toString(),style: font8fw300white,)
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 5.h,
                            right: 26.w,
                            child: Column(
                              children: [
                                Image.asset('asset/message.png',height: 15.h,width: 15.w,),
                                Text(data!.media![index].commentCount.toString(),style: font8fw300white,)
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class Contain extends StatelessWidget {
  const Contain({
    super.key,
    required this.text2,
    required this.color,
  });
  final String text2;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 145.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), color: color),
      child: Center(
          child: Text(
        text2,
        style: font14fw500white,
      )),
    );
  }
}

class newrow extends StatelessWidget {
  const newrow({
    super.key,
    required this.text,
    required this.text1,
  });
  final String text;
  final String text1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: font18fw5001E3167,
        ),
        Text(
          text1,
          style: font12fw5001E3167,
        )
      ],
    );
  }
}
