import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week9/ui/screens/artists/view_model.dart/artists_view_model.dart';
import 'package:week9/ui/widgets/artist/artist_tile.dart';

class ArtistsContent extends StatelessWidget {
  const ArtistsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ArtistsViewModel>();

    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: viewModel.artists.length,
      itemBuilder: (context, index) {
        final artist = viewModel.artists[index];
        return ArtistTile(artist: artist);
      },
    );
  }
}
