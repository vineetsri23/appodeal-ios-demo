# Appodeal iOS SDK   
![](https://img.shields.io/badge/version-v0.8.1-brightgreen.svg) [![](https://img.shields.io/badge/download-here-red.svg)](https://s3-us-west-1.amazonaws.com/appodeal-ios/0.7.0/Appodeal.zip) [![](https://img.shields.io/badge/integration-manual-blue.svg)](https://github.com/appodeal/appodeal-ios-demo/wiki) 

Thanks for taking a look at Appodeal! We take pride in having an easy-to-use, flexible monetization solution that works across multiple platforms.

Sign up for an account at [http://appodeal.com/](http://appodeal.com/).

# Integrate

Integration instructions are available on the **[wiki](https://github.com/appodeal/appodeal-ios-demo/wiki)** or our **[site] (http://www.appodeal.com/sdk/choose_framework).**

If you encounter any issues, do not hesitate to contact our happy support team
at [ios@appodeal.com](mailto:ios@appodeal.com).

# Appodeal iOS SDK Demo project

## Run with Cocoapods

1.Clone project   
2.Go to **Appodeal cocoapods** folder   
3.Make **pod install** to install CocoaPods dependencies or **pod update** to update if you have installed pods    
[Install CocoaPods](http://guides.cocoapods.org/using/getting-started.html) to simplify dependency management
```
sudo gem install cocoapods
```
If you have problems with versions of pods please run
```
rm -rf "${HOME}/Library/Caches/CocoaPods"
rm -rf "`pwd`/Pods/"
pod update
```
*Use [github help] (https://help.github.com/articles/generating-ssh-keys/) to add ssh key*   

4.Open **iosdemo.xcworkspace**       
5.Change AppKey and Bundle ID (if you want to  test your app)   
![](https://s3.amazonaws.com/appodeal-images/Screen+Shot+2015-08-18+at+13.56.01.png)
![](https://s3.amazonaws.com/appodeal-images/Screen+Shot+2015-08-18+at+13.56.10.png)

6.Run  

[Back to top](https://github.com/appodeal/appodeal-ios-demo#top)

## Run with Appodeal framework

1.Clone project  
2.Go to **Appodeal framework** folder   
3.Download SDK   
3.1Download the [latest iOS SDK version](https://s3-us-west-1.amazonaws.com/appodeal-ios/0.8.1/Appodeal.zip) and extract Appodeal iOS SDK.   
4.Open Demo project in Xcode, then drag and drop **Appodeal.framework** and **Resources** folder onto your project or workspace (use the "Product Navigator view") and choose *"Copy items into destination group's folder and click Finish"*.     

![](http://dl.dropbox.com/s/8z80aridd4gqxub/Screen%20Shot%202015-04-23%20at%204.30.58%20PM.png)

5.Change AppKey and Bundle ID (if you want to  test your app)    
![](https://s3.amazonaws.com/appodeal-images/Screen+Shot+2015-08-18+at+13.56.01.png)
![](https://s3.amazonaws.com/appodeal-images/Screen+Shot+2015-08-18+at+13.56.10.png)

6.Run  

[Back to top](https://github.com/appodeal/appodeal-ios-demo#top)

# Appodeal iOS SDK

## Download

The Appodeal SDK is distributed as static library.

- **[Appodeal SDK.zip](https://s3-us-west-1.amazonaws.com/appodeal-ios/0.8.1/Appodeal.zip)**

The current version of the SDK is 0.8.1    

## Integrate

Integration instructions are available on the [wiki](https://github.com/appodeal/appodeal-ios-demo/wiki).

## Requirements

iOS 7.1 and up

0.7.0 Change Log:   
----------------------------------
* added MREC (300*250 banners) - Admob, Amazpn, Inmobi, InnerActive, Yandex, Mopub, liveRails   
* native ads callbacks (nativeAdDidClick, nativeAdDidPresent)   
* imrovement of VAST Video integration   
* added OpenX Interstitials and Banners (320*50)   
* small bug fixes in Banners and Native ads   
* imrovement Native Ads templates   
* added Mopub Rewarded video   


0.7.0 Change Log:   
----------------------------------
* improvment of Rewarded video   
* show ads with price floor   
* test mode in SDK   
* Millennial Media (banners, interstitials, video)   
* update Mopub SDK   
* update Yandex ads SDK (error fixes)    
* update LiveRails SDK   
* update SpotX SDK   

0.6.2 Change Log:   
----------------------------------
* small bug fixes   
* updates Mopub Native ads implementation   
* adds VAST Direct video campaign   
* Fixes Banner zero size warning   

0.6.1 Change Log:   
----------------------------------
* fixes some warnings   
* update AppodealBannerView class   
* fixs crashes in iPad banners in sandbox mode   

0.6.0 Change Log:
----------------------------------
* separate ad type AppodealShowStyleRewardedVideo for rewarded videos   
* StartApp video (Rewarded) addon  
* Inmobi video (rewarded) addon  
* SpotX video (skippable) addon  
* Liverail video (rewarded) addon  
* fix of Applovin crashes with user setting  
* Native ads manager (load up to 10 native ads)  
* image in native ads (StartApp, Pubnative)  
* Flurry native ads integration update  
* error fix with Pubnative clicks  
* contentRating for native ads   
* Inner-active (banners and interstitials) addon  
* Rubicon (banners and interstitials) update   
* Liverail (banner, interstitials) addon   
* Amazon ads integration (adds click) improvement   
* AppodealBannerView class with banners size   
* added a banner 300*250 (beta)   
* added a banner size (320*50, 728*90, 300*250)   
* network requests optimization   
* external SDKs update   
* user setting before initialized SDK addon   
* removed OpenX banners   

0.5.4 Change Log:
----------------------------------
* remove Adcolony rewarded popup 
* iOS 9.1 support

0.5.3 Change Log:
----------------------------------
* Fixes MRAID banner crash (introduced by 0.5.2) 

0.5.2 Change Log:
----------------------------------
* Baner auto refresh interval is now configurable from dashboard    
* Bug fixes   

0.5.0-0.5.1 Change Log:
----------------------------------
* Native ads support (Target mail.ru, Facebook, Inmobi, StartApp, Applovin, Mopub, Avocarrot, Pubnative, Flurry)  
* adds Native ads templates   
* updates StartApp SDK integration   
* resolves nonRewarded Adcolony video error   
* updates Inmobi Video, Interstitials, Banners, Native ads adapters   
* fixes crash AdMob smart-banners   
* fixes Rubicon Interstitial adapter   
* adds asynchronous download of images in templates for native ads   

0.4.9 Change Log:
----------------------------------
* Only XCODE 7 support   
* Yandex ads banners   
* Yandex ads interstitials   
* fix Cocoalumberjack integration problems   
* improvement Interstitials and video mediation   
* banner autocache (disable by default)   
* 3rd party SDK updates for ios 9   

0.4.8 Change Log:
----------------------------------
* last version which compatible XCODE 6.x   
* Fix video delegate   
* check version of SDK in API   
* Target mail.ru iPad banner - center position   

0.4.7 Change Log:
----------------------------------
* fix Mopub video error   
* add Rubicon banner   
* add Rubicon interstitials   
* add OpenX banners   
* stop SDK public method   
* https support (for iOS 9)   
* improve MRAID (banners and interstitials)   

0.4.6 Change Log:
----------------------------------
* critical bug fixes   
* renew skippable/nonskippable video option   
* add Chartboost video   

0.4.5 Change Log:
----------------------------------
* Fix Mopub`s error click statistics (interstitials)
* Facebook Audience Network added (banners)
* New Public method - disableLocationPermissionCheck
* Add new network - StartApp (banners and interstitials)

0.4.4 Change Log:
----------------------------------
* Unity plugin integration SDK ready
* Inmobi banners and interstitials

0.4.3 Change Log:
----------------------------------
* Facebook Audience Network added (Interstitials)   
* Smaato added (Banner and Interstitials)   
* Fix Amazon banner view   
* Public methods added   
* Fixes MRAID clicks handling   

0.4.2 Change Log:
----------------------------------
* banner for iPad (horizontal orientation)   
* stability improovment

0.4.1 Change Log:
----------------------------------
* new adnetwork implementation - Target Mail.ru (Banners, Interstitials), Adcolony & Vungle (Video), Inmobi (Banner & Interstitials)
* improvement Banner integration
* support iPAD (vertical orientation)
* skipppable/nonskippable video
* apps for kids support

0.3.6 Change Log:
----------------------------------
* fixed video/sound playback
* fixed 'applicationWillEnterForeground' for banners
* fixed hide banner
* fixed bugs

0.3.5 Change Log:
----------------------------------
* added AppLovin videos
* added Swift module map (obsoletes bridge header)
* fixes ads logic
* fixes bugs

0.3.4 Change Log:
----------------------------------
* fixed smaato banners  
* fixed banenrs logic  
* fixed bugs  

0.3.3 Change Log:
----------------------------------
* updated admob
* fixed mraid  banners/interstitials  
* fixed bugs

0.3.2 Change Log:
----------------------------------
* added new api 
* fixed mraid  banners/interstitials
* fixed fixed banners  
* fixed bugs

0.3.1 Change Log:
----------------------------------
* added new api 
* fixed fixed banners 
* fixed bugs

0.3.0 Change Log:
----------------------------------
* added new api
* added method showWithAdNetworkName  
* fixed fixed video ads
* fixed optional callbacks

0.2.9 Change Log:
----------------------------------
* fixed cacheBanner timeout
* fixed disable admob precache
* fixed Interstitial networks

0.2.8 Change Log:
----------------------------------
* Fixed banners loading

0.2.7 Change Log:
----------------------------------
* Fixed mopub video

0.2.6 Change Log:
----------------------------------
* Fixed video ads
* Fixes bugs

0.2.5 Change Log:
----------------------------------
* fixed banners fillrate

0.2.4 Change Log:
----------------------------------
* Added Chartboost video
* Added Mopub video
* Fixes bugs

0.2.3 Change Log:
----------------------------------
* Fixed banner sizes for large screens
* Fixes bugs

0.2.2 Change Log:
----------------------------------
* Added new sdk api
* Fixes bugs

0.2.1 Change Log:
----------------------------------
* Added AerServ 
* Added CocoaPods support
* Added new sdk api
* Fixes bugs

0.2.0 Change Log:
----------------------------------
* Added AdColony 
* Added Vungle
* Added new sdk api
* Fixes bugs

0.1.9 Change Log:
----------------------------------
* Fixes mraid banner sizes.
* Fixes device rotation craches.

0.1.8 Change Log:
----------------------------------
* Fixes banner position when device orientation changed
* Fixes craches.

0.1.7 Change Log:
----------------------------------
* Fixes reward user callback

0.1.6 Change Log:
----------------------------------
* Added AODAdView

[Back to top](https://github.com/appodeal/appodeal-ios-demo#top)
