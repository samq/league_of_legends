import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:league_of_legends/controllers/champion_controller.dart';
import 'package:league_of_legends/views/champions/champion_details.dart';
import 'package:league_of_legends/views/champions/supporting_views/champion_card.dart';

// Champions View
class Champions extends StatelessWidget {
  final String _title = 'Choose Your Champion';
  final String _subtitle =
      'With more than 140 champions, you\'ll find the perfect match for your play style. Master one, or master them all';

  // Champion Controller - Responsible for providing data of Champion(s)
  final ChampionController championController = Get.put(ChampionController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TODO: News (Horizontal Scroll)
        // TODO: Title / Subtitle Text
        // TODO: Search / Filter (Roles and Difficulty) Widget
        Expanded(
          child: Obx(
            () {
              Orientation orientation = MediaQuery.of(context).orientation;
              return Scaffold(
                appBar: AppBar(
                  title: Text('League of Legends'),
                ),
                // TODO: Loading indicator before displaying not available message.
                body: (championController.championList.length == 0)
                    ? _buildUnavailableData()
                    : _buildChampionGrid(orientation: orientation),
              );
            },
          ),
        ),
      ],
    );
  }

  // Builds Widget for notifying user that champion data cannot be displayed.
  Widget _buildUnavailableData() {
    return Center(
      child: Text('Champion Data Not Available'),
    );
  }

  // Builds GridView for displaying champion data
  Widget _buildChampionGrid({Orientation orientation}) {
    // GridView.builder - Builds grid with large amount of items
    return GridView.builder(
      // Number of items in the grid. Improves maximum scroll extent estimation.
      itemCount: championController.championList.length,
      // gridDelegate - Controls the layout of the children in GridView
      // Layout contains a fixed amount of tiles in the cross axis
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // Ratio - Cross-Axis to Main-Axis
        childAspectRatio: .67,
        // Adjust number of item displayed on cross axis based on orientation.
        crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
      ),
      // Card - Displays Champion Image and Name
      itemBuilder: (context, index) {
        return Padding(
          // Padding adjusted for evenness.
          // TODO: Adjust padding with horizontal orientation as well
          // TODO: Add constants for padding values.`
          padding: (index % 2 == 0)
              ? EdgeInsets.fromLTRB(18, 9, 9, 9)
              : EdgeInsets.fromLTRB(9, 9, 18, 9),
          // Stack - For display widgets on top of one another
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChampionDetail(
                        name: championController.getChampionName(index)),
                  ),
                );
              },
              child: ChampionCard(
                name: championController.getChampionName(index),
                imageURL:
                    championController.fetchChampionLoadingImageURL(index),
              )),
        );
      },
    );
  }
}
