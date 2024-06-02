import 'dart:io';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';
import 'package:gelis/domain/domain.dart';

part './event.dart';
part './state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepository _imageRepository;
  ImageBloc(ImageRepository imageRepository) : _imageRepository = imageRepository, super(const ImageState()) {
    on<ImageBrowseEvent>(_onBrowse);
    on<ImageCaptureEvent>(_onCapture);
    on<ImageUploadEvent>(_onUpload);
  }

  Future<void> _onBrowse(ImageBrowseEvent event, Emitter<ImageState> emit) async {
    try {
      emit(state.copyWith(status: ImageStatus.loading));
      File f = await ImageUtils.load();
      ImageModel m = event.image.copyWith(
        file: f, 
      );

      emit(state.copyWith(image: m, status: ImageStatus.detail));
    } catch(_) {
      emit(state.copyWith(status: ImageStatus.failure));
    }
  }

  Future<void> _onCapture(ImageCaptureEvent event, Emitter<ImageState> emit) async {
    try {
      emit(state.copyWith(status: ImageStatus.loading));
      File f = await ImageUtils.capture();
      ImageModel m = event.image.copyWith(
        file: f, 
      );

      emit(state.copyWith(image: m, status: ImageStatus.detail));
    } catch(_) {
      emit(state.copyWith(status: ImageStatus.failure));
    }
  }

  Future<void> _onUpload(ImageUploadEvent event, Emitter<ImageState> emit) async {
    try {
      emit(state.copyWith(status: ImageStatus.loading));
      ImageWo w = await _imageRepository.sendImage(state.image);

      emit(state.copyWith(image: w.image, status: w.status));
    } catch (_) {
      emit(state.copyWith(status: ImageStatus.failure));
    }
  }
}
