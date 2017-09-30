//
//  Photo+CoreDataClass.h
//  CoreData With Cats
//
//  Created by Paul on 2017-09-29.
//  Copyright © 2017 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Photo : NSManagedObject

-(void)updateDataWithQuery:(NSDictionary*)info;

@end

NS_ASSUME_NONNULL_END

#import "Photo+CoreDataProperties.h"
