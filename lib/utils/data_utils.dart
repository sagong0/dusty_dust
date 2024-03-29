import 'package:dusty_dust/const/status_level.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/model/status_model.dart';
import 'package:flutter/material.dart';

class DataUtils {
  static String getTimeFromDateTime({required DateTime dateTime}) {
    return '${dateTime.year}-${dateTime.month}-${dateTime.day} ${getTimeFormat(dateTime.hour)}:${getTimeFormat(dateTime.minute)}';
  }

  static String getTimeFormat(int number) {
    return number.toString().padLeft(2, '0');
  }

  static String getUnitFromItemCode({
    required ItemCode itemCode,
  }) {
    switch (itemCode) {
      case ItemCode.PM10:
        return 'μg/m3';

      case ItemCode.PM25:
        return 'μg/m3';

      default:
        return 'ppm';
    }
  }

  static String getItemCodeKrString({
    required ItemCode itemCode,
  }) {
    switch (itemCode) {
      case ItemCode.PM10:
        return '미세먼지';

      case ItemCode.PM25:
        return '초미세먼지';

      case ItemCode.NO2:
        return '이산화질소';

      case ItemCode.O3:
        return '오존';

      case ItemCode.CO:
        return '일산화탄소';

      case ItemCode.SO2:
        return '아황산가스';
    }
  }

  static StatusModel getStatusFromItemCodeAndValue({
    required ItemCode itemCode,
    required double val,
  }) {
    return statusLevel.where((status) {
      if(itemCode == ItemCode.PM10){
        return status.minFineDust < val;
      }else if(itemCode == ItemCode.PM25){
        return status.minUltraFineDust < val;
      }else if(itemCode == ItemCode.CO){
        return status.minCO < val;
      }else if(itemCode == ItemCode.O3){
        return status.min03 < val;
      }else if(itemCode == ItemCode.NO2){
        return status.minN02 < val;
      }else if(itemCode == ItemCode.SO2){
        return status.minSO2 < val;
      }else{
        throw Exception('알수없는 ItemCode 입니다.');
      }
    }).last;
  }
}
