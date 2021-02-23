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
            if (championController.championList.length == 0) {
              return Center(
                  child: Text('Champion Data Not Available'),
              );
            } else {
              return GridView.builder(
                itemCount: championController.championList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                // Card - Displays Champion Image and Name
                itemBuilder: (context, index) {
                  return Text('${(championController.championList[index] as Map)['name']}');
                },
              );
            }
          }),
        ),
      ],
    );
  }
}
