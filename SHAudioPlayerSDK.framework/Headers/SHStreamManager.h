//
//  SHStreamManager.h
//  SHAudioPlayer
//
//  Created by Shebin Koshy on 10/05/19.
//  Copyright © 2019 Shebin Koshy. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol SHAudioPlayerPrivateDelegate;
@protocol SHAudioPlayerPrivateProtocol;

NS_ASSUME_NONNULL_BEGIN
@interface SHStreamManager : NSObject<SHAudioPlayerPrivateProtocol>

@property (readwrite, unsafe_unretained) id<SHAudioPlayerPrivateDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
