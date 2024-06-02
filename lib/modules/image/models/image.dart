import 'dart:convert';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gelis/domain/domain.dart';

class ImageModel extends Equatable {
  final File? file;
  final XFile? xfile;
  final int? id;
  final String? grup;
  const ImageModel({this.file, this.xfile, this.id, this.grup});

  @override
  List<Object?> get props => [file, xfile, id, grup];

  ImageModel copyWith({
    final File? file,
    final XFile? xfile,
    final int? id,
    final String? grup
  }) => ImageModel(
    file: file ?? this.file,
    xfile: xfile ?? this.xfile,
    id: id ?? this.id,
    grup: grup ?? this.grup
  );

  Map<String, dynamic> toMap() => {
    'file_group_id': id,
    'file_group': grup,
    'file': file != null ? ImageUtils.convert(file!) : ''
  };

  String toPost() => jsonEncode(toMap());
}
