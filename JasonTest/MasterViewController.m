//
//  MasterViewController.m
//  JasonTest
//
//  Created by Sky on 2/24/15.
//  Copyright (c) 2015 com.skypirate. All rights reserved.
//

#import "MasterViewController.h"
#import "Group.h"
#import "MeetupManager.h"
#import "MeetupCommunicator.h"
#import "DetailCell.h"
 
//#import "GroupBuilder.h"
#import "DetailViewController.h"
#import "MeetupCommunicatorDelegate.h"
#import "CoreLocation/CoreLocation.h"
#import "AppDelegate.h"  


//@interface MasterViewController ()

@interface MasterViewController () <MeetupManagerDelegate> {
    NSArray *_groups;
    MeetupManager *_manager;
}

@property NSMutableArray *objects;
@property (weak, nonatomic) CLLocationManager *locationManager;
@end


@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
  /*  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject: )];
    self.navigationItem.rightBarButtonItem = addButton; */
    
    _manager = [[MeetupManager alloc] init];
    _manager.communicator = [[MeetupCommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(startFetchingGroups:)
                                                 name:@"kCLAuthorizationStatusAuthorized"
                                               object:nil];
}

#pragma mark - Accessors

- (CLLocationManager *)locationManager
{
    if (_locationManager) {
        return _locationManager;
    }
    
    id appDelegate = [[UIApplication sharedApplication] delegate];
    if ([appDelegate respondsToSelector:@selector(locationManager)]) {
        _locationManager = [appDelegate performSelector:@selector(locationManager)];
    }
    return _locationManager;
}

//- (void)awakeFromNib {
//    [super awakeFromNib];
//}


#pragma mark - Notification Observer
- (void)startFetchingGroups:(NSNotification *)notification
{
    [_manager fetchGroupsAtCoordinate:self.locationManager.location.coordinate];
}
#pragma mark - MeetupManagerDelegate
- (void)didReceiveGroups:(NSArray *)groups
{
    _groups = groups;
    [self.tableView reloadData];
    //dispatch_async(dispatch_get_main_queue(), ^{
      //  [self.tableView reloadData];
   // });
}

- (void)fetchingGroupsFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}


#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _groups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Group *group = _groups[indexPath.row];
    [cell.nameLabel setText:group.name];
    [cell.whoLabel setText:group.who];
    [cell.locationLabel setText:[NSString stringWithFormat:@"%@, %@", group.city, group.country]];
    [cell.descriptionLabel setText:group.description];
    
    return cell;
}


/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDate *object = self.objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

 */
#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}




@end
