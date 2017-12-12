//
//  SampleViewController.m
//  Samplify
//
//  Created by Isaac Solo on 5/4/15.
//  Copyright (c) 2015 Isaac Chien. All rights reserved.
//

#import "SampleViewController.h"

@interface SampleViewController ()

@property (strong, nonatomic) AudioModel *model;

@end

@implementation SampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.model = [AudioModel sharedModel];
    
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

// MUST CHANGE RATES AFTER PLAY IN ORDER FOR RATE TO CHANGE

- (IBAction)LowLaButton:(id)sender {
    [self.model play];
    [self.model changeRate:0.8333f];
}

- (IBAction)doButton:(id)sender {
    //[self.model changeRate:1.0f];
    [self.model play];
}
- (IBAction)reButton:(id)sender {
    [self.model play];
    [self.model changeRate:1.125f];
}
- (IBAction)miButton:(id)sender {
    [self.model play];
    [self.model changeRate:1.25f];
}

- (IBAction)solButton:(id)sender {
    [self.model play];
    [self.model changeRate:1.5f];
}
- (IBAction)laButton:(id)sender {
    [self.model play];
    [self.model changeRate:1.67f];
}
@end
