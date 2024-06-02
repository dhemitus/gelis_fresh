import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class FileButton extends StatelessWidget {
  final Function? onBrowse, onCapture;
  final String? text;
  final DecorationImage? image;

  const FileButton({
    Key? key,
    this.onBrowse,
    this.onCapture,
    this.text = '', 
    this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      height: 152.0.w,
      radius: BorderRadius.circular(10.0.w),
      border: Border.all(color: Styles.colorD8D8D8, width: 1.0.w),
      image: image,
      alignment: Alignment.bottomCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => onBrowse?.call(),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BaseContainer(
                  height: 46.w,
                  child: solidCamera,
                ),
                const Title2Text('Gallery', color: Styles.colorC0C0C0,)
              ],
            ),
          ),
          GestureDetector(
            onTap: () => onCapture?.call(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BaseContainer(
                  height: 46.w,
                  child: solidCamera,
                ),
                const Title2Text('Camera', color: Styles.colorC0C0C0,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
