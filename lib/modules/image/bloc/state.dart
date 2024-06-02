part of './bloc.dart';

enum ImageStatus { loading, success, failure, detail }

class ImageState extends Equatable {
  final ImageStatus status;
  final ImageModel image;

  const ImageState({
    this.status = ImageStatus.loading,
    this.image = const ImageModel(),
  });

  ImageState copyWith({
    ImageStatus? status,
    ImageModel? image
  }) => ImageState(
    status: status ?? this.status,
    image: image ?? this.image
  );

  @override
  List<Object> get props => [status, image];
}
