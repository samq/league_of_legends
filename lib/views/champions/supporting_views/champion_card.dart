import 'package:flutter/material.dart';

// Card - Displays Champion's Image and Name (Bottom)
class ChampionCard extends StatelessWidget {
  final String name;
  final String imageURL;
  // Constructor - Name and Image URL required
  ChampionCard({this.name, this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        // Image pull via network
        // TODO: Add loading indicators
        // TODO: Cache images so that there are fewer network calls
        Image.network(
          imageURL,
          // TODO: fitWidth causes image to be slightly shifted vertically
          fit: BoxFit.fitWidth,
          width: double.infinity,
        ),
        // Displays the champion's name
        Container(
          color: Colors.black,
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Text(
            '${name.toUpperCase()}',
            // TODO: Alternate fontFamily (Beaufort for LOL - Serif)
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
