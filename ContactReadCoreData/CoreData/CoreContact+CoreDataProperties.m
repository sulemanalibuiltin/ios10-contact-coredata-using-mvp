//
//  CoreContact+CoreDataProperties.m
//  ContactReadCoreData
//
//  Created by Waseem Khan on 14/03/2017.
//  Copyright © 2017 Global Rescue. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "CoreContact+CoreDataProperties.h"

@implementation CoreContact (CoreDataProperties)

+ (NSFetchRequest<CoreContact *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CoreContact"];
}

@dynamic mobile;
@dynamic company;
@dynamic name;

@end
