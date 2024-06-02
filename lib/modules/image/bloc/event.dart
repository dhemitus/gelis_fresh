part of './bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class ImageBrowseEvent extends ImageEvent {
  final ImageModel image;
  const ImageBrowseEvent(this.image);

  @override
  List<Object> get props => [image];
}

class ImageCaptureEvent extends ImageEvent {
  final ImageModel image;
  const ImageCaptureEvent(this.image);

  @override
  List<Object> get props => [image];
}

class ImageUploadEvent extends ImageEvent {
  
}
