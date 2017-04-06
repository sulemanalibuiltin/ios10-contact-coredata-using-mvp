//
//  ContactVCPresenterViewController.h
//  ContactReadCoreData
//
//  Created by Waseem Khan on 08/03/2017.
//  Copyright © 2017 Global Rescue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactListProtocol.h"

@interface ContactListPresenter : NSObject <ContactListPresenterProtocol>

-(instancetype)initWithView:(id<ContactListView>)view;

@end
