//
//  ViewController.m
//  ContactReadCoreData
//
//  Created by Waseem Khan on 08/03/2017.
//  Copyright © 2017 Global Rescue. All rights reserved.
//

#import "ContactListVC.h"
#import "ContactListProtocol.h"
#import "ContactListPresenter.h"
#import "CoreContact+CoreDataClass.h"

@interface ContactListVC ()<UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) id<ContactListPresenterProtocol> contactListPresenter;


@end

@implementation ContactListVC{
    NSArray* contacts;
    NSFetchedResultsController *fetchedResultsController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)syncContacts:(id)sender {
    [self.contactListPresenter loadContactFromMobile];
}

- (void) successLoadingContacts:(NSArray *)loadContacts{
    contacts = loadContacts;
    NSLog(@"%lu",(unsigned long)contacts.count);
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return contacts.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    CoreContact *contact = [contacts objectAtIndex:indexPath.row];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.company;
    
    return cell;
}


- (id<ContactListPresenterProtocol>) contactListPresenter{
    if(!_contactListPresenter){
        _contactListPresenter = [[ContactListPresenter alloc] initWithView:self];
    }
    return _contactListPresenter;
}

- (void)setFetchedResultsController:(NSFetchedResultsController*)fetchedResultsCtlr
{
    fetchedResultsController = fetchedResultsCtlr;
    fetchedResultsController.delegate = self;
    [fetchedResultsController performFetch:NULL];
}

@end
