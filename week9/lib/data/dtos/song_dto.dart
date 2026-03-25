import '../../model/songs/song.dart';

class SongDto {
  static const String idKey = 'id';
  static const String titleKey = 'title';
  static const String artistKey = 'artistId';
  static const String durationKey = 'duration'; // in ms
  static const String imageUrlKey = 'imageUrl';

  static Song fromJson(String id, Map<String, dynamic> json) {
    // assert(json[idKey] is String);
    assert(json[titleKey] is String);
    assert(json[artistKey] is String);
    assert(json[durationKey] is int);

    return Song(
      id: id,
      title: (json[titleKey] as String?) ?? '',
      artistId: (json[artistKey] as String?) ?? '',
      duration: Duration(milliseconds: (json[durationKey] as int?) ?? 0),
      imageUrl: (json[imageUrlKey] as String?) ?? '',
    );
  }

  /// Convert Song to JSON
  static Map <String, dynamic> toJson(Song song) {
    return {
      idKey: song.id,
      titleKey: song.title,
      artistKey: song.artistId,
      durationKey: song.duration.inMilliseconds,
      imageUrlKey: song.imageUrl,
    };
  }
}
