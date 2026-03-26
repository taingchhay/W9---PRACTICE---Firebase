import 'package:flutter/material.dart';
import 'package:week9/model/artists/artist.dart';

class ArtistTile extends StatelessWidget {
  final Artist artist;

  const ArtistTile({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(artist.imageUrl)),
      title: Text(artist.name),
      subtitle: Text(artist.genre),
    );
  }
}
