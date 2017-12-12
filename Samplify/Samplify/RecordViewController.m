//
//  ViewController.m
//  Samplify
//
//  Created by Isaac Solo on 4/29/15.
//  Copyright (c) 2015 Isaac Chien. All rights reserved.
//

#import "RecordViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "AudioModel.h"


@implementation RecordViewController

- (void)viewDidLoad
{
    
    //Audio Recording Setup
    
    NSURL *audioFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"audioRecording.m4a"]];
    
    NSDictionary *audioSettings = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [NSNumber numberWithFloat:44100],AVSampleRateKey,
                                   [NSNumber numberWithInt: kAudioFormatAppleLossless],AVFormatIDKey,
                                   [NSNumber numberWithInt: 1],AVNumberOfChannelsKey,
                                   [NSNumber numberWithInt:AVAudioQualityMedium],AVEncoderAudioQualityKey,nil];
    
    self.audioRecorder = [[AVAudioRecorder alloc]
                          initWithURL:audioFileURL
                          settings:audioSettings
                          error:nil];
    
    //create session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    //play speaker
    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
    AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,sizeof (audioRouteOverride),&audioRouteOverride);
    

    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    
    

    
    self.model = [AudioModel sharedModel];
    
    // hide share
    
    [super viewDidLoad];
}

- (IBAction)recTapped:(id)sender
{
    [self.audioRecorder record];
}

- (IBAction)recReleased:(id)sender
{
    [self.audioRecorder stop];
}

- (IBAction)playTapped:(id)sender
{
    [self.model play];
}

- (IBAction)createSample:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you ready to sample?" delegate:self cancelButtonTitle:@"No" destructiveButtonTitle:@"Yes" otherButtonTitles:nil];
    [actionSheet showInView:self.view];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger) buttonIndex{
    if(buttonIndex != [actionSheet cancelButtonIndex]){
        [self performSegueWithIdentifier:@"sampleSegue" sender:self];
    }
}
@end
