//
//  ViewController.h
//  compass
//
//  Created by Skander Jabouzi on 2015-10-24.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController: UIViewController <CLLocationManagerDelegate> {
    CLLocationManager *_locationManager;
}

@property(nonatomic,retain) CLLocationManager *locationManager;

@end

