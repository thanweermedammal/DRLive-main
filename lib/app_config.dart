import 'package:flutter/material.dart';

var this_year = DateTime.now().year.toString();

class AppConfig {
  static String copyright_text = "@ ActiveItZone " + this_year; //this shows in the splash screen
  static String app_name = "Doctor Live"; //this shows in the splash screen

  //configure this
  static const bool HTTPS = false;

  //configure this
  static const DOMAIN_PATH = "drlive.optimisttechhub.com";

  //do not configure these below
  static const String API_ENDPATH = "api/";
  static const String PUBLIC_FOLDER = "public";
  static const String PROTOCOL = HTTPS ? "https://" : "https://";
  static const String RAW_BASE_URL = "${PROTOCOL}${DOMAIN_PATH}";
  static const String BASE_URL = "${RAW_BASE_URL}/${API_ENDPATH}";
  static const String IMAGE_URL ="https://drlive.optimisttechhub.com/storage/user/";
  static const String STORY_URL ="https://drlive.optimisttechhub.com/storage/story/";
  static const String BANNER_URL ="https://drlive.optimisttechhub.com/storage/banner/";

  //configure this if you are using amazon s3 like services
  //give direct link to file like https://[[bucketname]].s3.ap-southeast-1.amazonaws.com/
  //otherwise do not change anythink
  static const String BASE_PATH = "${RAW_BASE_URL}/${PUBLIC_FOLDER}/";
}
