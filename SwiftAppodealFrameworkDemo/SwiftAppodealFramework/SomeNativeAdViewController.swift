//
//  SomeNativeAdViewController.swift
//  iosdemoSwift
//
//  Created by Stas Kochkin on 20/11/15.
//  Copyright © 2015 dtlbox. All rights reserved.
//

import UIKit
import Appodeal

class SomeNativeAdViewController : UITableViewController {
    
    var nativeAdViewType : AppodealNativeAdViewType = AppodealNativeAdViewType.Type320x50
    var adsArray : NSArray! = nil
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adsArray.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var heigth : CGFloat!
        switch nativeAdViewType {
        case AppodealNativeAdViewType.Type320x50 : heigth = 50
            break
        case AppodealNativeAdViewType.TypeContentStream : heigth = self.view.frame.size.width
            break
        case AppodealNativeAdViewType.TypeContentWall : heigth = 200
            break
        case AppodealNativeAdViewType.TypeNewsFeed : heigth = 80
            break
        default : heigth = 50
        }
        return heigth
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell!
        cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "adsCell")
        var adView = AppodealNativeAdView!()
        adView = AppodealNativeAdView(type: nativeAdViewType, andNativeAd: adsArray .objectAtIndex(indexPath.row) as! AppodealNativeAd , andAttributes: self.attributes(), rootViewController: self)
        cell.contentView.addSubview(adView)
        return cell;
    }
    
    
    func attributes() -> AppodealNativeAdViewAttributes{
        let attributes = AppodealNativeAdViewAttributes()
        if (nativeAdViewType == AppodealNativeAdViewType.TypeNewsFeed) {
            attributes.iconHeigtht = 50;
            attributes.iconWidth = 50;
            attributes.width = self.view.frame.size.width;
            attributes.heigth = 80;
            attributes.roundedIcon = false;
            attributes.sponsored = true;
            attributes.starRatingColor = UIColor.orangeColor()
        }
        if (nativeAdViewType == AppodealNativeAdViewType.TypeContentStream){
            attributes.iconHeigtht = 50;
            attributes.iconWidth = 50;
            attributes.width = self.view.frame.size.width;
            attributes.heigth = self.view.frame.size.width;
            attributes.roundedIcon = false;
            attributes.sponsored = true;
            attributes.starRatingColor = UIColor.orangeColor()
        }
        if (nativeAdViewType == AppodealNativeAdViewType.TypeContentWall){
            attributes.heigth = 200
            attributes.width = 200
            attributes.sponsored = true
        }
        if (nativeAdViewType == AppodealNativeAdViewType.Type320x50){
            attributes.heigth = 50
            attributes.width = self.view.frame.size.width
            attributes.buttonColor = UIColor.greenColor()
            attributes.buttonTitleFont = UIFont.systemFontOfSize(12)
            attributes.descriptionFontColor = UIColor.darkGrayColor()
            attributes.descriptionFont = UIFont.systemFontOfSize(12)
            attributes.titleFont = UIFont.systemFontOfSize(14)
            attributes.titleFontColor = UIColor.blackColor()
            attributes.starRatingColor = UIColor.orangeColor()
        }
        return attributes
    }
}
    
    