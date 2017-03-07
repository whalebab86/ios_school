//
//  DetailViewController.m
//  CustomTableViewCell
//
//  Created by CLAY on 2017. 2. 19..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import "TripDetailViewController.h"
#import <Photos/Photos.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBook/AddressBook.h>

#import "DataCenter.h"

@interface TripDetailViewController ()
<UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate>
@property CGFloat contentButtonY;
@property (nonatomic, weak) NSLocale     *locale;

@property (nonatomic, weak) UIView       *locationView;
@property (nonatomic, weak) UIView       *locationBorder;
@property (nonatomic, weak) UIImageView  *locationImage;
@property (nonatomic, weak) UILabel      *locationLabel;
@property (nonatomic, weak) UIButton     *locationButton;

@property (nonatomic, weak) UIView       *dateView;
@property (nonatomic, weak) UIView       *dateBorder;
@property (nonatomic, weak) UIDatePicker *datePicker;
@property (nonatomic, weak) UIImageView  *dateImage;
@property (nonatomic, weak) UILabel      *dateLabel;
@property (nonatomic, weak) UIButton     *dateButton;

@property (nonatomic, weak) UIView       *contentView;
@property (nonatomic, weak) UIImageView  *contentImageView;
@property (nonatomic, weak) UITextView   *contentTextView;
@property (nonatomic, weak) UIButton     *photoButton;

@property (nonatomic) UIImagePickerController *picker;

@property (nonatomic) CLLocationManager *locationManager;

@property (nonatomic) NSDateFormatter *dateFormatter;

@property (nonatomic) NSMutableDictionary *tripInfo;

@end

@implementation TripDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.tripInfo = [[NSMutableDictionary alloc] init];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didContentTextViewChange:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didContentTextViewChange:) name:UIKeyboardWillHideNotification object:nil];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [[[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"] setBackgroundColor:[UIColor colorWithRed:26/255.0 green:36/255.0 blue:48/255.0 alpha:1]];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:26/255.0 green:36/255.0 blue:48/255.0 alpha:1]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{
                                                                      NSForegroundColorAttributeName : [UIColor whiteColor],
                                                                      }];

    /* Bar Item Setting */
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(didClickBarItem:)];
    [backItem setAccessibilityIdentifier:@"backItem"];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(didClickBarItem:)];
    [doneItem setAccessibilityIdentifier:@"doneItem"];
    
    [self.navigationItem setTitle:@"New Step"];
    [self.navigationItem setLeftBarButtonItem:backItem];
    [self.navigationItem setRightBarButtonItem:doneItem];
    
    CGFloat selfWidth  = self.view.frame.size.width;
    CGFloat selfHeight = self.view.frame.size.height;
    
    CGFloat viewHeight = 65;
    
    CGFloat naviBarHeight = self.navigationController.navigationBar.frame.size.height;
    
    CGFloat offsetX = 0;
    CGFloat offsetY = 0;
    
    const CGFloat MARGIN = 20;
    
    offsetY += naviBarHeight + 20;
    
    /* Location View */
    UIView *locationView = [[UIView alloc] initWithFrame:CGRectMake(offsetX, offsetY, selfWidth, viewHeight)];
    
    [self.view addSubview:locationView];
    self.locationView = locationView;
    
    UIView *locationBorder = [[UIView alloc] init];
    locationBorder.frame = CGRectMake(0, locationView.frame.size.height-1, locationView.frame.size.width, 1);
    locationBorder.backgroundColor = [UIColor lightGrayColor];
    
    [locationView addSubview:locationBorder];
    self.locationBorder = locationBorder;
    
    UIImageView *locationImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"location"]];
    [locationImage setFrame:CGRectMake(MARGIN, MARGIN, locationView.frame.size.height - (MARGIN *2), locationView.frame.size.height - (MARGIN *2))];
    [locationView addSubview:locationImage];
    self.locationImage = locationImage;
    
    UILabel *locationLabel = [[UILabel alloc] initWithFrame:CGRectMake((MARGIN*2)+locationImage.frame.size.width, MARGIN, locationView.frame.size.width - ((MARGIN*3)+locationImage.frame.size.width + 40), locationView.frame.size.height - (MARGIN*2))];
    //[locationLabel setText:@"Seoul, Seoul Korea"];
    [locationView addSubview:locationLabel];
    self.locationLabel = locationLabel;
    
    UIButton *locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [locationButton setFrame:CGRectMake(locationView.frame.size.width - MARGIN - (locationView.frame.size.height - (MARGIN *2)),
                                        MARGIN,
                                        locationView.frame.size.height - (MARGIN *2),
                                        locationView.frame.size.height - (MARGIN *2))];
    //[locationButton setBackgroundColor:[UIColor blueColor]];
    [locationButton setImage:[UIImage imageNamed:@"gps-fixed-indicator"] forState:UIControlStateNormal];
    [locationButton setAccessibilityIdentifier:@"locationButton"];
    [locationButton addTarget:self action:@selector(didClickDetailViewButton:) forControlEvents:UIControlEventTouchUpInside];
    [locationView addSubview:locationButton];
    self.locationButton = locationButton;
    
    
    offsetY += viewHeight;
    
    /* Date View */
    UIView *dateView = [[UIView alloc] initWithFrame:CGRectMake(offsetX, offsetY, selfWidth, viewHeight)];
    [dateView setClipsToBounds:YES];
    [self.view addSubview:dateView];
    self.dateView = dateView;
    
    UIView *dateBorder = [[UIView alloc] init];
    dateBorder.frame = CGRectMake(0, self.dateView.frame.size.height-1, self.dateView.frame.size.width, 1);
    dateBorder.backgroundColor = [UIColor lightGrayColor];
    
    [dateView addSubview:dateBorder];
    self.dateBorder = dateBorder;
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, viewHeight, selfWidth, 170)];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ko_kr"];
    [datePicker setLocale:locale];
    [datePicker addTarget:self action:@selector(didChangeValueWithDatePicker:) forControlEvents:UIControlEventValueChanged];
    [datePicker setAccessibilityIdentifier:@"datePicker"];
    [dateView addSubview:datePicker];
    self.locale = locale;
    self.datePicker = datePicker;
    
    offsetY += self.dateView.frame.size.height;
    
    
    UIImageView *dateImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"calendar"]];
    [dateImage setFrame:CGRectMake(MARGIN, MARGIN, self.dateView.frame.size.height - (MARGIN *2), self.dateView.frame.size.height - (MARGIN *2))];
    [dateView addSubview:dateImage];
    self.dateImage = dateImage;
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake((MARGIN*2)+dateImage.frame.size.width, MARGIN, self.dateView.frame.size.width - ((MARGIN*3)+dateImage.frame.size.width), self.dateView.frame.size.height - (MARGIN*2))];
    [dateView addSubview:dateLabel];
    self.dateLabel = dateLabel;
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setLocale:locale];
    [self.dateFormatter setDateFormat:@"yyyy년 MM월 dd일 a HH:mm"];

    dateLabel.text = [self.dateFormatter stringFromDate:self.datePicker.date];
    
    UIButton *dateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [dateButton setFrame:self.dateView.bounds];
    [dateButton addTarget:self action:@selector(didClickDetailViewButton:) forControlEvents:UIControlEventTouchUpInside];
    [dateButton setAccessibilityIdentifier:@"dateButton"];
    self.dateButton = dateButton;
    [dateView addSubview:dateButton];
    
    
    /* Content View */
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(offsetX, offsetY, selfWidth, selfHeight-offsetY)];
    [self.view addSubview:contentView];
    self.contentView = contentView;
    
    
    CGFloat imageFrameWidth = self.view.frame.size.width / 6;
    UIImageView *contentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width-imageFrameWidth-5, 5, imageFrameWidth, imageFrameWidth)];
    [contentView addSubview:contentImageView];
    self.contentImageView = contentImageView;
    
    UITextView *contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 5, self.view.frame.size.width-20, self.contentView.frame.size.height-10)];
    [contentTextView setFont:[UIFont systemFontOfSize:20]];
    [contentTextView setBackgroundColor:[UIColor clearColor]];
    [contentView addSubview:contentTextView];
    self.contentTextView = contentTextView;
    
    offsetX = self.view.frame.size.width - 160;
    offsetY = self.view.frame.size.height - 45;
    
    /* Content Add Photo Button */
    UIButton *photoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [photoButton setFrame:CGRectMake(offsetX, offsetY, 150, 35)];
    [photoButton setBackgroundColor:[UIColor lightGrayColor]];
    [photoButton setTitle:@"Add Photo" forState:UIControlStateNormal];
    [photoButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [photoButton.layer setCornerRadius:8];
    [photoButton setImage:[UIImage imageNamed:@"photo-camera"] forState:UIControlStateNormal];
    [photoButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [photoButton.titleLabel setFont:[UIFont boldSystemFontOfSize:12]];
    [photoButton setImageEdgeInsets:UIEdgeInsetsMake(5, -15, 5, 5)];
    [photoButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -25, 0, 0)];
    [photoButton setClipsToBounds:YES];
    [photoButton setAccessibilityIdentifier:@"addPhothButton"];
    [photoButton addTarget:self action:@selector(didClickDetailViewButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:photoButton];
    
    self.photoButton = photoButton;
    
    /* date formatter */
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:self.locale];
    [df setDateFormat:@"yyyy년 MM월 dd일 a HH:mm"];
    
    /* location */
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBestForNavigation];
    [self.locationManager requestWhenInUseAuthorization];
    
    
    self.picker = [[UIImagePickerController alloc] init];
    self.picker.delegate = self;
    self.picker.allowsEditing = YES;
    
    
    if(self.indexPath == nil) {
        [self.locationManager startUpdatingLocation];
        NSLog(@"Write");
        
    } else {
        NSLog(@"Update");
        
        NSString *mainLocation = [[[DataCenter sharedInstance].resultArray objectAtIndex:self.indexPath.row] valueForKey:@"trip_main_location"];
        NSString *subLocation  = [[[DataCenter sharedInstance].resultArray objectAtIndex:self.indexPath.row] valueForKey:@"trip_sub_location"];
        
        self.locationLabel.text     = [NSString stringWithFormat:@"%@, %@", mainLocation, subLocation];
        self.datePicker.date        = [[[DataCenter sharedInstance].resultArray objectAtIndex:self.indexPath.row] valueForKey:@"trip_date"];
        self.dateLabel.text         = [self.dateFormatter stringFromDate:self.datePicker.date];
        self.contentTextView.text   = [[[DataCenter sharedInstance].resultArray objectAtIndex:self.indexPath.row] valueForKey:@"trip_content"];
        self.contentImageView.image = [[[DataCenter sharedInstance].resultArray objectAtIndex:self.indexPath.row] valueForKey:@"trip_image"];
        
        //self.tripInfo
        
        [self.tripInfo setValue:[[[DataCenter sharedInstance].resultArray objectAtIndex:self.indexPath.row] valueForKey:@"trip_index"] forKey:@"trip_index"];
        [self.tripInfo setValue:[[[DataCenter sharedInstance].resultArray objectAtIndex:self.indexPath.row] valueForKey:@"trip_date"] forKey:@"trip_date"];
        [self.tripInfo setValue:[[[DataCenter sharedInstance].resultArray objectAtIndex:self.indexPath.row] valueForKey:@"trip_content"] forKey:@"trip_content"];
        [self.tripInfo setValue:[[[DataCenter sharedInstance].resultArray objectAtIndex:self.indexPath.row] valueForKey:@"trip_image"] forKey:@"trip_image"];
        [self.tripInfo setValue:[[[DataCenter sharedInstance].resultArray objectAtIndex:self.indexPath.row] valueForKey:@"trip_main_location"] forKey:@"trip_main_location"];
        [self.tripInfo setValue:[[[DataCenter sharedInstance].resultArray objectAtIndex:self.indexPath.row] valueForKey:@"trip_sub_location"] forKey:@"trip_sub_location"];
        //
        //[[DataCenter sharedInstance] updateTripInfo:nil];
    }
    
}

/* Button Click */
- (void)didClickDetailViewButton:(UIButton *)sender {
    
    
    if([sender.accessibilityIdentifier isEqualToString:@"dateButton"]) {
        
        /* Date Button Click */
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.7];
        
        if(![self.dateButton isSelected]) {
            self.dateView.frame = CGRectMake(self.dateView.frame.origin.x, self.dateView.frame.origin.y, self.view.frame.size.width, self.dateView.frame.size.height + 150);
            
            self.dateBorder.frame = CGRectMake(0, self.dateView.frame.size.height-1, self.dateView.frame.size.width, self.dateView.frame.size.height - 1);
            
            self.contentView.frame = CGRectMake(0, self.dateView.frame.origin.y+self.dateView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - (self.dateView.frame.origin.y+self.dateView.frame.size.height));
            
            self.contentTextView.frame = CGRectMake(10, 5,  self.view.frame.size.width-20, self.contentView.frame.size.height-10);
            
            [self.dateButton setSelected:YES];
        } else {
            self.dateView.frame = CGRectMake(self.dateView.frame.origin.x, self.dateView.frame.origin.y, self.view.frame.size.width, self.dateView.frame.size.height - 150);
            
            self.dateBorder.frame = CGRectMake(0, self.dateView.frame.size.height-1, self.dateView.frame.size.width, self.dateView.frame.size.height - 1);
            
            self.contentView.frame = CGRectMake(0, self.dateView.frame.origin.y+self.dateView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - (self.dateView.frame.origin.y+self.dateView.frame.size.height));
            
            self.contentTextView.frame = CGRectMake(10, 5,  self.view.frame.size.width-20, self.contentView.frame.size.height-10);
            
            [self.dateButton setSelected:NO];
        }
        
        [self.contentTextView resignFirstResponder];
        [UIView commitAnimations];
        
    } else if([sender.accessibilityIdentifier isEqualToString:@"addPhothButton"]) {
        
        
        [self.contentTextView resignFirstResponder];
        
        /* Add Photo Button Click */
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *takePhoto = [UIAlertAction actionWithTitle:@"Take a photo" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            [self presentViewController:self.picker animated:YES completion:NULL];
        }];
        
        UIAlertAction *chooseLibrary = [UIAlertAction actionWithTitle:@"Choose from library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            [self presentViewController:self.picker animated:YES completion:NULL];
        }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
        
        [alertController addAction:takePhoto];
        [alertController addAction:chooseLibrary];
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    
    } else if([sender.accessibilityIdentifier isEqualToString:@"locationButton"]) {
    
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager startUpdatingLocation];
    }
}

/* Bar Item Click */
- (void)didClickBarItem:(UIBarButtonItem *)sender {
 
    if([sender.accessibilityIdentifier isEqualToString:@"backItem"]) {
        [self.navigationController popViewControllerAnimated:YES];
    } else if([sender.accessibilityIdentifier isEqualToString:@"doneItem"]) {
        
        //[self.tripInfo setValue:@NO                       forKey:@"trip_like"];
        [self.tripInfo setValue:self.datePicker.date      forKey:@"trip_date"];
        [self.tripInfo setValue:self.contentTextView.text forKey:@"trip_content"];
        
        if(self.indexPath == nil) {
            [[DataCenter sharedInstance] saveTripInfo:self.tripInfo];
        } else {
            [[DataCenter sharedInstance] updateTripInfo:self.tripInfo];
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/* Date Picker Value Change */
- (void)didChangeValueWithDatePicker:(UIDatePicker *)sender {
    if([[sender accessibilityIdentifier] isEqualToString:@"datePicker"]) {
        
        [self.contentTextView resignFirstResponder];
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setLocale:self.locale];
        [df setDateFormat:@"yyyy년 MM월 dd일 a HH:mm"];
        
        self.dateLabel.text = [df stringFromDate:self.datePicker.date];
    }
}

/* KeyBoard Show or Hide Notification */
- (void)didContentTextViewChange:(NSNotification *)sender {
    
    CGRect keyboardRect = [[sender.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    if([sender.name isEqualToString:@"UIKeyboardWillShowNotification"] ) {
        
        self.contentButtonY = self.photoButton.frame.origin.y;
        
        if([self.dateButton isSelected]) {
            self.dateView.frame = CGRectMake(self.dateView.frame.origin.x, self.dateView.frame.origin.y, self.view.frame.size.width, self.dateView.frame.size.height - 150);
            
            self.dateBorder.frame = CGRectMake(0, self.dateView.frame.size.height-1, self.dateView.frame.size.width, self.dateView.frame.size.height - 1);
            
            self.contentView.frame = CGRectMake(0, self.dateView.frame.origin.y+self.dateView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - (self.dateView.frame.origin.y+self.dateView.frame.size.height));
            
            
            [self.dateButton setSelected:NO];
        }
        
        self.photoButton.frame = CGRectMake(self.photoButton.frame.origin.x,
                                            self.photoButton.frame.origin.y - keyboardRect.size.height,
                                            self.photoButton.frame.size.width,
                                            self.photoButton.frame.size.height);
        
        self.contentTextView.frame = CGRectMake(10, 5,  self.view.frame.size.width-20, self.contentView.frame.size.height-10-keyboardRect.size.height);

        
    } else if([sender.name isEqualToString:@"UIKeyboardWillHideNotification"] ) {
        
        self.photoButton.frame = CGRectMake(self.photoButton.frame.origin.x,
                                            self.contentButtonY,
                                            self.photoButton.frame.size.width,
                                            self.photoButton.frame.size.height);
        
        self.contentTextView.frame = CGRectMake(10, 5,  self.view.frame.size.width-20, self.contentView.frame.size.height-10);
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    /*
     [self.contentTextView setBackgroundColor:[UIColor colorWithPatternImage:info[UIImagePickerControllerEditedImage]]];
     */
    
    // 촬영한 이미지를 ImageView로 전달해서 표시한다
    UIImage* image = (UIImage*)[info objectForKey:UIImagePickerControllerEditedImage];
    self.contentImageView.image = image;
    
    // 저장할 이미지와 완료 시에 호출되는 메서드를 전달한다
    //UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
    [self.tripInfo setValue:image forKey:@"trip_image"];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 저장 완료 시에 호출되는 메서드
- (void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo {
    if (error) {
        // 저장 실패의 사용자 처리
    } else {
        // 저장 성공의 사용자 처리
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


/* Location Delegate */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    for (CLLocation *location in locations) {
        CLLocationCoordinate2D coordinate = location.coordinate;
        
        [self.tripInfo setValue:[NSString stringWithFormat:@"%lf", coordinate.latitude] forKey:@"trip_location_latitude"];
        [self.tripInfo setValue:[NSString stringWithFormat:@"%lf", coordinate.longitude] forKey:@"trip_location_longitude"];
    }
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:self.locationManager.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        for (CLPlacemark *placemark in placemarks) {
            
            self.locationLabel.text = [NSString stringWithFormat:@"%@, %@", [placemark.addressDictionary objectForKey:@"State"], [placemark.addressDictionary objectForKey:@"Street"]];
            
            [self.tripInfo setValue:[placemark.addressDictionary objectForKey:@"State"]  forKey:@"trip_main_location"];
            [self.tripInfo setValue:[placemark.addressDictionary objectForKey:@"Street"] forKey:@"trip_sub_location"];
            
            [self.tripInfo setValue:[placemark.addressDictionary objectForKey:@"State"]  forKey:@"trip_main_location"];
            [self.tripInfo setValue:[placemark.addressDictionary objectForKey:@"Street"] forKey:@"trip_sub_location"];
        
            /*
            NSLog(@"%@", [placemark.addressDictionary objectForKey:@"City"]);
            NSLog(@"%@", [placemark.addressDictionary objectForKey:@"Country"]);
            NSLog(@"%@", [placemark.addressDictionary objectForKey:@"CountryCode"]);
            NSLog(@"%@", [placemark.addressDictionary objectForKey:@"FormattedAddressLines"]);
            NSLog(@"%@", [placemark.addressDictionary objectForKey:@"Name"]);
            NSLog(@"%@", [placemark.addressDictionary objectForKey:@"State"]);
            NSLog(@"%@", [placemark.addressDictionary objectForKey:@"Street"]);
            NSLog(@"%@", [placemark.addressDictionary objectForKey:@"SubLocality"]);
            NSLog(@"%@", [placemark.addressDictionary objectForKey:@"SubThoroughfare"]);
            NSLog(@"%@", [placemark.addressDictionary objectForKey:@"Thoroughfare"]);
            */
        }
    }];
    
    [self.locationManager stopUpdatingLocation];
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
