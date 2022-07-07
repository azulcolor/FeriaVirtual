import 'package:flutter/material.dart';
import 'package:feriavirtual/components/components.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../constants/global_variables.dart';

class Formulario extends StatelessWidget {
  const Formulario({Key? key}) : super(key: key);
  static const String routeName = 'formulary';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        //appBar: const HeaderInfo(),
        backgroundColor: GlobalVariables.primaryColor,
        body: SafeArea(
          child: NestedScrollView(
              floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: GlobalVariables.primaryColor,
                  expandedHeight: 100.0,
                  //forceElevated: innerBoxIsScrolled,
                  floating: true,

                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Container(
                      color: GlobalVariables.primaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Feria Virtual",
                            style: GlobalVariables.h2W,
                          ),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1000,
                            percent: 0.5,
                            backgroundColor: Colors.grey,
                            progressColor: GlobalVariables.yellowColor,
                          )
                        ],
                      ),
                    ),
                    background: Container(color: GlobalVariables.primaryColor),
                  ),
                ),
              ];
            },
            body: Container(
              color: GlobalVariables.backgroundColor,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          color: Colors.orange[100 * (index % 9)],
                          child: Text('pregunta $index'),
                        );
                      },
                      childCount: 30,
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 2.0,
                    ),
                  ),
                ],
              ),


            )
          ),
        ));
  }
}
