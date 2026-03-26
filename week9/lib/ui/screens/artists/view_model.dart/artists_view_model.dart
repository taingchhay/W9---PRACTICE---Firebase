import 'package:flutter/material.dart';
import 'package:week9/data/repositories/artists/artist_repository.dart';
import 'package:week9/model/artists/artist.dart';

class ArtistsViewModel extends ChangeNotifier {
  final ArtistRepository _artistRepository;

  List<Artist> artists = [];
  bool isLoading = true;

  ArtistsViewModel({required ArtistRepository artistRepository})
    : _artistRepository = artistRepository {
    _loadArtists();
  }

  Future<void> _loadArtists() async {
    try {
      artists = await _artistRepository.fetchArtists();
    } catch (e) {
      print('Error loading artists: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
