//
//  PostDetailViewController.m
//  LoginNetwork
//
//  Created by CLAY on 2017. 3. 17..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import "PostDetailViewController.h"

#import "PostInfo.h"

#import "DataCenter.h"

@interface PostDetailViewController ()
<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *postImageButton;
@property (weak, nonatomic) IBOutlet UITextField *postTitlTextField;
@property (weak, nonatomic) IBOutlet UITextView *postContentTextView;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;

@property (nonatomic) PostInfo *info;

@end

@implementation PostDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.info = [[PostInfo alloc] init];
    
    if(![self.pk isEqual:[NSNull null]] && self.pk != nil ) {
        [self PostRetrieveWithPk:self.pk];
    } else {
        self.postTitlTextField.placeholder = @"Content Title";
    }
}


-(void)PostRetrieveWithPk:(NSString *)pk {
    
    [self startIndicatorViewWithIsSubmit:YES];
    [[DataCenter sharedInstance] PostRetrieve:pk competionBlock:^(BOOL isSuccess, NSObject *result) {
        
        if(isSuccess) {
            
            NSString *imgCover = [((NSDictionary *)result) objectForKey:@"img_cover"];
            
            /* Image Download */
            if(![imgCover isEqual:[NSNull null]]) {
                NSURL *url = [NSURL URLWithString:imgCover];
                NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
                
                NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                    
                    if(error == nil && ![data isEqual:[NSNull null]]) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            self.postImageView.image = [UIImage imageWithData:data];
                            self.postTitlTextField.text = [((NSDictionary *)result) objectForKey:@"title"];
                            self.postContentTextView.text = [((NSDictionary *)result) objectForKey:@"content"];
                            
                            [self stopIndicatorView];
                        });
                    }
                }];
                
                [task resume];
            }
            /* Image Download */
        }
    }];
}


- (IBAction)didClickSaveButton:(id)sender {
    
    self.info.title = self.postTitlTextField.text;
    self.info.content = self.postContentTextView.text;
    
    [[DataCenter sharedInstance] PostCreate:self.info completionBlock:^(BOOL isSuccess, NSObject *result) {
        if(isSuccess) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
        }
    }];
}

- (IBAction)didClickAddButton:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController *cameraController = [[UIImagePickerController alloc] init];
//        cameraController.sourceType = UIImagePickerControllerSourceTypeCamera;
        cameraController.allowsEditing = NO;
        cameraController.delegate = self;
        
        cameraController.mediaTypes
        = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeCamera];
        
        [self presentViewController:cameraController animated:YES completion:nil];
    }];
    
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController *cameraController = [[UIImagePickerController alloc] init];
        cameraController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        cameraController.allowsEditing = NO;
        cameraController.delegate = self;
        
        cameraController.mediaTypes
        = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypePhotoLibrary];
        
        [self presentViewController:cameraController animated:YES completion:nil];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:cameraAction];
    [alert addAction:photoAction];
    
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *takenImage;
    
    takenImage = (UIImage *) [info objectForKey: UIImagePickerControllerOriginalImage];
    
    self.postImageView.image = takenImage;
    
    self.info.img_data = UIImageJPEGRepresentation(takenImage, 0.5);
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

@end
