//
//  DPLocationInputView.h
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-25.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import "NSString+Location.h"
#import <CoreLocation/CoreLocation.h>

@class LocationInputController;
@protocol LocationInputControllerDelegate <NSObject>

@required
- (void)locationInputController:(LocationInputController *)locationInputController didLocatedLocation:(NSString *)locationString;

@end

@interface LocationInputController : NSObject <
	CLLocationManagerDelegate
>

@property (strong, nonatomic) IBOutlet UILabel *locationXLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationYLabel;
@property (strong, nonatomic) IBOutlet UIButton *locatingButton;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *currentLocationActivityIndicatorView;

@property (nonatomic, weak) id<LocationInputControllerDelegate> delegate;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (assign) CLLocationCoordinate2D selectedCoordinate;

- (void)initLocationSetting;
- (void)destroyLocationSetting;

- (IBAction)startLocating:(id)sender;

@end
