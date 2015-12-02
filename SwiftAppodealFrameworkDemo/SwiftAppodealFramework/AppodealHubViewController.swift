//
//  Initialization.swift
//  Swift Appodeal Cocoapods
//
//  Created by Учитель on 21.08.15.
//  Copyright (c) 2015 dtlbox. All rights reserved.
//

import UIKit
import Appodeal

class AppodealHubViewController: UITableViewController, AppodealInterstitialDelegate, AppodealVideoDelegate, AppodealRewardedVideoDelegate  {
    
    var reward : UInt! = 0;
    var rewName = "nothing";
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationItem.title = "Appodeal demo"
        Appodeal.setVideoDelegate(self)
        Appodeal.setInterstitialDelegate(self)
        Appodeal.setRewardedVideoDelegate(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell: UITableViewCell
        cell = tableView.cellForRowAtIndexPath(indexPath)!
        if cell.tag == 10 {
           Appodeal.showAd(AppodealShowStyle.Interstitial, rootViewController: self)
        }
        if cell.tag == 11 {
           Appodeal.showAd(AppodealShowStyle.VideoOrInterstitial, rootViewController: self)
        }
        if cell.tag == 12 {
            Appodeal.showAd(AppodealShowStyle.SkippableVideo, rootViewController: self)
        }
        
        if cell.tag == 20 {
            Appodeal.showAd(AppodealShowStyle.RewardedVideo, rootViewController: self)
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func interstitialDidFailToLoadAd() {
        let alertController = UIAlertController(title: "Interstitial fail to load", message:
            nil, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func videoDidFailToLoadAd() {
        let alertController = UIAlertController(title: "Video fail to load", message:
            nil, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func rewardedVideoDidLoadAd(){
        
    }
    
    func rewardedVideoDidFinish(rewardAmount: UInt, name rewardName: String!) {
        reward = rewardAmount;
        rewName = rewardName;
    }
    
    func rewardedVideoWillDismiss() {
        let alertController = UIAlertController(title: "Wohoo!",
            message: "You got \(reward) \(rewName)",
            preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    
}

