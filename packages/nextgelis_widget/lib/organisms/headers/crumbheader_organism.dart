import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class CrumbHeader extends StatelessWidget {
  final String? label;
  final Function()? onBack, onSearch;
  final bool? back;
  final List<Widget>? items;
  const CrumbHeader({
    Key? key,
    this.label,
    this.onBack,
    this.onSearch,
    this.back = true,
    this.items = const []
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 60.0.w, left: 20.0.w, right: 20.0.w), 
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                back! ? BaseContainer(
                  padding: EdgeInsets.only(right: 20.0.w),
                  height: 36.0.w,
                  child: TurnBackButton(onTap: onBack),
                ) : Container(),
                BaseContainer(
                  height: 36.0.w, 
                  child: Title2Text(label, color: Styles.color102235,),
                )
              ],
            ),
            SizedBox(height: 8.0.w,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items ?? [] /*[
                CrumbButton(
                  onTap: () => {},
                  text: "K Lapangan",
                  icon: mapLocation,
                  activeIcon: activeMapLocation,
                  activeLineColor: Styles.color0A58B4,
                  lineColor: Styles.colorD1D2D4,
                  activeColor: Styles.colorEAF9FF,
                  color: Colors.white,
                  activeTextColor: Styles.color0A58B4,
                  textColor: Styles.color6A6A6A,
                  width: 110.0.w,
                ),
                chevronRight,
                CrumbButton(
                  onTap: () => {},
                  text: "P Lapangan",
                  icon: flaskConical,
                  activeIcon: activeFlaskConical,
                  activeLineColor: Styles.color0A58B4,
                  lineColor: Styles.colorD1D2D4,
                  activeColor: Styles.colorEAF9FF,
                  color: Colors.white,
                  activeTextColor: Styles.color0A58B4,
                  textColor: Styles.color6A6A6A,
                  width: 110.0.w,
                  active: false,
                ),
                chevronRight,
                CrumbButton(
                  onTap: () => {},
                  text: "Sampling",
                  icon: pippets,
                  activeIcon: activePippets,
                  activeLineColor: Styles.color0A58B4,
                  lineColor: Styles.colorD1D2D4,
                  activeColor: Styles.colorEAF9FF,
                  color: Colors.white,
                  activeTextColor: Styles.color0A58B4,
                  textColor: Styles.color6A6A6A,
                  width: 100.0.w,
                  active: false,
                )
              ]*/,
            )
          ],
          
        ),
      );
  }
}
