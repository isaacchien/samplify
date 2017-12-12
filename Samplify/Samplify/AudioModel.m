//
//  AudioModel.m
//  Samplify
//
//  Created by Isaac Solo on 5/4/15.
//  Copyright (c) 2015 Isaac Chien. All rights reserved.
//

#import "AudioModel.h"

@interface AudioModel ()

@property (strong, nonatomic) AVPlayer *player;
@property (strong, nonatomic) AVPlayerItem *playerItem;

@end


@implementation AudioModel

+ (instancetype) sharedModel
{
    static AudioModel *_sharedModel = nil;
    
    if (_sharedModel == nil) {
        _sharedModel = [[self alloc] init];
    }
    
    return _sharedModel;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        if (!self.player) {
            self.player = [[AVPlayer alloc] init];
        }
        NSURL *audioFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"audioRecording.m4a"]];

        self.playerItem = [AVPlayerItem playerItemWithURL:audioFileURL];
        self.playerItem.audioTimePitchAlgorithm = AVAudioTimePitchAlgorithmVarispeed;
        [self.player replaceCurrentItemWithPlayerItem:self.playerItem];

    }
    
    return self;
}

- (void) play
{
    NSURL *audioFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"audioRecording.m4a"]];
    self.playerItem = [AVPlayerItem playerItemWithURL:audioFileURL];
    self.playerItem.audioTimePitchAlgorithm = AVAudioTimePitchAlgorithmVarispeed;
    
    [self.player replaceCurrentItemWithPlayerItem:self.playerItem];
    
    [self.player play];

}

- (void) changeRate: (float) rate
{
    self.player.rate = rate;
}


@end
