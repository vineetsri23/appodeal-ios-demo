//
//  NativeAdsViewController.swift
//  iosdemoSwift
//
//  Created by Stas Kochkin on 20/11/15.
//  Copyright © 2015 dtlbox. All rights reserved.
//

import UIKit
import Appodeal

class NativeAdsViewController : UITableViewController, AppodealNativeAdServiceDelegate {
    
    @IBOutlet weak var severalAdsLoadSwitch: UISwitch! = nil
    var viewType: AppodealNativeAdViewType = AppodealNativeAdViewType.Type320x50
    var nativeAdService: AppodealNativeAdService! = nil
    var loadingView: UIView! = nil
    var adsArray : NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell : UITableViewCell!
        cell = tableView.cellForRowAtIndexPath(indexPath)
        
        switch cell.tag {
            case 1:  viewType = AppodealNativeAdViewType.TypeNewsFeed
                break
            case 2: viewType = AppodealNativeAdViewType.TypeContentWall
                break
            case 3: viewType = AppodealNativeAdViewType.TypeContentStream
                break
            case 4: viewType = AppodealNativeAdViewType.Type320x50
                break
            default: break
        }
        
        var capacity : UInt!
        capacity = severalAdsLoadSwitch.on ? 10 : 1
        
        nativeAdService = AppodealNativeAdService.init(capacity: capacity);
        nativeAdService.delegate = self;
        nativeAdService.loadAd()
        self.showLoadingView(true)
    }

    
    func showLoadingView(show: Bool){
        if loadingView == nil {
            loadingView = UIView.init(frame: self.view.bounds)
            loadingView.backgroundColor = UIColor.grayColor()
            loadingView.alpha = 0.88
            var textLabel: UILabel!
            textLabel = UILabel.init(frame: loadingView.bounds)
            textLabel.textAlignment = NSTextAlignment.Center
            textLabel.textColor = UIColor.whiteColor()
            textLabel.font = UIFont.systemFontOfSize(14)
            textLabel.text = "Loading..."
            loadingView.addSubview(textLabel)
        }
        if show {
            self.view .addSubview(loadingView)
        } else {
            loadingView.removeFromSuperview()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier  == "NativeAdSegue" {
            (segue.destinationViewController as? SomeNativeAdViewController)?.adsArray = adsArray
            (segue.destinationViewController as? SomeNativeAdViewController)?.nativeAdViewType = viewType
        }
    }
    
    //MARK: AppodealNAtiveAdServiceDelegate
    
    func nativeAdServiceDidLoad() {
        self.showLoadingView(false)
        var nativeAd : AppodealNativeAd?
        
        repeat {
            nativeAd = nativeAdService.nextAd()
            if nativeAd != nil {
                adsArray.addObject(nativeAd!)
            }
        } while nativeAd != nil
        
        self.performSegueWithIdentifier("NativeAdSegue", sender: nil)
    }
    
    func nativeAdServiceDidFailedToLoad() {
        self.showLoadingView(false)
        let alertController = UIAlertController(title: "Fail to load", message:
            nil, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)

    }
}
