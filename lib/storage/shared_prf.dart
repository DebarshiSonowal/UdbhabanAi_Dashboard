import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../Model/temp.dart';

class Storage {
  // shared_preferences
  Storage._();

  static final Storage instance = Storage._();
  late SharedPreferences sharedPreferences;


  Future<void> initializeStorage() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setLoggedIn() async {
    await sharedPreferences.setBool("isLoggedIn", true);
  }

  Future<void> setToken(String token) async {
    debugPrint('set token $token');
    await sharedPreferences.setString("token", token);
  }

  Future<void> setFilter(String filters) async {
    debugPrint('set filters ${filters.toString()}');
    await sharedPreferences.setString("filter", filters);
  }

  Future<void> setFullScreenAd(bool val) async {

    await sharedPreferences.setBool("fullscreen", val);
  }

  Future<void> setOnBoarding() async {
    await sharedPreferences.setBool("isOnBoarding", true);
  }

  Future<void> setBigDeal() async {
    await sharedPreferences.setBool("isBigDeal", true);
  }

  Future<void> setClassified() async {
    await sharedPreferences.setBool("isClassified", true);
  }

  Future<void> setCitizenJournalist() async {
    await sharedPreferences.setBool("isCitizenJournalist", true);
  }

  Future<void> setDarkMode(bool selected) async {
    await sharedPreferences.setBool("dark", selected);
    debugPrint('setDarkMode');
  }

  Future<void> setLastDisplayed(String val) async {
    await sharedPreferences.setString("lastDisplayed", val);
  }

  Future<void> setGuwahatiConnect() async {
    await sharedPreferences.setBool("isGuwahatiConnect", true);
  }

  Future<void> setIsNew(bool val) async {
    await sharedPreferences.setBool("isNew", val);
  }

  get isGuwahatiConnect =>
      sharedPreferences.getBool("isGuwahatiConnect") ?? false;

  get isCitizenJournalist =>
      sharedPreferences.getBool("isCitizenJournalist") ?? false;

  get isClassified => sharedPreferences.getBool("isClassified") ?? false;

  get isBigDeal => sharedPreferences.getBool("isBigDeal") ?? false;

  get isLoggedIn => sharedPreferences.getBool("isLoggedIn") ?? false;

  get isDarkMode => sharedPreferences.getBool("dark") ?? false;

  get isFullScreenAd => sharedPreferences.getBool("fullscreen") ?? false;

  get isNew => sharedPreferences.getBool("isNew") ?? false;

  get isOnBoarding => sharedPreferences.getBool("isOnBoarding") ?? false;

  get token => sharedPreferences.getString("token") ?? "";

  get lastDisplayed => sharedPreferences.getString("lastDisplayed") ?? "";

  get filters => sharedPreferences.getString("filter") ?? "";

  // void logout() {}
  Future<void> logout() async {
    await sharedPreferences.clear();
  }
}
