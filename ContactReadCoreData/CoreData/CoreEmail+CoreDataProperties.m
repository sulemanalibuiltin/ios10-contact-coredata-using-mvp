//
//  CoreEmail+CoreDataProperties.m
//  ContactReadCoreData
//
//  Created by Waseem Khan on 14/03/2017.
//  Copyright © 2017 Global Rescue. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "CoreEmail+CoreDataProperties.h"

@implementation CoreEmail (CoreDataProperties)

+ (NSFetchRequest<CoreEmail *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CoreEmail"];
}

@dynamic emailAddress;
@dynamic contactId;

@end
