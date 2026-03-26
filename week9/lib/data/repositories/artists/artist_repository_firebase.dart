import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../model/artists/artist.dart';
import '../../dtos/artist_dto.dart';
import 'artist_repository.dart';

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri artistsUri = Uri.https(
    'taingchhay-987dd-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/artists.json',
  );

  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(artistsUri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> artistJson = json.decode(response.body);

      final List<Artist> artists = [];
      artistJson.forEach((id, jsonArtist) {
        if (jsonArtist is Map<String, dynamic>) {
          artists.add(ArtistDto.fromJson(id, jsonArtist));
        }
      });
      return artists;
    } else {
      throw Exception('Failed to load artists');
    }
  }
}
