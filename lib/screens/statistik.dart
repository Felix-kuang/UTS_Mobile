import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:uts/config/pallete.dart';
import 'package:uts/config/styles.dart';
import 'package:uts/data/data.dart';
import 'package:uts/widgets/widgets.dart';

class Statistik extends StatefulWidget {
  @override
  _StatistikState createState() => _StatistikState();
}

class _StatistikState extends State<Statistik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primaryColor,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(),
          _buildRegionBar(),
          _buildStatsTab(),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            sliver: SliverToBoxAdapter(
              child: StatsGrid(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: CovidBarChart(
                covidCases: covidIDDaylyNewCase
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          "Statistik",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
            color:  Colors.white24,
            borderRadius: BorderRadius.circular(25.0)
          ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 50.0,
              indicatorColor: Colors.white,
            ),
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: [
              Text("Indonesia"),
              Text("Global")
            ],
            onTap: (index){},
          ),
        ),
      ),
    );
  }

  SliverPadding _buildStatsTab(){
    return SliverPadding(
      padding: EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3, 
          child: Container(
            child:TabBar(
              indicatorColor: Colors.transparent,
              labelStyle: Styles.tabTextStyle,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              tabs: [
                Text("Total"),
                Text("Hari ini"),
                Text("Kemarin"),
              ],
              onTap: (index){},
            ),
          ),
        ),
      ),
    );
  }
}
