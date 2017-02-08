//
//  ViewController.m
//  clashRoyale
//
//  Created by CLAY on 2017. 2. 4..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import "ViewController.h"
#import "CardCollection.h"
#import "CardUnitInfo.h"

@interface ViewController () <UITextFieldDelegate, UIScrollViewDelegate>

@property NSInteger gold;
@property NSInteger gem;

@property UILabel *goldLabel;
@property UILabel *gemLabel;

@property NSMutableDictionary *allUnitInfo;
@property NSMutableArray *scrollArry;
@property NSMutableArray *pageControlArry;

@property UITextField *loginPwTextField;
@property UIScrollView *loginScrollView;
@property UIView *loginContentView;

@property UIPageControl *pageController;
@property NSInteger pageNumber;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    //
    //
    //    UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 2, self.view.frame.size.height)];
    //    [firstView setBackgroundColor:[UIColor blueColor]];
    //    [self.view addSubview:firstView];
    //
    //    UIView *secondView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //    [secondView1 setBackgroundColor:[UIColor redColor]];
    //    [firstView addSubview:secondView1];
    //
    //    UIView *secondView2 = [[UIView alloc] initWithFrame:CGRectMake(0, secondView1.frame.size.width, self.view.frame.size.width, self.view.frame.size.height)];
    //    [secondView2 setBackgroundColor:[UIColor redColor]];
    //    [firstView addSubview:secondView2];
    //
    
    
    //
    //    UIView *secondView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //    [secondView1 setBackgroundColor:[UIColor redColor]];
    //    [firstView addSubview:secondView1];
    
    
    
    /*
     UIView *secondView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
     [secondView1 setBackgroundColor:[UIColor blueColor]];
     [controller addSubview:secondView1];
     [controller updateCurrentPageDisplay];
     
     UIView *secondView2 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.width, self.view.frame.size.width, self.view.frame.size.height)];
     [secondView1 setBackgroundColor:[UIColor grayColor]];
     [controller addSubview:secondView2];
     [controller updateCurrentPageDisplay];
     */
    
    
    /*
     UIPageControl *controller = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
     [controller setBackgroundColor:[UIColor redColor]];
     
     [self.view addSubview:controller];
     
     UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
     [firstView setBackgroundColor:[UIColor blueColor]];
     //[controller addSubview:firstView];
     
     UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
     [secondView setBackgroundColor:[UIColor redColor]];
     //[controller addSubview:secondView];
     
     [controller setNumberOfPages:2];
     [controller updateCurrentPageDisplay];
     */
    
    /*
     CGFloat width  = self.view.frame.size.width;
     CGFloat height = self.view.frame.size.height;
     
     // View
     UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
     [mainView setBackgroundColor:[UIColor grayColor]];
     
     [controller addSubview:mainView];
     
     // Top Label
     UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, width, 30)];
     [titleLabel setText:@"Login"];
     [titleLabel setTextAlignment:NSTextAlignmentCenter];
     
     [self.view addSubview:titleLabel];
     
     // ScrollView
     self.loginScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 200, width, 170)];
     [self.loginScrollView setBackgroundColor:[UIColor blackColor]];
     [self.loginScrollView setScrollEnabled:NO];
     [mainView addSubview:self.loginScrollView];
     
     // Login Content View
     self.loginContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 200)];
     [self.loginContentView setBackgroundColor:[UIColor blueColor]];
     [self.loginScrollView addSubview:self.loginContentView];
     
     // ScrollView contentSize
     [self.loginScrollView setContentSize:CGSizeMake(self.loginContentView.frame.size.width, self.loginContentView.frame.size.height)];
     
     // Login ID Label
     UILabel *loginIdLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, width/4, 30)];
     [loginIdLabel setText:@"ID : "];
     [loginIdLabel setTextAlignment:NSTextAlignmentRight];
     [loginIdLabel setFont:[UIFont boldSystemFontOfSize:12]];
     //    [loginIdLabel setBackgroundColor:[UIColor blackColor]];
     [self.loginContentView addSubview:loginIdLabel];
     
     // Login ID TextField
     UITextField *loginIdTextField = [[UITextField alloc] initWithFrame:CGRectMake(loginIdLabel.frame.size.width+10, loginIdLabel.frame.origin.y, (width/4)*3-20, 30)];
     [loginIdTextField setBorderStyle:UITextBorderStyleRoundedRect];
     [loginIdTextField setTag:10];
     [loginIdTextField setDelegate:self];
     [self.loginContentView addSubview:loginIdTextField];
     
     // Login PW Label
     UILabel *loginPwLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, width/4, 30)];
     [loginPwLabel setText:@"PW : "];
     [loginPwLabel setTextAlignment:NSTextAlignmentRight];
     [loginIdLabel setFont:[UIFont boldSystemFontOfSize:12]];
     [self.loginContentView addSubview:loginPwLabel];
     
     
     // Login PW TextField
     self.loginPwTextField = [[UITextField alloc] initWithFrame:CGRectMake(loginIdLabel.frame.size.width+10, loginPwLabel.frame.origin.y, (width/4)*3-20, 30)];
     [self.loginPwTextField setBorderStyle:UITextBorderStyleRoundedRect];
     [self.loginPwTextField setTag:11];
     [self.loginPwTextField setDelegate:self];
     [self.loginPwTextField setSecureTextEntry:YES];
     [self.loginContentView addSubview:self.loginPwTextField];
     
     
     // Login Button
     UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
     [loginBtn setFrame:CGRectMake(self.loginPwTextField.frame.origin.x, self.loginPwTextField.frame.origin.y + 5 + self.loginPwTextField.frame.size.height, self.loginPwTextField.frame.size.width / 2 - 5, 30)];
     [loginBtn setTitle:@"Log in" forState:UIControlStateNormal];
     [loginBtn setBackgroundColor:[UIColor redColor]];
     [self.loginContentView addSubview:loginBtn];
     
     // SignUp Button
     // Login Button
     UIButton *signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
     [signBtn setFrame:CGRectMake(self.loginPwTextField.frame.origin.x + loginBtn.frame.size.width + 5, self.loginPwTextField.frame.origin.y + 5 + self.loginPwTextField.frame.size.height, self.loginPwTextField.frame.size.width / 2, 30)];
     [signBtn setTitle:@"Sign Up" forState:UIControlStateNormal];
     [signBtn setBackgroundColor:[UIColor redColor]];
     [self.loginContentView addSubview:signBtn];
     */
    
    NSString *temp = @"asdas";
    
    
    [self drawClayLoyaleView];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [self.loginScrollView setContentOffset:CGPointMake(0, 20) animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    [self.loginScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if([textField tag] == 10){
        [self.loginPwTextField becomeFirstResponder];
    } else if([textField tag] == 11){
        [textField resignFirstResponder];
    }
    
    return YES;
}

- (void)drawClayLoyaleView {
    NSInteger viewWidth  = self.view.frame.size.width;
    NSInteger viewHeight = self.view.frame.size.height;
    
    NSInteger topHeight = 45;
    NSInteger bottomHeight = 100;
    
    // 상단 골드 및 보석 디스플레이 영역;
    UIView *topArea = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, topHeight)];
    topArea.backgroundColor = [UIColor colorWithRed:176/255.0 green:196/255.0 blue:220/255.0 alpha:1];
    [self.view addSubview:topArea];
    
    // 상단 골드 영역
    UIView *topGoldArea = [[UIView alloc] initWithFrame:CGRectMake((viewWidth/3) * 1, 20, viewWidth/3-15, 20)];
    topGoldArea.backgroundColor = [UIColor blackColor];
    [self.view addSubview:topGoldArea];
    
    // 상단 골드 영역 Label
    self.goldLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, topGoldArea.frame.size.width - 15, 20)];
    self.goldLabel.text = @"0";
    self.goldLabel.textAlignment = NSTextAlignmentRight;
    self.goldLabel.textColor = [UIColor whiteColor];
    self.goldLabel.font = [UIFont boldSystemFontOfSize:12];
    [topGoldArea addSubview:self.goldLabel];
    
    // 상단 골드 영역 마스크 View
    UIView *topGoldMaskArea = [[UIView alloc] initWithFrame:CGRectMake(0, 0, topGoldArea.frame.size.width, topGoldArea.frame.size.height/2 - 5)];
    topGoldMaskArea.backgroundColor = [UIColor grayColor];
    topGoldMaskArea.alpha = 0.4;
    [topGoldArea addSubview:topGoldMaskArea];
    
    // 상단 골드 영역 ImageView
    UIImageView *goldImg = [[UIImageView alloc] initWithFrame:CGRectMake((viewWidth/3)-27, -2, 23, 25)];
    goldImg.image = [UIImage imageNamed:@"image/Gold/Gold.png"];
    [topGoldArea addSubview:goldImg];
    
    // 상단 보석 영역
    UIView *topGemArea = [[UIView alloc] initWithFrame:CGRectMake((viewWidth/3) * 2, 20, viewWidth/3-15, 20)];
    topGemArea.backgroundColor = [UIColor blackColor];
    [self.view addSubview:topGemArea];
    
    // 상단 보석 영역 Label
    self.gemLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, topGoldArea.frame.size.width - 15, 20)];
    self.gemLabel.text = @"0";
    self.gemLabel.textAlignment = NSTextAlignmentRight;
    self.gemLabel.textColor = [UIColor whiteColor];
    self.gemLabel.font = [UIFont boldSystemFontOfSize:12];
    [topGemArea addSubview:self.gemLabel];
    
    // 상단 보석 영역 마스크 View
    UIView *topGemMaskArea = [[UIView alloc] initWithFrame:CGRectMake(0, 0, topGoldArea.frame.size.width, topGoldArea.frame.size.height/2 - 5)];
    topGemMaskArea.backgroundColor = [UIColor grayColor];
    topGemMaskArea.alpha = 0.4;
    [topGemArea addSubview:topGemMaskArea];
    
    // 상단 보석 영역 ImageView
    UIImageView *gemImg = [[UIImageView alloc] initWithFrame:CGRectMake((viewWidth/3)-27, -2, 23, 25)];
    gemImg.image = [UIImage imageNamed:@"image/Gem/Gem.png"];
    [topGemArea addSubview:gemImg];
    
    // 중단 유닛 디스플레이 영역 높이 : View;
    UIScrollView *midArea = [[UIScrollView alloc] initWithFrame:CGRectMake(0, topHeight, viewWidth, viewHeight-(topHeight+bottomHeight))];
    midArea.backgroundColor = [UIColor colorWithRed:176/255.0 green:196/255.0 blue:220/255.0 alpha:1];
    [self.view addSubview:midArea];
    
    /* 중단 Scroll Start */
    
    CardCollection *cardInfo = [[CardCollection alloc] initWithCardInfo];
    // 중단 Scroll - UnitView
    
    /* Unit Start == */
    CGFloat unitScrollPointY = 255;
    NSArray *gradArry = @[@"c", @"r", @"e", @"l"];
    self.allUnitInfo = [NSMutableDictionary dictionary];
    for(NSInteger g=0; g<[gradArry count]; g++){
        
        NSInteger hScrollWidth  = 0;
        NSInteger hScrollHeight = 0;
        
        UIView *unitTitle = [[UIView alloc] initWithFrame:CGRectMake(0, unitScrollPointY * g, viewWidth, 27.5)];
        unitTitle.backgroundColor = [UIColor colorWithRed:162/255.0 green:161/255.0 blue:156/255.0 alpha:1];
        
        [midArea addSubview:unitTitle];
        
        UILabel *unitTitleText = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, viewWidth, 27.5)];
        if( [[gradArry objectAtIndex:g] isEqualToString:@"c"]) unitTitleText.text = @"Common";
        if( [[gradArry objectAtIndex:g] isEqualToString:@"r"]) unitTitleText.text = @"Rare";
        if( [[gradArry objectAtIndex:g] isEqualToString:@"e"]) unitTitleText.text = @"Epic";
        if( [[gradArry objectAtIndex:g] isEqualToString:@"l"]) unitTitleText.text = @"Legendary";
        [unitTitle addSubview:unitTitleText];
        
        UIScrollView *unitScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, unitScrollPointY * g + 27.5, viewWidth, unitScrollPointY)];
        unitScroll.delegate = self;
        [unitScroll setPagingEnabled:YES];
        
        unitScroll.tag = 500 + g;
        
        [self.scrollArry addObject:unitScroll];
        
        [midArea addSubview:unitScroll];
        
        NSArray *unitArry;
        switch (g) {
            case 0:
                unitArry = [cardInfo nomalCardArry];
                break;
                
            case 1:
                unitArry = [cardInfo rareCardArry];
                break;
                
            case 2:
                unitArry = [cardInfo epicCardArry];
                break;
                
            case 3:
                unitArry = [cardInfo legendaryCardArry];
                break;
                
            default:
                break;
        }
        
        for(NSInteger i=0; i<[unitArry count]; i++) {
            CardUnitInfo *info = [[CardUnitInfo alloc] initWithGrade:[gradArry objectAtIndex:g]];
            
            info.mainView = [info drawUnitAreaWidhGrade:[NSString stringWithFormat:@"%@", [gradArry objectAtIndex:g]] unitName:[unitArry objectAtIndex:i]];
            info.mainView.frame = CGRectMake(info.mainView.frame.size.width * i + (5 * i) + 5, 5, info.mainView.frame.size.width, info.mainView.frame.size.height);
            [info.unitImage addTarget:self action:@selector(didClickBottomBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            [unitScroll setDelegate:self];
            [unitScroll addSubview:info.mainView];
            
            
            [self.allUnitInfo setValue:info forKey:[NSString stringWithFormat:@"%@_%@", [gradArry objectAtIndex:g], [unitArry objectAtIndex:i]]];
            
            hScrollWidth += info.mainView.frame.size.width + 5;
            hScrollHeight = info.mainView.frame.size.height;
        }
        unitScroll.contentSize = CGSizeMake(hScrollWidth+5, hScrollHeight);
        
        //if( g == 0) {
        
        
        /*
            self.pageController = [[UIPageControl alloc] initWithFrame:CGRectMake(unitTitle.frame.origin.x,
                                                                                  50,
                                                                                  self.view.frame.size.width,
                                                                                  unitTitleText.frame.size.height)];
            
            NSInteger pageCount =  ([unitScroll contentSize].width / self.view.frame.size.width) +1;
            [self.pageController setNumberOfPages:pageCount];
            
            [self.pageController addTarget:self action:@selector(didClickMiddlePageControl:) forControlEvents:UIControlEventValueChanged];
            
            [self.view addSubview:self.pageController];
        */
        //}
        
        UIPageControl *pageController = [[UIPageControl alloc] initWithFrame:CGRectMake(0,
                                                                                        unitTitle.frame.origin.y + topArea.frame.size.height,
                                                                                        self.view.frame.size.width,
                                                                                        unitTitleText.frame.size.height)];
        
        NSInteger pageCount =  ([unitScroll contentSize].width / self.view.frame.size.width) +1;
        [pageController setNumberOfPages:pageCount];
        [pageController setTag:600+g];
        
        [pageController addTarget:self action:@selector(didClickMiddlePageControl:) forControlEvents:UIControlEventValueChanged];
        
        [self.view addSubview:pageController];
        
        [self.pageControlArry addObject:pageController];
    }
    midArea.contentSize = CGSizeMake(self.view.frame.size.width, unitScrollPointY*4);
    /* Unit End == */
    
    /* 중단 Scroll End */
    
    // 하단 골드 및 보석 구입 영역 높이 : 150;
    UIView *bottomArea = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - bottomHeight, self.view.frame.size.width, bottomHeight)];
    bottomArea.backgroundColor = [UIColor colorWithRed:176/255.0 green:196/255.0 blue:220/255.0 alpha:1];
    //bottomArea.layer.borderWidth = 2;
    //bottomArea.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:bottomArea];
    
    NSInteger margin = 4;
    NSInteger offsetX = 0;
    
    UIButton *goldFirst = [cardInfo drawCashAreaWithImageName:@"image/Gold/1000_gold.jpg"];
    goldFirst.frame = CGRectMake(margin, margin, goldFirst.frame.size.width, goldFirst.frame.size.height);
    [bottomArea addSubview:goldFirst];
    [goldFirst addTarget:self action:@selector(didClickBottomBtn:) forControlEvents:UIControlEventTouchUpInside];
    goldFirst.tag = 31;
    
    UILabel *goldFirstLabel = [[UILabel alloc] initWithFrame:CGRectMake(3, goldFirst.frame.size.height-22, goldFirst.frame.size.width-2, 20)];
    goldFirstLabel.alpha = 0.9;
    goldFirstLabel.text = @"100 Gem";
    goldFirstLabel.font = [UIFont boldSystemFontOfSize:11];
    goldFirstLabel.textAlignment = NSTextAlignmentCenter;
    [goldFirst addSubview:goldFirstLabel];
    
    offsetX += goldFirst.frame.size.width;
    
    UIButton *goldSecond = [cardInfo drawCashAreaWithImageName:@"image/Gold/10000_gold.jpg"];
    goldSecond.frame = CGRectMake(margin*2 + offsetX, margin, goldFirst.frame.size.width, goldFirst.frame.size.height);
    [bottomArea addSubview:goldSecond];
    [goldSecond addTarget:self action:@selector(didClickBottomBtn:) forControlEvents:UIControlEventTouchUpInside];
    goldSecond.tag = 32;
    
    UILabel *goldSecondLabel = [[UILabel alloc] initWithFrame:CGRectMake(3, goldSecond.frame.size.height-22, goldSecond.frame.size.width-2, 20)];
    goldSecondLabel.alpha = 0.9;
    goldSecondLabel.text = @"1000 Gem";
    goldSecondLabel.font = [UIFont boldSystemFontOfSize:11];
    goldSecondLabel.textAlignment = NSTextAlignmentCenter;
    [goldSecond addSubview:goldSecondLabel];
    
    offsetX += goldSecond.frame.size.width;
    
    UIButton *goldThird = [cardInfo drawCashAreaWithImageName:@"image/Gold/100000_gold.jpg"];
    goldThird.frame = CGRectMake(margin*3 + offsetX, margin, goldFirst.frame.size.width, goldFirst.frame.size.height);
    [bottomArea addSubview:goldThird];
    [goldThird addTarget:self action:@selector(didClickBottomBtn:) forControlEvents:UIControlEventTouchUpInside];
    goldThird.tag = 33;
    offsetX += goldThird.frame.size.width;
    
    UILabel *goldThirdLabel = [[UILabel alloc] initWithFrame:CGRectMake(3, goldThird.frame.size.height-22, goldThird.frame.size.width-2, 20)];
    goldThirdLabel.alpha = 0.9;
    goldThirdLabel.text = @"10000 Gem";
    goldThirdLabel.font = [UIFont boldSystemFontOfSize:11];
    goldThirdLabel.textAlignment = NSTextAlignmentCenter;
    [goldThird addSubview:goldThirdLabel];
    
    UIButton *gemFirst = [cardInfo drawCashAreaWithImageName:@"image/Gem/500_gem.jpg"];
    gemFirst.frame = CGRectMake(margin*4 + offsetX, margin, goldFirst.frame.size.width, goldFirst.frame.size.height);
    [bottomArea addSubview:gemFirst];
    [gemFirst addTarget:self action:@selector(didClickBottomBtn:) forControlEvents:UIControlEventTouchUpInside];
    gemFirst.tag = 34;
    offsetX += gemFirst.frame.size.width;
    
    UIButton *gemSecond = [cardInfo drawCashAreaWithImageName:@"image/Gem/1200_gem.jpg"];
    gemSecond.frame = CGRectMake(margin*5 + offsetX, margin, goldFirst.frame.size.width, goldFirst.frame.size.height);
    [bottomArea addSubview:gemSecond];
    [gemSecond addTarget:self action:@selector(didClickBottomBtn:) forControlEvents:UIControlEventTouchUpInside];
    gemSecond.tag = 35;
    offsetX += gemSecond.frame.size.width;
}

- (void)didClickBottomBtn:(UIButton *) sender{
    
    NSString *unitImageName = [sender accessibilityIdentifier];
    CardUnitInfo *info = [self.allUnitInfo objectForKey:[NSString stringWithFormat:@"%@", unitImageName]];
    
    switch (sender.tag) {
        case 31:
            if( self.gem >= 100) {
                self.gold += 1000;
                self.gem  -= 100;
            }
            break;
            
        case 32:
            if( self.gem >= 1000) {
                self.gold += 10000;
                self.gem  -= 1000;
            }
            break;
            
        case 33:
            if( self.gem >= 10000) {
                self.gold += 100000;
                self.gem  -= 10000;
            }
            break;
            
        case 34:
            if (self.gem + 500 <= 99999) {
                self.gem += 500;
            } else {
                self.gem = 99999;
            }
            break;
            
        case 35:
            if (self.gem + 1200 <= 99999) {
                self.gem += 1200;
            } else {
                self.gem = 99999;
            }
            break;
            
        default:
            if(self.gold >= info.unitGradePrice && info.maxCount > info.currentCount) {
                info.currentCount += 1;
                self.gold -= info.unitGradePrice;
                
                NSInteger maskWidth = (info.unitCount.frame.size.width / info.maxCount) * info.currentCount;
                
                info.unitCountMaskView.frame = CGRectMake(0, 0, maskWidth, info.unitCountMaskView.frame.size.height);
                
                [info.unitCount setText:[NSString stringWithFormat:@"%ld/%ld", info.currentCount, info.maxCount]];
            }
            break;
    }
    
    self.goldLabel.text = [NSString stringWithFormat:@"%ld", self.gold];
    self.gemLabel.text  = [NSString stringWithFormat:@"%ld", self.gem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didClickMiddlePageControl:(UIPageControl *) sender{
    
    UIScrollView *control;
    
    if(sender.currentPage == 600) control = [self.pageControlArry objectAtIndex:0];
    if(sender.currentPage == 601) control = [self.pageControlArry objectAtIndex:1];
    if(sender.currentPage == 602) control = [self.pageControlArry objectAtIndex:2];
    if(sender.currentPage == 603) control = [self.pageControlArry objectAtIndex:3];
        
    CGPoint size = CGPointMake(sender.currentPage * self.view.frame.size.width , 0);
    [control setContentOffset:size animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    UIPageControl *control;
    
    if(scrollView.tag == 500)   control = [self.scrollArry objectAtIndex:0];
    if(scrollView.tag == 501)   control = [self.scrollArry objectAtIndex:1];
    if(scrollView.tag == 502)   control = [self.scrollArry objectAtIndex:2];
    if(scrollView.tag == 503)   control = [self.scrollArry objectAtIndex:3];
    
    NSInteger page = ( scrollView.contentOffset.x / self.view.frame.size.width);
    
    control.currentPage = page;
}



@end
