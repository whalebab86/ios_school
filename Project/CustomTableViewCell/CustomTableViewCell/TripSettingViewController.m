//
//  TripSettingViewController.m
//  CustomTableViewCell
//
//  Created by CLAY on 2017. 2. 22..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import "TripSettingViewController.h"
#import "TripSettingTableViewCell.h"

#import "ProfileSettingViewController.h"
#import "DataCenter.h"

@interface TripSettingViewController ()
<UITableViewDelegate, UITableViewDataSource, TripSettingTableViewCellDelegate>

@property (nonatomic, weak) UIButton        *closeButton;
@property (nonatomic, weak) UIBarButtonItem *closeButtonItem;

@property (nonatomic, weak) UITableView     *settingTableView;

@property (nonatomic)       NSArray         *resutArray;

@end

@implementation TripSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [[[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"] setBackgroundColor:[UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1]];
    
    /*  setLeftBarButtonItem : Setting Button */
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [closeButton setTintColor:[UIColor blackColor]];
    [closeButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [closeButton addTarget:self action:@selector(didClickBarButton:) forControlEvents:UIControlEventTouchUpInside];
    [closeButton setAccessibilityIdentifier:@"settingButton"];
    self.closeButton = closeButton;
    
    UIBarButtonItem *closeButtonItem = [[UIBarButtonItem alloc] initWithCustomView:closeButton];
    self.closeButtonItem = closeButtonItem;
    
    [self.navigationItem setLeftBarButtonItem:closeButtonItem];
    
    self.title = @"Setting";
    
    
    /* TableView */
    
    UITableView *settingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 1, self.view.frame.size.width, self.view.frame.size.height-1) style:UITableViewStyleGrouped];
    [settingTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [settingTableView setDelegate:self];
    [settingTableView setDataSource:self];
    //[settingTableView setBackgroundColor:[UIColor lightGrayColor]];
    [settingTableView setBackgroundColor:[UIColor colorWithRed:233/255.0 green:234/255.0 blue:236/255.0 alpha:1]];
    
    self.settingTableView = settingTableView;
    [self.view addSubview:settingTableView];
    
    self.resutArray = @[@{@"headerTitle":@"Profile Setting",
                          @"data":@[@{@"title":@"My profile",             @"type":@"A", @"value":@""}
                                    //,@{@"title":@"Account Settings",      @"type":@"A", @"value":@""}
                                    //,@{@"title":@"Smart Notifications",   @"type":@"A", @"value":@""}
                                    ]
                          },
                        
                        @{@"headerTitle":@"Account Type",
                          @"footerTitle":@"When your account is private, only people you approve can follow you and see your trips(unless you set a trip's privacy level to 'Everyone').",
                          @"data":@[@{@"title":@"Pricate account",        @"type":@"S", @"value":@"YES"}]
                          },
                        
                        @{@"headerTitle":@"APP Settings",
                          @"footerTitle":@"Syncing images over 3/4G may use a lot of data if you have large pictures.",
                          @"data":@[@{@"title":@"Distance units",         @"type":@"L", @"value":@"Kilometers"}
                                    ,@{@"title":@"Temperature",           @"type":@"L", @"value":@"Celsius"}
                                    ,@{@"title":@"Sync images over 3/4G", @"type":@"S", @"value":@"NO"}
                                    ]
                          },
                        
                        @{@"headerTitle":@"",
                          @"footerTitle":@"",
                          @"data":@[@{@"title":@"Logout",                 @"type":@"",  @"value":@""}]
                          }
                        ];
    
}

- (void)didClickBarButton:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate

/* section number */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.resutArray count];
}

/* section row number */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[[self.resutArray objectAtIndex:section] objectForKey:@"data"] count];
}

/* section header height */
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 50;
}

/* section header view */
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 55)];
    
    UIView *sectionBorderView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 1)];
    [sectionView addSubview:sectionBorderView];
    [sectionBorderView setBackgroundColor:[UIColor lightGrayColor]];
    
    UILabel *sectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, self.view.frame.size.width, 30)];
    [sectionLabel setFont:[UIFont systemFontOfSize:13]];
    [sectionLabel setTextColor:[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1]];
    [sectionLabel setText:[[self.resutArray objectAtIndex:section] objectForKey:@"headerTitle"]];
    [sectionView addSubview:sectionLabel];
    
    return sectionView;
}

/* section header height */
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if(section == 1) return 40;
    else if(section == 2) return 30;
    else             return 0;
}

/* section footer view */
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    CGFloat height = 0;
    
    if(section == 1) height = 40;
    if(section == 2) height = 30;
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, height)];
    
    UILabel *sectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, self.view.frame.size.width-30, height)];
    [sectionLabel setNumberOfLines:0];
    [sectionLabel setFont:[UIFont systemFontOfSize:11]];
    [sectionLabel setTextColor:[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1]];
    [sectionLabel setText:[[self.resutArray objectAtIndex:section] objectForKey:@"footerTitle"]];
    [sectionView addSubview:sectionLabel];
    
    return sectionView;
}

/* cell row */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TripSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil) {
        cell = [[TripSettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.indexPath = indexPath;
        [cell setDelegate:self];
    }
    
    NSDictionary *array = [[[self.resutArray objectAtIndex:indexPath.section] objectForKey:@"data"] objectAtIndex:indexPath.row];
    [cell accessoryViewWithCell:cell value:array];
    
    return cell;
}

/* cell row height */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 55;
}

/* cell row didSelect */
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
}

/* cell row didSelect */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DataCenter *center = [DataCenter sharedInstance];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    TripSettingTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleDefault];
    
    
    //if([[self.resutArray objectAtIndex:indexPath.section] objectAtIndex:<#(NSUInteger)#>])
    NSDictionary *array = [[[self.resutArray objectAtIndex:indexPath.section] objectForKey:@"data"] objectAtIndex:indexPath.row];
    if([[array objectForKey:@"type"] isEqualToString:@"S"]) {
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    if(indexPath.section == 0 && indexPath.row == 0) {
        
        ProfileSettingViewController *vc =[self.storyboard instantiateViewControllerWithIdentifier:@"ProfileSettingViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
    if(indexPath.section == 2 && indexPath.row == 0) {
        
        TripSettingTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *kilometers = [UIAlertAction actionWithTitle:@"Kilometers" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            cell.settingLabel.text = @"Kilometers";
            [center settingDistanceUnits:@"Kilometers"];
        }];
        
        UIAlertAction *miles = [UIAlertAction actionWithTitle:@"Miles" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            cell.settingLabel.text = @"Miles";
            [center settingDistanceUnits:@"Miles"];
        }];
        
        
        
        [alertController addAction:kilometers];
        [alertController addAction:miles];
        
        
        [self presentViewController:alertController animated:YES completion:nil];
    } else if(indexPath.section == 2 && indexPath.row == 1) {
     
        TripSettingTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *kilometers = [UIAlertAction actionWithTitle:@"Celsius" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            cell.settingLabel.text = @"Celsius";
            [center settingTemperature:@"Celsius"];
        }];
        
        UIAlertAction *miles = [UIAlertAction actionWithTitle:@"Fehrenheit" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            cell.settingLabel.text = @"Fehrenheit";
            [center settingTemperature:@"Fehrenheit"];
        }];
        
        
        [alertController addAction:kilometers];
        [alertController addAction:miles];
        
        
        [self presentViewController:alertController animated:YES completion:nil];
    } else if(indexPath.section == 3 && indexPath.row == 0) {
        
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Logout"
                                              message:nil
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * _Nonnull action) {
                                       
                                       [[DataCenter sharedInstance] settingUserId:@""];
                                       
                                       UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
                                       UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
                                       window.rootViewController = vc;
                                       [window makeKeyAndVisible];
                                       
                                   }];
        
        UIAlertAction *cancleAction = [UIAlertAction
                                   actionWithTitle:@"CANCLE"
                                   style:UIAlertActionStyleDefault
                                   handler:nil];
        
        [alertController addAction:okAction];
        [alertController addAction:cancleAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

-(void)settingCustomCell:(TripSettingTableViewCell *)cell didChangedValue:(BOOL)value {
    
    DataCenter *center = [DataCenter sharedInstance];
    
    if(cell.indexPath.section == 1 && cell.indexPath.row == 0) {
        
        [center settingIsSwitchPrivate:value];
        
    } else if(cell.indexPath.section == 2 && cell.indexPath.row == 2) {
        
        [center settingIsSwitchSync:value];
    }
}

@end
