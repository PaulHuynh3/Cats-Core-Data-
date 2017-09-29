//
//  DetailedViewController.m
//  Cats
//
//  Created by Paul on 2017-09-26.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *mapTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;


@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapTitle.text = self.flickrPhoto.title;
    
    self.imageView.image = self.flickrPhoto.image;
    //creates the map span
    MKCoordinateSpan span = MKCoordinateSpanMake(.25f, .25f);
    //sets the region for the user
    self.mapView.region = MKCoordinateRegionMake(self.flickrPhoto.coordinate, span);
    
    //adds the red pin on the map
    [self.mapView addAnnotation:self.flickrPhoto];
}




@end
