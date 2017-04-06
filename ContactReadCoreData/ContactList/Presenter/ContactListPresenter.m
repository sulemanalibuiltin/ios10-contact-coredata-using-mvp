//
//  ContactVCPresenterViewController.m
//  ContactReadCoreData
//
//  Created by Waseem Khan on 08/03/2017.
//  Copyright © 2017 Global Rescue. All rights reserved.
//

#import "ContactListPresenter.h"
#import "ContactService.h"

@interface ContactListPresenter ()

@property (nonatomic) id<ContactListView> contactListView;

@end

@implementation ContactListPresenter


- (void) loadContactFromMobile{
    ContactService *contactService = [ContactService sharedInstance];
    [contactService loadContactFromMobile:^(NSArray *contactList)  {
        [self.contactListView successLoadingContacts:contactList];
    } failureBlock:^(NSString *message) {
        
    }];
}


-(instancetype)initWithView:(id<ContactListView>)view{
    self = [super init];
    
    if (self) {
        _contactListView = view;
    }
    return self;
}


@end
