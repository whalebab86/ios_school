//
//  ViewController.m
//  Example
//
//  Created by BongKi Cho on 2017. 1. 16..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.questions = @[@"Firsr Question",
                       @"Second Question",
                       @"Third Question"];
    
    self.answers = @[@"Firsr Answer",
                     @"Second Answer",
                     @"Third Answer"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction) showQuestion: (id)sender {
    self.currentQuestionIndex++;
    
    if(self.currentQuestionIndex == [self.questions count]) {
        self.currentQuestionIndex = 0;
    }
    
    NSString *question = self.questions[self.currentQuestionIndex];
    
    self.questionLB.text = question;
    
    self.answerLB.text = @"???";
}

- (IBAction) showAnswer: (id)sender {
    
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    self.answerLB.text = answer;
}

@end
