import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../helpers/colors.dart';
import '../models/location_model.dart';
import '../screens/location_detail_page.dart';

class PlaceCard extends StatefulWidget {
  final LocationModel location;

  const PlaceCard({Key key, @required this.location}) : super(key: key);
  @override
  _PlaceCardState createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  bool _isLiked = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final data = widget.location;
    return InkWell(
      borderRadius: BorderRadius.circular(25.0),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LocationDetailPage(location: data),
          ),
        );
      },
      child: Container(
        width: 180.0,
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Hero(
                tag: 'hero: ${data.image}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(
                    data.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            Positioned(
              right: 10.0,
              top: 10.0,
              child: CircleAvatar(
                radius: 18.0,
                backgroundColor: kBackgroundLightColor,
                child: IconButton(
                  icon: Icon(
                    _isLiked ? Icons.favorite : Icons.favorite_border_rounded,
                  ),
                  iconSize: 18.0,
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 10.0,
              child: Container(
                width: 160.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.name,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.headline3
                            .copyWith(color: kBackgroundLightColor)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          FeatherIcons.mapPin,
                          color: kBackgroundLightColor,
                          size: 12.0,
                        ),
                        SizedBox(width: 7.0),
                        Expanded(
                          child: Text(data.location,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.subtitle2
                                  .copyWith(color: kBackgroundLightColor)),
                        ),
                        SizedBox(width: 7.0),
                        Icon(
                          Icons.star,
                          color: kYellowColor,
                          size: 12.0,
                        ),
                        Text(data.rating.toString(),
                            style: theme.textTheme.subtitle2
                                .copyWith(color: kBackgroundLightColor)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
