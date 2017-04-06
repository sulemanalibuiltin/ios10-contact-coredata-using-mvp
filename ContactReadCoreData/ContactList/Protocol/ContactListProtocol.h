//
//  ContactListProtocol.h
//  ContactReadCoreData
//
//  Created by Waseem Khan on 08/03/2017.
//  Copyright © 2017 Global Rescue. All rights reserved.
//

#import <Foundation/Foundation.h>



@protocol ContactListView <NSObject>

- (void) successLoadingContacts:(NSArray*) contacts;

@end




@protocol ContactListPresenterProtocol <NSObject>

- (void) loadContactFromMobile;

@end
