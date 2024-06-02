import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class ImageSubmit extends StatelessWidget {
  const ImageSubmit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageBloc, ImageState>(
      builder: (BuildContext context, ImageState state){
        return PrimaryButton(text: 'Simpan Data', onTap: () => context.read<ImageBloc>().add(ImageUploadEvent()),);
      }, 
      listener: (BuildContext context, ImageState state) {
        if(state.status == ImageStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('upload sukses')));
        }
      }
    );
  }
}
