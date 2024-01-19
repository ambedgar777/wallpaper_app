class PhotosModel {
  String? url;
  SrcModel? src;

  PhotosModel({this.url, this.src});

  factory PhotosModel.fromMap(Map<String, dynamic> parsedJson) {
    return PhotosModel(
      url: parsedJson['url'],
      src: SrcModel.fromMap(parsedJson['src']),
    );
  }
}

class SrcModel {
  String? portrait;
  String? landscape;
  String? large;
  String? medium;

  SrcModel({this.portrait, this.landscape, this.large, this.medium});
  factory SrcModel.fromMap(Map<String, dynamic> srcJson) {
    return SrcModel(
      portrait: srcJson['portrait'],
      landscape: srcJson['landscape'],
      medium: srcJson['medium'],
      large: srcJson['large'],
    );
  }
}
