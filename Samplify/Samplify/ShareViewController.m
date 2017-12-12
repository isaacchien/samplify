//
//  ShareViewController.m
//  Samplify
//
//  Created by Isaac Solo on 5/6/15.
//  Copyright (c) 2015 Isaac Chien. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)shareButton:(id)sender {
    NSString *shareText = @"Check out my sample!";
    
    NSURL *audioFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"audioRecording.m4a"]];

    
    NSArray *itemsToShare = @[shareText, audioFileURL];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];

    
    //activityVC.excludedActivityTypes = @[];
    [self presentViewController:activityVC animated:YES completion:nil];
    
}
@end
