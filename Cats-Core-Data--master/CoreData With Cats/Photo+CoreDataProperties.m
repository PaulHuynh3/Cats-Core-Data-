//
//  Photo+CoreDataProperties.m
//  CoreData With Cats
//
//  Created by Paul on 2017-09-29.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "Photo+CoreDataProperties.h"

@implementation Photo (CoreDataProperties)

+ (NSFetchRequest<Photo *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Photo"];
}

@dynamic flickrID;
@dynamic owner;
@dynamic secret;
@dynamic server;
@dynamic title;
@dynamic urlSmallImage;
@dynamic latitude;
@dynamic longitude;
@dynamic farm;

@end
