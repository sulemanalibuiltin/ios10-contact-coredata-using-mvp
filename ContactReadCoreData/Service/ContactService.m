//
//  ContactService.m
//  ContactReadCoreData
//
//  Created by Waseem Khan on 08/03/2017.
//  Copyright © 2017 Global Rescue. All rights reserved.
//

#import "ContactService.h"
#import "CoreContact+CoreDataClass.h"

#import <Contacts/CNContactStore.h>
#import <Contacts/CNContactFetchRequest.h>

#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@interface ContactService()


@end

@implementation ContactService{
    NSMutableArray *contactList;
}


+ (instancetype) sharedInstance{
    static ContactService *contactServiceSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        contactServiceSingleton = [[ContactService alloc] init];
    });
    
    return contactServiceSingleton;
}

- (void) loadContactFromMobile:(CompletionBlock)completionBlock failureBlock:(FailureBlock)failureBlock{
    CNContactStore *store = [[CNContactStore alloc] init];
    [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted == YES) {
            //keys with fetching properties
            NSArray *keys = @[CNContactFamilyNameKey, CNContactGivenNameKey, CNContactPhoneNumbersKey, CNContactImageDataKey];
            CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:keys];
            NSError *error;
            
            contactList = [[NSMutableArray alloc] init];
            BOOL success = [store enumerateContactsWithFetchRequest:request error:&error usingBlock:^(CNContact * __nonnull contact, BOOL * __nonnull stop) {
                if (error) {
                    NSLog(@"error fetching contacts %@", error);
                } else {
                   
                    NSManagedObjectContext *context = [self managedObjectContext];
                    
                    // Create a new managed object
                    NSManagedObject *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"CoreContact" inManagedObjectContext:context];
                    [newContact setValue:contact.givenName forKey:@"name"];
                    [newContact setValue:contact.familyName forKey:@"company"];
                    
                    NSError *error = nil;
                    // Save the object to persistent store
                    if (![context save:&error]) {
                        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
                    }
                    
                }
            }];
            
            if (success) {
               // NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"CDContact"];
               // NSFetchedResultsController *fetchResultController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[self managedObjectContext] sectionNameKeyPath:nil cacheName:nil];
                
                NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"CoreContact"];
                NSError* error;
                NSArray* contacts = [[self managedObjectContext] executeFetchRequest:request error:&error];
                
                if(error){
                    NSLog(@"%@", error);
                    failureBlock(error.description);
                }
                
                completionBlock(contacts);
            }
        }
    }];
    
}

/*
-(void)saveChangesInDb {
    @try {
        id delegate = [UIApplication sharedApplication].delegate;
        NSManagedObjectContext *context = [delegate managedObjectContext];
        
        NSError *error = nil;
        [context save:&error];
        if (error) {
             NSLog(@"%@", error);
        } else {
            
        }
    }
    @catch (NSException *exception) {
         NSLog(@"%@", exception.description);
    }
    @finally {
        
    }
}*/


- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


@end
