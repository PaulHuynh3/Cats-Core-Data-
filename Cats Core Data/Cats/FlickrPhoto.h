//
//  FlickrPhoto.h
//  Cats
//
//  Created by Paul on 2017-09-25.
//  Copyright © 2017 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface FlickrPhoto : NSObject <MKAnnotation>

//create properties relating to the API
@property (nonatomic,strong) NSString* flickrID;
@property (nonatomic,strong) NSString* owner;
@property (nonatomic,strong) NSString* secret;
@property (nonatomic,strong) NSString* server;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;



@property (nonatomic) NSInteger farm;

@property (nonatomic,strong) UIImage* image;

//required property for the mkAnontation.. we override this getter property. in the .m file.
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;






- (instancetype)initWithInfo:(NSDictionary<NSString*,id>*)info;

- (NSURL*) url;

@end
