import 'package:flutter/material.dart';

import '../../models/location_model.dart';
import '../../widgets/feature_card_widget.dart';
import '../../widgets/place_card_widget.dart';

class SightPage extends StatefulWidget {
  @override
  _SightPageState createState() => _SightPageState();
}

class _SightPageState extends State<SightPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Text('33 Places', style: theme.textTheme.subtitle1),
        ),
        SizedBox(height: 15.0),
        Container(
          width: double.infinity,
          height: 200.0,
          child: ListView.builder(
            itemCount: locationList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return PlaceCard(location: locationList[index]);
            },
          ),
        ),
        SizedBox(height: 25.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text('Featured', style: theme.textTheme.headline3),
        ),
        Container(
          width: double.infinity,
          height: 100.0,
          child: ListView.builder(
            itemCount: locationList.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            itemBuilder: (context, index) {
              return FeaturedCard(location: locationList[index]);
            },
          ),
        )
      ],
    );
  }
}
