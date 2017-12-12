//
//  AudioModel.h
//  Samplify
//
//  Created by Isaac Solo on 5/4/15.
//  Copyright (c) 2015 Isaac Chien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>

@interface AudioModel : NSObject

+ (instancetype) sharedModel;


- (void) play;

- (void) changeRate: (float) rate;

@end
