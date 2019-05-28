//
//  SHAudioPlayerItemProtocol.h
//  SHAudioPlayer
//
//  Created by Shebin Koshy on 25/05/19.
//  Copyright © 2019 Shebin Koshy. All rights reserved.
//

@protocol SHAudioPlayerItemProtocol <NSObject>
@property(nonatomic,strong) NSString *uniqueId;
@property(nonatomic,strong) NSURL *songUrl;
@property(nonatomic,strong) UIImage *albumArtImage;
-(NSString*)titleToDisplay;

@end

