//
//  FlickrAPI.h
//  Cats
//
//  Created by Paul on 2017-09-25.
//  Copyright © 2017 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlickrPhoto.h"
#import <UIKit/UIKit.h>

@interface FlickrAPI : NSObject
@property (nonatomic) FlickrPhoto *flickrPhoto;


//this is what we want but we can not do it this way.
// + (NSArray*)searchFor:(NSString*)query;
//create with blocks because its asynchronous you are fetching data from the network
+ (void)searchFor:(NSString*)query
         complete:(void (^)(NSArray<FlickrPhoto*>* results))complete;

// + (UIImage*)loadImageForPhoto:(FlickrPhoto*)photo;
+ (void)loadImageForPhoto:(FlickrPhoto*)photo
                 complete:(void(^)(UIImage* result))complete;



+(void)loadThumbNailForPicture:(FlickrPhoto*)photo complete:(void (^)(UIImage *))complete;




@end
