//
//  ContactService.h
//  ContactReadCoreData
//
//  Created by Waseem Khan on 08/03/2017.
//  Copyright © 2017 Global Rescue. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CompletionBlock)(NSArray*);
typedef void(^FailureBlock)(NSString*);

@interface ContactService : NSObject

+ (instancetype) sharedInstance;

- (void) loadContactFromMobile: (CompletionBlock) completionBlock failureBlock:(FailureBlock)failureBlock;

@end
