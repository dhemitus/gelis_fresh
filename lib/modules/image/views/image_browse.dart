import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';
import 'package:gelis/modules/modules.dart';

class ImageBrowse extends StatelessWidget {
  const ImageBrowse({Key? key}) : super(key: key);

  void onCapture(BuildContext context, int id) {
    ImageModel m = ImageModel(
      grup: 'QuotationSamplePengujian',
      id: id
    );
    context.read<ImageBloc>().add(ImageCaptureEvent(m));
  }

  void onBrowee(BuildContext context, int id) {
    ImageModel m = ImageModel(
      grup: 'QuotationSamplePengujian',
      id: id
    );
    context.read<ImageBloc>().add(ImageBrowseEvent(m));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(
      buildWhen: (previus, current) => previus.status != current.status && previus.image != current.image,
      builder: (BuildContext context, ImageState state){
        return FileButton(
          image: state.image.file != null ? ImageUtilities.imageFile(state.image.file!) : null,
          onCapture: () {
            int id = context.read<SamplingBloc>().state.sample.id ?? 0;
            onCapture(context, id);
          },
          onBrowse: () {
            int id = context.read<SamplingBloc>().state.sample.id ?? 0;
            onBrowee(context, id);
          },
        );
      },
    );
  }
}
