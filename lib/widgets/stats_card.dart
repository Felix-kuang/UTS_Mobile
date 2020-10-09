import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                _buildStatsCard("Total Kasus", "248,582", Colors.orange),
                _buildStatsCard("Total Meninggal", "9,677", Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStatsCard("Total Sembuh", "180,797", Colors.green),
                _buildStatsCard("Dalam Perawatan", "58,378", Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Expanded _buildStatsCard(String nama, String total, MaterialColor warna) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: warna, borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nama,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
            ),
          ),
          Text(
            total,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    ),
  );
}
