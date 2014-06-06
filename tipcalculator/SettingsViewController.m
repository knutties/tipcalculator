//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Natarajan Kannan on 6/5/14.
//  Copyright (c) 2014 Y.CORP.YAHOO.COM\natarajk. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

- (IBAction)onTap:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadDefaultTipPercent];

}

- (void)viewWillAppear {
    [self loadDefaultTipPercent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    NSLog(@"settings tapped");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipControl.selectedSegmentIndex forKey:@"default_tip_percent_index"];
    [defaults synchronize];
    
}

- (void)loadDefaultTipPercent {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int tipIndex = [defaults integerForKey:@"default_tip_percent_index"];
    [self.defaultTipControl setSelectedSegmentIndex:tipIndex];
}

@end
