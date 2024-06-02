import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class ImageWo extends Equatable {
  final ImageModel? image;
  final ImageStatus? status;

  const ImageWo({this.image, this.status});

  @override
  List<Object?> get props => [image, status];
  
  ImageWo copyWith({
    ImageModel? image,
    ImageStatus? status
  }) => ImageWo(
    image: image ?? this.image,
    status: status ?? this.status
  );
}
