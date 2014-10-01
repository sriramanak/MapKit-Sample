//
//  MapViewController.m
//  MapsSample
//
//  Created by paradigm creatives on 10/1/14.
//  Copyright (c) 2014 Paradigm Creatives. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

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
    self.mgr=[[CLLocationManager alloc]init];
    self.mapview.showsUserLocation=YES;
    self.mgr.delegate=self;
    [self.mgr startUpdatingLocation];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)locationManager:(CLLocationManager *)manager
didUpdateToLocation:(CLLocation *)newLocation
fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"latitude----%f",newLocation.coordinate.latitude);
    NSLog(@"longitude----%f",newLocation.coordinate.longitude);
    CLLocationCoordinate2D cord;
    cord.latitude=(double)newLocation.coordinate.latitude;
    cord.longitude=(double)newLocation.coordinate.longitude;
    myAnnotation *annotation=[[myAnnotation alloc]initWithTitle:@"ramana" andCoordinate:cord];
    [self.mapview addAnnotation:annotation];
   
    [self moveToPlace:cord];
    CLGeocoder *coder=[[CLGeocoder alloc]init];
    [coder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks,NSError *error){
        CLPlacemark *placemark=[placemarks objectAtIndex:0];
        NSLog(@"area---%@",placemark.country);
        
    }];
    
    //[self.mgr stopUpdatingLocation];
}
-(void) moveToPlace:(CLLocationCoordinate2D )cordinates
{
    MKCoordinateRegion region;
    region.center = cordinates;
    MKCoordinateSpan span = {0.4, 0.4};
    region.span = span;
    [self.mapview setRegion:region animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
