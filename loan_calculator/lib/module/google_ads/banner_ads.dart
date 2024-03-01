import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAds extends StatefulWidget {
  const BannerAds({Key? key}) : super(key: key);

  @override
  BbannerAdsState createState() => BbannerAdsState();
}

class BbannerAdsState extends State<BannerAds> {
  BannerAd? bannerAds;
  bool isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    adsInit();
  }

  @override
  void dispose() {
    super.dispose();
    bannerAds?.dispose();
  }

  void adsInit() {
    bannerAds?.dispose();
    isAdLoaded = false;
    bannerAds = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ads) {
          isAdLoaded = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    bannerAds?.load();
  }

  @override
  Widget build(BuildContext context) {
    return isAdLoaded
        ? Container(
            width: bannerAds!.size.width.toDouble(),
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 55.0,
            child: AdWidget(ad: bannerAds!),
          )
        : const SizedBox();
  }
}

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8162380048928963/4837621997';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4716968301608553/1118579667';
    }
    throw UnsupportedError("Unsupported platform");
  }
}
