import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class MenuCard extends StatelessWidget {
  final Function? onTap;
  final List<Widget>? list;
  const MenuCard({Key? key, this.list, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
     height: 256.0.w,
      padding: EdgeInsets.all(16.0.w),
      child: ShadowCard(
        child: GridView.count(padding: EdgeInsets.all(16.0.w),
          crossAxisCount: 4,
          mainAxisSpacing: 12.0.w,
          crossAxisSpacing: 4.0.w,
          children: list!,
        ),
      ),

    );
  }
} 
