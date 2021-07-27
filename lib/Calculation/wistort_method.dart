import 'dart:math';

import 'package:flutter_application_1/Calculation/data_fu.dart';
import 'package:flutter_application_1/Fixtures/fixture_unit.dart';



class WistortMethod{

  static double getWaterDemand(List<Fixture> fixtureList){
    List<Fixture> defaultList = <Fixture>[];

    for(int i = 0; i < fixtureList.length; i++){
      defaultList.add(fixtureList[i]);
    }

    double result = getMean(defaultList) + getStandardDeviation(defaultList);

    return result;
  }

  static double getMean(List<Fixture> fixtureList){
    double result = 0;
    for (Fixture fixture in fixtureList){
      result += fixture.amount*fixture.prop*fixture.gpm;
    }

    return result;
  }

  static double getStandardDeviation(List<Fixture> fixtureList){
    double result = 0;
    for(Fixture fixture in fixtureList){
      result += fixture.amount*fixture.prop*(1 - fixture.prop)*pow(fixture.gpm, 2);
    }

    result = sqrt(result);
    result *= Zscore.z;

    return result;
  }
}