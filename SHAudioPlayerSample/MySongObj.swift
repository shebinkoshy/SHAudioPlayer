//
//  MySongObj.swift
//  SHAudioPlayerSample
//
//  Created by Shebin Koshy on 22/07/18.
//  Copyright © 2018 Shebin Koshy. All rights reserved.
//

import UIKit
//import SDWebImage
import SHAudioPlayerSDK

public class MySongObj: NSObject {

    
    @objc public var uniqueId:String?
    @objc public var title:String?
    /*@objc var imageUrl:String? {
        didSet {
            guard let imgUrl = imageUrl else {
                return;
            }
            SDWebImageManager.shared().downloadImage(with: NSURL(string: imgUrl) as URL!, options: .continueInBackground, progress: {
                (receivedSize :Int, ExpectedSize :Int) in
                
            }, completed: {[unowned self]
                (image : UIImage?, error : Error?, cacheType : SDImageCacheType, finished : Bool, url : URL?) in
                self.albumArtImage = image
            })
            
        }
    }*/
    @objc public var songUrl:URL?
    @objc public var albumArtImage:UIImage?
    
}

extension MySongObj: SHAudioPlayerItemProtocol {
    @objc public func titleToDisplay() -> String {
        if title != nil {
            return title!;
        }
        return songUrl?.lastPathComponent ?? ""
    }
    
}
