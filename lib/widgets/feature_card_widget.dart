import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../helpers/colors.dart';
import '../models/location_model.dart';

class FeaturedCard extends StatelessWidget {
  final LocationModel location;

  const FeaturedCard({Key key, @required this.location}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.only(right: 12.0),
      child: Container(
        width: 230.0,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                location.image,
                width: 50.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location.name,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.headline4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(FeatherIcons.mapPin,
                          size: 12, color: theme.unselectedWidgetColor),
                      SizedBox(width: 5.0),
                      Expanded(
                        child: Text(
                          location.location,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.subtitle1,
                        ),
                      ),
                      Icon(Icons.star, size: 12, color: kYellowColor),
                      Text(
                        location.rating.toString(),
                        style: theme.textTheme.subtitle2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
