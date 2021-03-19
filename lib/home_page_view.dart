import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_end2end/utils/app_colors.dart';
import 'package:getx_end2end/utils/shared_pref.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  bool darkMode = false;

  @override
  void initState() {
    // SharedPref.getInstance().then((value) async {
    //   print("sharedPrf $value");
    //   darkMode = await value.getPrefValue(SharedPref.DARK_MODE_KEY);
    // });

    // SharedPref().getPrefValue(SharedPref.DARK_MODE_KEY).then((value) {
    //   print("pref value $value");
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoSwitch(
                  value: darkMode,
                  onChanged: (value) {
                    print(value);
                    // SharedPref().saveToPref(SharedPref.DARK_MODE_KEY, value);
                    if (Get.isDarkMode)
                      Get.changeThemeMode(ThemeMode.light);
                    else
                      Get.changeThemeMode(ThemeMode.dark);

                    setState(() {
                      darkMode = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed("/moviesView");
                  },
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Movies",
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                  color: AppColors.primaryColor,
                ),
                SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed("/shoesStoreView");
                  },
                  color: AppColors.primaryColor,
                  child: Text(
                    "Shoes Store",
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ),
                SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed("/transformView");
                  },
                  color: AppColors.primaryColor,
                  child: Text(
                    "TransFormation",
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ),
                SizedBox(height: 20),
                Visibility(
                  visible: true,
                  child: MaterialButton(
                    onPressed: () {
                      Get.toNamed("/chart_view");
                    },
                    color: AppColors.primaryColor,
                    child: Text(
                      "Chart",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Visibility(
                  visible: true,
                  child: MaterialButton(
                    onPressed: () {
                      showDateRangePicker(
                        context: context,
                        firstDate: DateTime(2012),
                        lastDate: DateTime.now(),
                      ).then((value) {
                        print(value);
                      });
                    },
                    color: AppColors.primaryColor,
                    child: Text(
                      "Date Range Picker",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                MaterialButton(
                  onPressed: () {
                    Get.toNamed("/auth_login_view");
                  },
                  color: AppColors.primaryColor,
                  child: Text(
                    "Auth Login",
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ),

                SizedBox(height: 20),

                MaterialButton(
                  onPressed: () {
                    Get.toNamed("/barcode_scanner_view");
                  },
                  color: AppColors.primaryColor,
                  child: Text(
                    "Barcode Scanner",
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ),
                SizedBox(height: 20),

                MaterialButton(
                  onPressed: () {
                    Get.toNamed("/text_recognition_view");
                  },
                  color: AppColors.primaryColor,
                  child: Text(
                    "Text recognition",
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
