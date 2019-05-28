//
//  SHAudioPlayerDelegate.h
//  SHAudioPlayerSDK
//
//  Created by Shebin Koshy on 25/05/19.
//  Copyright © 2019 Shebin Koshy. All rights reserved.
//

@class SHAudioPlayer;
@protocol SHAudioPlayerItemProtocol;
@protocol SHAudioPlayerDelegate <NSObject>

-(void)shAudioPlayerItemDidChanged:(SHAudioPlayer*)shAudioPlayer;
-(void)shAudioPlayer:(SHAudioPlayer*)shAudioPlayer updateCurrentItemTitle:(NSString*)title;
-(void)shAudioPlayer:(SHAudioPlayer*)shAudioPlayer updateSliderValue:(CGFloat)value currentTime:(double)currentTime duration:(double)duration;
-(void)shAudioPlayerStatusDidChanged:(SHAudioPlayer*)shAudioPlayer;
-(void)shAudioPlayerResetDurationUI:(SHAudioPlayer*)shAudioPlayer;
-(void)shAudioPlayerUpdateInfoCenter:(SHAudioPlayer*)shAudioPlayer;
-(void)shAudioPlayer:(SHAudioPlayer*)shAudioPlayer didEndCurrentItem:(id<SHAudioPlayerItemProtocol>)item;

@end
