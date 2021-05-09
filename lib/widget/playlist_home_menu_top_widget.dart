import 'list_remove_glow.dart';
import '../data/dummy_data.dart';
import 'item_playlist_widget.dart';
import 'package:flutter/material.dart';

class PlaylistHomeMenuTopWidget extends StatelessWidget {
  const PlaylistHomeMenuTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListRemoveGlow(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: List.generate(
              playlistDummy.length,
              (index) => ItemPlaylistWidget(
                model: playlistDummy[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
