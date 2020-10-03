import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fluttertravel/models/location_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../helpers/colors.dart';
import '../widgets/circle_tab_indicator_widget.dart';

class LocationDetailPage extends StatefulWidget {
  final LocationModel location;

  const LocationDetailPage({Key key, @required this.location})
      : super(key: key);
  @override
  _LocationDetailPageState createState() => _LocationDetailPageState();
}

class _LocationDetailPageState extends State<LocationDetailPage>
    with SingleTickerProviderStateMixin {
  bool _isLiked = false;
  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> locationTabList = [
    Tab(text: 'Overview'),
    Tab(text: 'Reviews'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final data = widget.location;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: kBackgroundLightColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border),
              color: kBackgroundLightColor,
              onPressed: () {
                setState(() {
                  _isLiked = !_isLiked;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              color: kBackgroundLightColor,
              onPressed: () {},
            ),
          ]),
      body: Stack(
        children: [
          Hero(
              tag: 'hero: ${data.image}',
              child: Image.asset(data.image, fit: BoxFit.fill)),
          DraggableScrollableSheet(
            maxChildSize: 1.0,
            minChildSize: .7,
            initialChildSize: .7,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.name, style: theme.textTheme.headline2),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(FeatherIcons.mapPin,
                              color: theme.unselectedWidgetColor, size: 15.0),
                          SizedBox(width: 3.0),
                          Expanded(
                              child: Text(data.location,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyText2)),
                          Icon(Icons.star, color: kYellowColor, size: 15.0),
                          SizedBox(width: 3.0),
                          Text(data.rating.toString(),
                              style: theme.textTheme.bodyText2),
                          SizedBox(width: 8.0),
                          Icon(Icons.access_time,
                              color: theme.unselectedWidgetColor, size: 15.0),
                          SizedBox(width: 3.0),
                          Text(data.estimate, style: theme.textTheme.bodyText2),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      TabBar(
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: CircleTabIndicator(
                            color: theme.primaryColor, radius: 4),
                        isScrollable: true,
                        labelStyle: theme.textTheme.headline3,
                        unselectedLabelStyle: theme.textTheme.subtitle1,
                        labelColor: theme.primaryColor,
                        unselectedLabelColor: theme.unselectedWidgetColor,
                        tabs: locationTabList,
                      ),
                      Center(
                        child: [
                          ExperiencesTabView(location: data),
                          ReviewTabView(),
                        ][_tabController.index],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 60.0,
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
        decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.0),
              topLeft: Radius.circular(25.0),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('Your Trip', style: Theme.of(context).textTheme.subtitle2),
                Text('\$${data.price}',
                    style: Theme.of(context).textTheme.headline2),
              ],
            ),
            SizedBox(
              width: 120.0,
              height: 40.0,
              child: RaisedButton(
                onPressed: () {},
                child:
                    Text('Book Now', style: Theme.of(context).textTheme.button),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExperiencesTabView extends StatelessWidget {
  final LocationModel location;

  const ExperiencesTabView({Key key, @required this.location})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: Text(
        location.description,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}

class ReviewTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        padding: EdgeInsets.only(top: 10.0),
        itemBuilder: (context, snapshot) {
          return ReviewCard();
        },
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 22.0,
        backgroundImage: AssetImage('assets/avatar1.jpg'),
      ),
      title: Text('Mr.Squidward', style: Theme.of(context).textTheme.bodyText2),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmoothStarRating(
            color: kYellowColor,
            size: 13.0,
            rating: 4.0,
            isReadOnly: true,
            starCount: 5,
            allowHalfRating: false,
            borderColor: Theme.of(context).unselectedWidgetColor,
          ),
          SizedBox(height: 5.0),
          Text('Lorem ipsum dolor sit amet',
              style: Theme.of(context).textTheme.subtitle2),
        ],
      ),
    );
  }
}
