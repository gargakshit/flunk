import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'home_viewmodel.dart';
import '../../constants/colors.dart';
import '../../widgets/legend.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (model) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/bg3.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  model.user != null
                      ? Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(64),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    model.user.avatarUrl,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.user.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  "@${model.user.login}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : CircularProgressIndicator(),
                  SizedBox(
                    height: 32,
                  ),
                  Expanded(
                    child: model.loading
                        ? Center(
                            child: TypewriterAnimatedTextKit(
                              text: [
                                "FIRING THE PUNK UP...",
                                "PLEASE WAIT...",
                              ],
                              repeatForever: true,
                              isRepeatingAnimation: true,
                              speed: Duration(milliseconds: 250),
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18.0,
                                letterSpacing: 2,
                                color: Colors.white,
                                fontFamily: "Blanka",
                              ),
                            ),
                          )
                        : ListView(
                            physics: BouncingScrollPhysics(),
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Total repositories: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Riviera",
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      "${model.totalRepos}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Total commits: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Riviera",
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      "${model.totalCommits}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Your score: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Riviera",
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      "${model.score}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Your rank: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Riviera",
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      "${model.rank}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Center(
                                child: Text(
                                  "Your commit graph",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Riviera",
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  model.currentYear.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              LineChart(
                                LineChartData(
                                  borderData: FlBorderData(
                                    show: true,
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.55),
                                      width: 1,
                                    ),
                                  ),
                                  gridData: FlGridData(
                                    show: true,
                                    drawVerticalLine: true,
                                    getDrawingHorizontalLine: (value) {
                                      return FlLine(
                                        color: Colors.white.withOpacity(0.55),
                                        strokeWidth: 1,
                                      );
                                    },
                                    getDrawingVerticalLine: (value) {
                                      return FlLine(
                                        color: Colors.white.withOpacity(0.55),
                                        strokeWidth: 1,
                                      );
                                    },
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    bottomTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 24,
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      getTitles: (value) {
                                        switch (value.toInt()) {
                                          case 3:
                                            return 'MAR';
                                          case 7:
                                            return 'JUL';
                                          case 11:
                                            return 'NOV';
                                        }
                                        return '';
                                      },
                                      margin: 8,
                                    ),
                                    leftTitles: SideTitles(
                                      showTitles: true,
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      interval: 20,
                                      reservedSize: 16,
                                      margin: 12,
                                    ),
                                  ),
                                  lineTouchData: LineTouchData(
                                    touchTooltipData: LineTouchTooltipData(
                                      tooltipBgColor: Color(0xff121212),
                                    ),
                                  ),
                                  backgroundColor:
                                      Color(0xff121212).withOpacity(0.25),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots:
                                          [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
                                              .map(
                                                (e) => FlSpot(
                                                  e + 1.0,
                                                  model.currentData[e] + 0.0,
                                                ),
                                              )
                                              .toList(),
                                      isCurved: true,
                                      curveSmoothness: 0.15,
                                      colors: gradients[0].colors,
                                      barWidth: 5,
                                      isStrokeCapRound: true,
                                      dotData: FlDotData(
                                        show: false,
                                      ),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        colors: [
                                          gradient1Left.withOpacity(0.7),
                                          gradient1Right.withOpacity(0.7),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed:
                                          model.currentYear == model.firstYear
                                              ? null
                                              : () {
                                                  model.loadDataForYear(
                                                    model.currentYear - 1,
                                                  );
                                                },
                                      icon: Icon(Feather.chevron_left),
                                      color: Colors.white,
                                      disabledColor: Colors.white60,
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    IconButton(
                                      onPressed: DateTime.now().year ==
                                              model.currentYear
                                          ? null
                                          : () {
                                              model.loadDataForYear(
                                                  model.currentYear + 1);
                                            },
                                      icon: Icon(Feather.chevron_right),
                                      color: Colors.white,
                                      disabledColor: Colors.white60,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Center(
                                child: Text(
                                  "Your top languages",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Riviera",
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [0, 1, 2, 3, 4]
                                    .map((i) => CircularPercentIndicator(
                                          radius: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5) -
                                              (i * 44),
                                          lineWidth: 12.0,
                                          animationDuration: 1250,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          percent: model.langData.values
                                                  .elementAt(i)
                                                  .length /
                                              model
                                                  .gqlData
                                                  .data
                                                  .viewer
                                                  .repositories
                                                  .repoEdges
                                                  .length,
                                          animation: true,
                                          backgroundColor: Colors.transparent,
                                          linearGradient: gradients[i],
                                        ))
                                    .toList(),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 20,
                                runSpacing: 16,
                                direction: Axis.horizontal,
                                children: [0, 1, 2, 3, 4]
                                    .map(
                                      (i) => Legand(
                                        gradient: gradients[i],
                                        text: model.langData.values
                                            .elementAt(i)
                                            .name,
                                      ),
                                    )
                                    .toList(),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
