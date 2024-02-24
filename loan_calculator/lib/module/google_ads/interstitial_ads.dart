import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAds {
  InterstitialAd? _interstitialAd;
  // int numOfAttemptLoad = 0;
  void createInterad() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdId,
      request: const AdRequest(),
      adLoadCallback:
          InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
        _interstitialAd = ad;
        // numOfAttemptLoad = 0;
        showInterad();
      }, onAdFailedToLoad: (LoadAdError error) {
        // numOfAttemptLoad++;
        _interstitialAd = null;
        // if (numOfAttemptLoad <= 2) {
        //   createInterad();
        // }
      }),
    );
  }

  void showInterad() {
    if (_interstitialAd == null) {
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) {
      print("ad onAdshowedFullscreen");
    }, onAdDismissedFullScreenContent: (InterstitialAd ad) {
      print("ad Disposed");
      ad.dispose();
    }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError aderror) {
      print('$ad OnAdFailed $aderror');
      ad.dispose();
      createInterad();
    });
    _interstitialAd!.show();
    _interstitialAd = null;
  }
}

class AdHelper {
  static String get interstitialAdId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8162380048928963/9822339453';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4716968301608553/8641028223';
    }
    throw UnsupportedError("Unsupported platform");
  }
}
