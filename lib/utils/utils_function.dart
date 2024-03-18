import '../models/levels.dart';

LevelModel getLevelFromString(String level) {
  switch(level) {
    case "easy":{
      return LevelModel.easy;
    }
    case "medium":{
      return LevelModel.medium;
    }
    default:{
      return LevelModel.hard;
    }
  }
}