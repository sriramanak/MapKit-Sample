//
//  MapViewController.h
//  MapsSample
//
//  Created by paradigm creatives on 10/1/14.
//  Copyright (c) 2014 Paradigm Creatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "myAnnotation.h"

@interface MapViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>
@property(nonatomic,weak) IBOutlet MKMapView *mapview;
@property(nonatomic,strong) CLLocationManager *mgr;


@end
