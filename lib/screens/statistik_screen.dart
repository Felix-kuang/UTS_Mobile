import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:uts/config/pallete.dart';
import 'package:uts/config/styles.dart';
import 'package:uts/data/data.dart';
import 'package:uts/widgets/widgets.dart';

class StatistikScreen extends StatefulWidget {
  static const String id = "Statistik_Screen";
  static int regionId = 0;
  static int hari = 0;
  static String total, sembuh, meninggal, rawat;

  @override
  _StatistikScreenState createState() => _StatistikScreenState();
}

class _StatistikScreenState extends State<StatistikScreen> {
  void dataCovid() {
    if (StatistikScreen.regionId == 0) {
      if (StatistikScreen.hari == 0) {
        //Indo Total
        StatistikScreen.total = "248,852";
        StatistikScreen.sembuh = "180,797";
        StatistikScreen.meninggal = "9,677";
        StatistikScreen.rawat = "58,378";
      } else if (StatistikScreen.hari == 1) {
        //Indo Hari ini
        StatistikScreen.total = "4,176";
        StatistikScreen.sembuh = "3,470";
        StatistikScreen.meninggal = "124";
        StatistikScreen.rawat = "58,378";
      } else {
        //Indo Kemarin
        StatistikScreen.total = "3,989";
        StatistikScreen.sembuh = "2,977";
        StatistikScreen.meninggal = "105";
        StatistikScreen.rawat = "57,796";
      }
    } else {
      if (StatistikScreen.hari == 0) {
        //Global Total
        StatistikScreen.total = "31,606,826";
        StatistikScreen.sembuh = "23,359,295";
        StatistikScreen.meninggal = "977,977";
        StatistikScreen.rawat = "7,269,554";
      } else if (StatistikScreen.hari == 1) {
        //Global Hari ini
        StatistikScreen.total = "237,955";
        StatistikScreen.sembuh = "278,402";
        StatistikScreen.meninggal = "3,818";
        StatistikScreen.rawat = "7,269,554";
      } else {
        //Global Kemarin
        StatistikScreen.total = "258,010";
        StatistikScreen.sembuh = "247,954";
        StatistikScreen.meninggal = "3,980";
        StatistikScreen.rawat = "7,313,819";
      }
    }
  }

  void initState() {
    super.initState();
    dataCovid();
  }

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
              child: StatsCard(
                total: StatistikScreen.total,
                sembuh: StatistikScreen.sembuh,
                meninggal: StatistikScreen.meninggal,
                rawat: StatistikScreen.rawat,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: CovidBarChart(covidCases: covidIDDailyNewCase),
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
              color: Colors.white24, borderRadius: BorderRadius.circular(25.0)),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 50.0,
              indicatorColor: Colors.white,
            ),
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: [Text("Indonesia"), Text("Global")],
            onTap: (index) {
              setState(() {
                StatistikScreen.regionId = index;
                dataCovid();
              });
            },
          ),
        ),
      ),
    );
  }

  SliverPadding _buildStatsTab() {
    return SliverPadding(
      padding: EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: Container(
            child: TabBar(
              indicatorColor: Colors.transparent,
              labelStyle: Styles.tabTextStyle,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              tabs: [
                Text("Total"),
                Text("Hari ini"),
                Text("Kemarin"),
              ],
              onTap: (index) {
                setState(() {
                  StatistikScreen.hari = index;
                  dataCovid();
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
