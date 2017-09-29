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
//    self.mapTitle.text = self.flickrPhoto.title;
    
    self.imageView.image = self.flickrPhoto.image;
    MKCoordinateSpan span = MKCoordinateSpanMake(.25f, .25f);
    self.mapView.region = MKCoordinateRegionMake(self.flickrPhoto.coordinate, span);
    
//    FlickrPhoto *annotation = [[FlickrPhoto alloc] init];
//    annotation.coordinate = self.flickrPhoto.coordinate;
//    
//    [self.mapView addAnnotation:annotation];
    
    /* 
     Notice I refer to a mapView outlet here. So you will have to create one
     
     Next I will use the Photo object to set the mapView's annotation property. Because the Photo object conforms to MKAnnotation its coordinate property and title will be used by the annotation. So simply call addAnnotation: on the mapView and pass it the photo object passed to the DetailViewController instance.
     
     When you tap the annotation pin you should see the title of the image displayed.
     
     */

    
}




@end
