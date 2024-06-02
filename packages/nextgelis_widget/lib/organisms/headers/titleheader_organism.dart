import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class TitleHeader extends StatelessWidget {
  final String? label;
  final Function()? onBack, onSearch;
  final Function(String)? onChange, onSubmit;
  final bool? back;
  const TitleHeader({
    Key? key,
    this.label,
    this.onBack,
    this.onSearch,
    this.onChange,
    this.onSubmit,
    this.back = true
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
            SearchInputText(onSearch: onSearch, onChange: onChange, onSubmit: onSubmit,)
          ]
        ),
      );
  }
}
