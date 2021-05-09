import '../model/domain/playlist_model.dart';
import 'package:flutter/material.dart';

class ItemPlaylistWidget extends StatelessWidget {
  final PlaylistModel? model;
  final bool showDuration;

  const ItemPlaylistWidget({
    Key? key,
    this.model,
    this.showDuration = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        margin: EdgeInsets.only(right: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  model?.image ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                model?.title ?? "",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: -0.25,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: showDuration
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "${model?.songs?.length} song",
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.access_time_outlined,
                          size: 10,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${model?.duration}",
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      model?.desc ?? "",
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
