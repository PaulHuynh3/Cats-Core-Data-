//
//  FlickrPhoto.m
//  Cats
//
//  Created by Paul on 2017-09-25.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "FlickrPhoto.h"

@implementation FlickrPhoto

-(instancetype)initWithInfo:(NSDictionary<NSString *,id> *)info{
    
    self = [super init];
    
    if (self) {
        _flickrID = info[@"id"];
        _owner = info[@"owner"];
        _secret = info[@"secret"];
        _server = info[@"server"];
        _title = info[@"title"];
        _farm = [info[@"farm"] integerValue];
        _latitude = [info[@"latitude"]doubleValue];
        _longitude = [info[@"longitude"]doubleValue];
        _urlSmallImage = info[@"url_sq"];
        
        
        
    }
    return self;
    
}



- (NSURL *)url
{
    return [NSURL URLWithString:
            [NSString stringWithFormat:
             @"https://farm%ld.staticflickr.com/%@/%@_%@.jpg",
             self.farm, self.server, self.flickrID, self.secret]];
}


-(NSURL *)urlImage{
    
    return [NSURL URLWithString:self.urlSmallImage];
    
}

/*
 NSURL *imageURL = [NSURL URLWithString:@"http://example.com/demo.jpg"];
 NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
 UIImage *image = [UIImage imageWithData:imageData];
 
 */



//Overriding the getter of this property and setting it to the lat and long.
-(CLLocationCoordinate2D)coordinate{
    
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(self.latitude, self.longitude);
    return location;
}




@end
