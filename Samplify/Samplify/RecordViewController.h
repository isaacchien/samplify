//
//  ViewController.h
//  Samplify
//
//  Created by Isaac Solo on 4/29/15.
//  Copyright (c) 2015 Isaac Chien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>
#import "AudioModel.h"

@interface RecordViewController : UIViewController <UIActionSheetDelegate>

@property (strong, nonatomic) AVAudioRecorder *audioRecorder;


@property (strong, nonatomic) AudioModel *model;



- (IBAction)recTapped:(id)sender;
- (IBAction)recReleased:(id)sender;
- (IBAction)playTapped:(id)sender;
- (IBAction)createSample:(id)sender;


@end