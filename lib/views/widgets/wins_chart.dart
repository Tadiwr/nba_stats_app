import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WinsChart extends StatefulWidget {
  const WinsChart({super.key});

  @override
  State<WinsChart> createState() => _WinsChartState();
}

class _WinsChartState extends State<WinsChart> {

  

  List<BarChartGroupData> _buildBars() {
    List<int> temperature = [8, 5, 4, 7, 9];
    List<int> day = [1, 2, 3, 4, 5];
    List<BarChartGroupData> bars = [];

    for (int x = 0; x < 5; x ++) {
      final double currentValue = temperature[x].toDouble();
      var bar = BarChartGroupData(
        x : day[x],
        barRods: [
          BarChartRodData(
            toY: currentValue,
            color: CupertinoColors.activeGreen
          )
        ],
      );
      bars.add(bar);
    }

    return bars;    
  }

  @override
  Widget build(BuildContext context) {


    return SizedBox(
          width: double.infinity,
          height: 300,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:20.0, right:20.0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: const Text("Wins")
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: const Icon(Icons.arrow_forward)
                      )
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 250,
                child: BarChart(
                  BarChartData(
                    maxY: 10,
                    minY: 1,
                    barGroups: _buildBars()
                    
                  )
                ),
              ),
            ],
          ),
        );
  }
}