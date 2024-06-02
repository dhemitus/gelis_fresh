import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class BottomTab extends StatelessWidget {
  final List<Widget> screens;
  final Function(int)? onSelect;
  BottomTab({Key? key, required this.screens, this.onSelect}) : super(key: key);
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  /*List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: home,
        inactiveIcon: homeDisable,
        title: "Home",
        activeColorPrimary: Styles.color006FB0,
        inactiveColorPrimary: Styles.color90979E,
        textStyle: Styles.text10W400
      ),
      PersistentBottomNavBarItem(
        icon: contentFile,
        inactiveIcon: contentFileDisable,
        title: "Data",
        activeColorPrimary: Styles.color006FB0,
        inactiveColorPrimary: Styles.color90979E,
        textStyle: Styles.text10W400,
      ),
      PersistentBottomNavBarItem(
        contentPadding: 0.0,
          icon: Container(
            color: Colors.red,
            width: 1.0.w,
            height: 10.0.w,
          ),
          inactiveIcon: BaseContainer(
            color: Colors.blueGrey,
            width: 46.0.w,
            radius: BorderRadius.circular(46.0.w),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Styles.color2144FD.withOpacity(.2),
                Colors.white.withOpacity(.2)
              ]
            ),
            child: const CenterLogoContainer(),
          ),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
        onPressed: (context) => null
      ),
      PersistentBottomNavBarItem(
        icon: history,
        inactiveIcon: historyDisable,
        title: "History",
        activeColorPrimary: Styles.color006FB0,
        inactiveColorPrimary: Styles.color90979E,
        textStyle: Styles.text10W400,
      ),
      PersistentBottomNavBarItem(
        icon: userCircle,
        inactiveIcon: userCircleDisable,
        title: "User",
        activeColorPrimary: Styles.color006FB0,
        inactiveColorPrimary: Styles.color90979E,
        textStyle: Styles.text10W400,
      ),
    ];
  }*/

  List<PersistentTabConfig> _tabs() => screens.map( (e) {
      return PersistentTabConfig(
        screen: e, 
        item: ItemConfig(
          icon: userCircle,
          inactiveIcon: userCircleDisable,
          activeColorSecondary: Styles.color006FB0,
          textStyle: Styles.text10W400,
          title: 'user'
        )
      );
    }
  ).toList();

  @override
  Widget build(BuildContext context) {

    return PersistentTabView(
      tabs: _tabs(), 
      controller: _controller,
      navBarBuilder: (navbarconfig) => Style15BottomNavBar(
        navBarConfig: navbarconfig,
        navBarDecoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0.w),
            topRight: Radius.circular(20.0.w)
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, -1.0.w),
              blurRadius: 12.0.w,
              spreadRadius: 8.0.w,
              blurStyle: BlurStyle.outer
            )
          ]
        ),
      ),
      avoidBottomPadding: false,
      navBarHeight: 78.0.w,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      popAllScreensOnTapAnyTabs: true,
      popActionScreens: PopActionScreensType.all,
      onTabChanged: onSelect,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        curve: Curves.ease,
        duration: Duration(milliseconds: 200)
      ),
    );
    /*return PersistentTabView(
      context,
      controller: _controller,
      screens: screens,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0.w),
          topRight: Radius.circular(24.0.w),
        ),
        colorBehindNavBar: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, -1.0.w),
              blurRadius: 12.0.w,
              spreadRadius: 8.0.w
          )
        ]
      ),
      onItemSelected: onSelect,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
    );*/
  }
}
