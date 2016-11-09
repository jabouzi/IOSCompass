//
//  ViewController.m
//  compass
//
//  Created by Skander Jabouzi on 2015-10-24.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *compassLabel;

@property (weak, nonatomic) IBOutlet UIImageView *compassImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CLLocationManager *locationManager = [[CLLocationManager alloc]  init];
    [self setLocationManager:locationManager];
    
    self.locationManager.delegate = self;
    
    if([CLLocationManager headingAvailable]) {
        [self.locationManager startUpdatingHeading];
    }
}

- (void) locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    /*double degrees = newHeading.magneticHeading;
    double radians = degrees * M_PI / 180;
    [self compassImageView].transform = CGAffineTransformMakeRotation(radians);
    [[self compassLabel] setText:[NSString stringWithFormat:@"%d",(int)degrees]];*/
    //NSLog(@"Magnetic Heading: %f", newHeading.magneticHeading);
    float oldRad =  -manager.heading.trueHeading * M_PI / 180.0f;
    float newRad =  -newHeading.trueHeading * M_PI / 180.0f;
    
    [UIView animateWithDuration:0.2
                     animations:^{
                         [self compassImageView].transform = CGAffineTransformMakeRotation(newRad);
                     }];
    NSLog(@"%f (%f) => %f (%f)", manager.heading.trueHeading, oldRad, newHeading.trueHeading, newRad);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
