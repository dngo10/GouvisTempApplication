import 'dart:math';

import 'package:flutter_application_1/Calculation/data_fu.dart';
import 'package:flutter_application_1/Fixtures/fixture_unit.dart';


class ModifedWistortMethod{

  static double getWaterDemand(List<Fixture> fixtureList){
    List<double> i = npq(fixtureList);
    return (1.0/(1 - i[2]))*(i[0] + Zscore.z*sqrt((1-i[2])*i[1] - i[2]*pow(i[0], 2)));
  }

  static double getStagnation(List<Fixture> fixtureList){
    double stagnation = 1;

    for(int i = 0; i < fixtureList.length; i++){
      stagnation *= pow(1- fixtureList[i].prop, fixtureList[i].amount);
    }

    return stagnation;
  }

  static List<double> npq(List<Fixture> fixtureList){
    double npq1 = 0;
    double npq2 = 0;
    double stagnation = 1;

    for(int i = 0; i < fixtureList.length; i++){
      npq1 += fixtureList[i].amount*fixtureList[i].prop*fixtureList[i].gpm;

      npq2 += fixtureList[i].amount*
                 fixtureList[i].prop*
                 (1 - fixtureList[i].prop)*
                 pow(fixtureList[i].gpm, 2);
      
      stagnation *= pow(1- fixtureList[i].prop, fixtureList[i].amount);
    }
    return [npq1, npq2, stagnation];
  }
}