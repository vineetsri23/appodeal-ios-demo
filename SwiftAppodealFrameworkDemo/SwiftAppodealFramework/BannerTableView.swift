//
//  BannerTableView.swift
//  Swift Appodeal Cocoapods
//
//  Created by Учитель on 21.08.15.
//  Copyright (c) 2015 dtlbox. All rights reserved.
//

import UIKit
import Appodeal

class BannerTableView: UITableViewController, AppodealBannerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Banner"
        let button = UIBarButtonItem(title: "Hide", style: UIBarButtonItemStyle.Plain, target: self, action: "hide")
        self.navigationItem.rightBarButtonItem = button;
        Appodeal.setBannerDelegate(self)
       
    }
    func hide(){
        Appodeal.hideBanner()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell: UITableViewCell
        cell = tableView.cellForRowAtIndexPath(indexPath)!;
        if (cell.tag == 100)
        {
            Appodeal.hideBanner()
             Appodeal.showAd(AppodealShowStyle.BannerTop, rootViewController: self.parentViewController)
        }
        if (cell.tag == 101)
        {
            Appodeal.hideBanner()
             Appodeal.showAd(AppodealShowStyle.BannerCenter, rootViewController: self.parentViewController)
        }
        if (cell.tag == 102)
        {
            Appodeal.hideBanner()
             Appodeal.showAd(AppodealShowStyle.BannerBottom, rootViewController: self.parentViewController)
        }
        if (cell.tag == 103)
        {
            var height: CGFloat
            height = 50.0;
            var frame : CGRect
            frame = CGRectMake(0.0, 0.0, 320.0, height);
            Appodeal.hideBanner()
            tableView.tableFooterView = nil;
            var banner: UIView
            banner = Appodeal.banner()
            banner.frame = frame;
            tableView.tableFooterView = banner;
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func bannerDidFailToLoadAd() {
        let alertController = UIAlertController(title: "Fail to load", message:
            nil, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}


