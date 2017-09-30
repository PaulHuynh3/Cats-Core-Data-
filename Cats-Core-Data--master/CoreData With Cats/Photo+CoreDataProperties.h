//
//  Photo+CoreDataProperties.h
//  CoreData With Cats
//
//  Created by Paul on 2017-09-29.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "Photo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Photo (CoreDataProperties)

+ (NSFetchRequest<Photo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *flickrID;
@property (nullable, nonatomic, copy) NSString *owner;
@property (nullable, nonatomic, copy) NSString *secret;
@property (nullable, nonatomic, copy) NSString *server;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *urlSmallImage;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) int16_t farm;

@end

NS_ASSUME_NONNULL_END
