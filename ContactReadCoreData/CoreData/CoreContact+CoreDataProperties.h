//
//  CoreContact+CoreDataProperties.h
//  ContactReadCoreData
//
//  Created by Waseem Khan on 14/03/2017.
//  Copyright © 2017 Global Rescue. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "CoreContact+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CoreContact (CoreDataProperties)

+ (NSFetchRequest<CoreContact *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *mobile;
@property (nullable, nonatomic, copy) NSString *company;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
