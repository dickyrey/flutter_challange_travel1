import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

import '../helpers/colors.dart';
import '../providers/theme_provider.dart';
import '../widgets/circle_tab_indicator_widget.dart';
import 'home_tab_view/sight_tab_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<Widget> salonTab = [
    Tab(text: 'Sights'),
    Tab(text: 'Experiences'),
    Tab(text: 'Adventures'),
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello, Kimmy', style: theme.textTheme.subtitle1),
                      Text("Let's Go Around the World",
                          style: theme.textTheme.headline2),
                    ],
                  ),
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage('assets/avatar1.jpg'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 45.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18.0),
              height: 50.0,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type here for search',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.0),
                  SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .changeTheme();
                      },
                      child: Center(
                        child: Icon(
                          FeatherIcons.sliders,
                          size: 18.0,
                          color: kBackgroundLightColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15.0),
            TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator:
                  CircleTabIndicator(color: theme.primaryColor, radius: 4),
              isScrollable: true,
              labelStyle: theme.textTheme.headline3,
              unselectedLabelStyle: theme.textTheme.subtitle1,
              labelColor: theme.primaryColor,
              unselectedLabelColor: theme.unselectedWidgetColor,
              tabs: salonTab,
            ),
            Center(
              child: [
                SightPage(),
                Center(child: Text('Experiences')),
                Center(child: Text('Adventures')),
              ][_tabController.index],
            ),
            SizedBox(height: 25.0),
          ],
        ),
      ),
    );
  }
}
