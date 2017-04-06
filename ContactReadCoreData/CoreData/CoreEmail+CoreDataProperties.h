//
//  CoreEmail+CoreDataProperties.h
//  ContactReadCoreData
//
//  Created by Waseem Khan on 14/03/2017.
//  Copyright © 2017 Global Rescue. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "CoreEmail+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CoreEmail (CoreDataProperties)

+ (NSFetchRequest<CoreEmail *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *emailAddress;
@property (nonatomic) int64_t contactId;

@end

NS_ASSUME_NONNULL_END
