import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:league_of_legends/controllers/champion_controller.dart';

// Champions View
class Champions extends StatelessWidget {
  final String _title = 'Choose Your Champion';
  final String _subtitle =
      'With more than 140 champions, you\'ll find the perfect match for your play style. Master one, or master them all';

  @override
  Widget build(BuildContext context) {
    // Champion Controller - Responsible for providing data of Champion(s)
    final ChampionController championController = Get.put(ChampionController());

    return Column(
      children: [
        // TODO: News (Horizontal Scroll)
        // TODO: Title / Subtitle Text
        // TODO: Search / Filter (Roles and Difficulty) Widget
        Expanded(
          child: Obx(() {
            var championList = championController.championList;
            // TODO: Loading indicator before displaying not available message.
            if (championList.length == 0) {
              return Center(
                child: Text('Champion Data Not Available'),
              );
            } else {
              return GridView.builder(
                itemCount: championList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: .67,
                  // Adjust number of champions displayed based on orientation.
                  crossAxisCount: (MediaQuery.of(context).orientation ==
                          Orientation.portrait)
                      ? 2
                      : 3,
                ),
                // Card - Displays Champion Image and Name
                itemBuilder: (context, index) {
                  // Temporary Variables
                  String championName = (championList[index] as Map)['name'];
                  String imageName = (championList[index] as Map)['id'];
                  return Padding(
                    // Padding adjusted for evenness.
                    // TODO: Adjust padding with horizontal orientation as well
                    // TODO: Add constants for padding values.`
                    padding: (index % 2 == 0)
                        ? EdgeInsets.fromLTRB(18, 9, 9, 9)
                        : EdgeInsets.fromLTRB(9, 9, 18, 9),
                    // Stack - For display widgets on top of one another
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        // Image pull via network
                        // TODO: Add loading indicators
                        // TODO: Cache images so that there are fewer network calls
                        Image.network(
                          championController
                              .fetchChampionSplashImageURL(imageName),
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
                            '${championName.toUpperCase()}',
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
                    ),
                  );
                },
              );
            }
          }),
        ),
      ],
    );
  }
}
