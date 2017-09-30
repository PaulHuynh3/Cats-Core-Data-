//
//  Photo+CoreDataClass.m
//  CoreData With Cats
//
//  Created by Paul on 2017-09-29.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "Photo+CoreDataClass.h"

@implementation Photo

//update the entity's property with json data.
-(void)updateDataWithQuery:(NSDictionary*)info{
    self.flickrID = info[@"id"];
    self.owner = info[@"owner"];
    self.secret = info[@"secret"];
    self.server = info[@"server"];
    self.title = info[@"title"];
    self.farm = [info[@"farm"] integerValue];
    self.latitude = [info[@"latitude"]doubleValue];
    self.longitude = [info[@"longitude"]doubleValue];
    self.urlSmallImage = info[@"url_sq"];
    
    
}

@end
