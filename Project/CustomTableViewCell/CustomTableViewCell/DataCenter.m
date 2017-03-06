//
//  DataCenter.m
//  CustomTableViewCell
//
//  Created by CLAY on 2017. 2. 23..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import "DataCenter.h"
#import "AppDelegate.h"
#import "Trip+CoreDataClass.h"

@interface DataCenter()

@property (nonatomic) AppDelegate *appDelegate;
@property (nonatomic) NSManagedObjectContext *context;

@property (nonatomic) NSArray *resultArray;

@property (nonatomic) NSString *userId;
@property (nonatomic) NSString *userPw;

@property (nonatomic) BOOL isSwitchPrivate;
@property (nonatomic) BOOL isSwitchSync;
@property (nonatomic) NSString *distanceUnits;
@property (nonatomic) NSString *temperature;

@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *lastName;
@property (nonatomic) NSString *tripTitle;

@property (nonatomic) NSData   *profileImage;
@property (nonatomic) NSData   *desctiprionImage;

@end

@implementation DataCenter

+ (instancetype)sharedInstance {
    
    static DataCenter *center = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = [[DataCenter alloc] init];
    });
    
    return center;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData
{
    
    //[self fetchItems];
    
    self.isSwitchPrivate  = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isSwitchPrivate"] boolValue];
    self.isSwitchSync     = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isSwitchSync"]    boolValue];
    self.distanceUnits    = [[NSUserDefaults standardUserDefaults]  objectForKey:@"distanceUnits"];
    self.temperature      = [[NSUserDefaults standardUserDefaults]  objectForKey:@"temperature"];
    
    self.userId           = [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"];
    self.userPw           = @"password";
    
    self.firstName        = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstName"];
    self.lastName         = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastName"];
    self.tripTitle        = [[NSUserDefaults standardUserDefaults] objectForKey:@"tripTitle"];
    self.profileImage     = [[NSUserDefaults standardUserDefaults] objectForKey:@"profileImage"];
    self.desctiprionImage = [[NSUserDefaults standardUserDefaults] objectForKey:@"desctiprionImage"];
    
    if(self.distanceUnits == nil) self.distanceUnits = @"Kilometer";
    if(self.temperature   == nil) self.temperature   = @"Celsius";
    
    if(self.firstName     == nil) self.firstName     = @"First";
    if(self.lastName      == nil) self.lastName      = @"Last";
    if(self.tripTitle     == nil) self.tripTitle     = @"Trip Title";
    
    if(self.profileImage      == nil)
        self.profileImage = UIImagePNGRepresentation([UIImage imageNamed:@"profile"]);
    if(self.desctiprionImage  == nil)
        self.desctiprionImage  = UIImageJPEGRepresentation([UIImage imageNamed:@"profile.jpg"], 1);
}

- (void)settingUserId:(NSString *)userId {
    
    self.userId = userId;
    [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
}

- (void)settingIsSwitchPrivate:(BOOL)isSwitchPrivate {
    
    self.isSwitchPrivate = isSwitchPrivate;
    
    NSString *result = (self.isSwitchPrivate ? @"YES" : @"NO");
    [[NSUserDefaults standardUserDefaults] setObject:result forKey:@"isSwitchPrivate"];
}

- (void)settingDistanceUnits:(NSString *)distanceUnits {
    
    self.distanceUnits = distanceUnits;
    [[NSUserDefaults standardUserDefaults] setObject:distanceUnits forKey:@"distanceUnits"];
}

- (void)settingTemperature:(NSString *)temperature {
    
    self.temperature = temperature;
    [[NSUserDefaults standardUserDefaults] setObject:temperature forKey:@"temperature"];
}

- (void)settingIsSwitchSync:(BOOL)isSwitchSync {
    
    self.isSwitchSync = isSwitchSync;
    
    NSString *result = (self.isSwitchSync ? @"YES" : @"NO");
    [[NSUserDefaults standardUserDefaults] setObject:result forKey:@"isSwitchSync"];
}

- (void)settingFirstName:(NSString *)firstName {
    
    self.firstName = firstName;
    [[NSUserDefaults standardUserDefaults] setObject:firstName forKey:@"firstName"];
}

- (void)settingLastName:(NSString *)lastName {
    
    self.lastName = lastName;
    [[NSUserDefaults standardUserDefaults] setObject:lastName forKey:@"lastName"];
}

- (void)settingTripTitle:(NSString *)tripTitle {
    
    self.tripTitle = tripTitle;
    [[NSUserDefaults standardUserDefaults] setObject:tripTitle forKey:@"tripTitle"];
}

- (void)settingProfileImage:(NSData *)imageData {
    
    self.profileImage = imageData;
    [[NSUserDefaults standardUserDefaults] setObject:imageData forKey:@"profileImage"];
}

- (void)settingDescriptionImage:(NSData *)imageData {
    
    self.desctiprionImage = imageData;
    [[NSUserDefaults standardUserDefaults] setObject:imageData forKey:@"desctiprionImage"];
}


#pragma mark - Get Managed Context (Needed for core data to work)

- (NSManagedObjectContext *)managedObjectContext {
    
    self.appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.context = [[self.appDelegate persistentContainer]viewContext];
    
    NSLog(@"ManagedContext Created Successfully");
    
    return self.context;
}

- (void)fetchItems {
    
    [self managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Trip"];
    [request setReturnsObjectsAsFaults:NO];
    [request setEntity:[NSEntityDescription entityForName:@"Trip" inManagedObjectContext:self.context]];
    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"trip_index > 0"];
//    [request setPredicate:predicate];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"trip_date" ascending:NO];
    [request setSortDescriptors:[NSArray arrayWithObjects:sort, nil]];
    
    /* */
    
    NSError *error = nil;
    NSArray *results = [self.context executeFetchRequest:request error:&error];
    
    self.resultArray = [results mutableCopy];
}

- (void)saveTripInfo:(NSDictionary *)tripInfo{
    
    NSManagedObject *task = [[Trip alloc]initWithContext:[self managedObjectContext]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmssSSS"];
    NSString *friendlyTime = [formatter stringFromDate:[NSDate date]];
    
    [task setValue:friendlyTime                                     forKey:@"trip_index"];              /* String */
    [task setValue:[tripInfo objectForKey:@"trip_date"]             forKey:@"trip_date"];               /* Date */
    [task setValue:[tripInfo objectForKey:@"trip_content"]          forKey:@"trip_content"];            /* String */
    [task setValue:[tripInfo objectForKey:@"trip_image"]            forKey:@"trip_image"];              /* UIImage */
//    [task setValue:[tripInfo objectForKey:@"trip_location_postion"] forKey:@"trip_location_postion"];   /*  */
    [task setValue:[tripInfo objectForKey:@"trip_main_location"]    forKey:@"trip_main_location"];      /*  */
    [task setValue:[tripInfo objectForKey:@"trip_sub_location"]     forKey:@"trip_sub_location"];       /*  */
    [task setValue:[tripInfo objectForKey:@"trip_like"]             forKey:@"trip_like"];               /*  */
    
    [self.appDelegate saveContext];
    
    //[self fetchItems];
    NSLog(@"Save successful");
}

- (void)updateTripInfo:(NSDictionary *)tripInfo {
    
    NSFetchRequest *fetchRequest=[NSFetchRequest fetchRequestWithEntityName:@"Trip"];
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"trip_index==%@",[tripInfo objectForKey:@"trip_index"]];
    fetchRequest.predicate=predicate;
    
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];

    [result setValue:[tripInfo objectForKey:@"trip_index"]            forKey:@"trip_index"];
    [result setValue:[tripInfo objectForKey:@"trip_date"]             forKey:@"trip_date"];
    [result setValue:[tripInfo objectForKey:@"trip_content"]          forKey:@"trip_content"];
    [result setValue:[tripInfo objectForKey:@"trip_image"]            forKey:@"trip_image"];
    [result setValue:[tripInfo objectForKey:@"trip_main_location"]    forKey:@"trip_main_location"];
    [result setValue:[tripInfo objectForKey:@"trip_sub_location"]     forKey:@"trip_sub_location"];
    [result setValue:[tripInfo objectForKey:@"trip_like"]             forKey:@"trip_like"];
    
    [self.managedObjectContext save:nil];
}

- (void)deleteTripInfo:(NSString *)tripIndex {
    
    NSFetchRequest *fetchRequest=[NSFetchRequest fetchRequestWithEntityName:@"Trip"];
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"trip_index==%@",tripIndex];
    fetchRequest.predicate=predicate;
    
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    for (NSManagedObject *managedObject in result) {
        [self.managedObjectContext deleteObject:managedObject];
    }
    
    [self.managedObjectContext save:nil];
    
}


@end
