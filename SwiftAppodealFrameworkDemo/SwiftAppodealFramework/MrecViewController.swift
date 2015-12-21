//
//  MrecViewController.swift
//  SwiftApodealFramework
//
//  Created by Stas Kochkin on 21/12/15.
//  Copyright © 2015 dtlbox. All rights reserved.
//

import UIKit
import Appodeal

class MrecViewController : UIViewController, AppodealBannerViewDelegate {
    override func viewDidLoad() {
        let mrecView = AppodealMRECView.init(rootViewController: self)!
        mrecView.delegate = self
        mrecView.loadAd()
        self.view .addSubview(mrecView)
        mrecView.center = self.view.center
    }
    
    func bannerView(bannerView: AppodealBannerView!, didFailToLoadAdWithError error: NSError!) {
        NSLog("Mrec view did fail to load")
    }
    
    func bannerViewDidInteract(bannerView: AppodealBannerView!) {
        NSLog("Mrec view did interact")
    }
    
    func bannerViewDidLoadAd(bannerView: AppodealBannerView!) {
        NSLog("Mrec view did fail to load")
    }
}

