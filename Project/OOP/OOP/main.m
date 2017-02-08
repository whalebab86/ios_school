//
//  main.m
//  WarCraft
//
//  Created by BongKi Cho on 2017. 1. 18..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Horde.h"
#import "Alliance.h"

#import "Person.h"
#import "Student.h"
#import "UniversityStudent.h"

#import "People.h"
#import "Bank.h"
#import "Man.h"
#import "Woman.h"

#import "Calculator.h"

#import "FigureArea.h"
#import "FigurePerimeter.h"
#import "FigureCircumference.h"
#import "FigureVolume.h"

#import "ToolBox.h"

#import "RemindPerson.h"
#import "Developer.h"
#import "Designer.h"
#import "Teacher.h"

#import "PracticeProblem.h"

#import "Iteration.h"
int main() {
    
    /* WarCraft
    Horde *horde    = [[Horde alloc] initWithName:100 withAp:40 withSp:20];
    
    //[horde setDefaultHp:100 withAp:40 withSp:20];
    
    horde.name = @"호드";
    horde.def = 5;
    
    Alliance *alliance = [[Alliance alloc] initWithName:100 withAp:20 withSp:40];
    [alliance setDefaultHp:100 withAp:40 withSp:20];
    alliance.name = @"얼라이언스";
    alliance.def = 5;
    
    GameCharacter *gameCharcter = [[GameCharacter alloc] init];
    
    gameCharcter.name = @"Game Character";
    
    [gameCharcter jumpTo:gameCharcter];
    [horde jumpTo:alliance];
    [alliance jumpTo:horde];
    
    [horde pygicalAttackTarget:alliance];
    [horde pygicalAttackTarget:alliance];
    [horde magicalAttackTarget:alliance];
    [horde magicalAttackTarget:alliance];
    
    [alliance magicalAttackTarget:horde];
    [alliance magicalAttackTarget:horde];
    [alliance magicalAttackTarget:horde];
    
    //NSLog(@"AP Info : %lu", horde.ap);
    NSLog(@"AP Info : %lu", [horde showApInfo]);
    NSLog(@"AP Info : %lu", [alliance showApInfo]);
    */
     
    /* Person
     Person *person   = [[NSLog(@"AP Info : %lu", [horde showApInfo]); alloc] init];
     [person eat];
     
     Student *student = [[Student alloc] init];
     [student eat];
     
     UniversityStudent *universityStudent = [[UniversityStudent alloc] init];
     [universityStudent eat];
     */
    
    
    /* Bank
    Bank* bank = [[Bank alloc] init];
    Man* man = [[Man alloc] init];
    Woman* woman = [[Woman alloc] init];
    
    bank.bankName = @"캠퍼스뱅크";
    bank.bankLocation = @"신사역";
    
    man.name = @"Man";
    man.asset = 0;
    
    woman.name = @"Woman";
    woman.asset = 0;
    
    [man insertAssetWitnBank:bank withAssetInfo:500];
    [woman insertAssetWitnBank:bank withAssetInfo:700];
    
    [man seleftAssetInfo:bank];
    [woman seleftAssetInfo:bank];
    
    
    [bank updateBankLocation:@"제주도"];
    
    [bank updateAssetInfo:500 withFrom:man withTo:woman];
    
    [man seleftAssetInfo:bank];
    [woman seleftAssetInfo:bank];
    */
    
    //Calculator *cal = [[Calculator alloc] initWithScore:100 withHistory:90 withScience:85 withKorean:95];
    
    //NSUInteger addValue = [cal addClassScoreWithMath:100 withHistory:90 withScience:85 withKorean:95];
    //NSUInteger avgValue = [cal avgClassScoreWithMath:100 withHistory:90 withScience:85 withKorean:95];
    
//    NSLog(@"addValue = %lu", [cal addClassScore]);
//    NSLog(@"avgValue = %lu", [cal avgClassScore]);
//    
//    FigureArea *area = [[FigureArea alloc] initWithSquareWithS:3];
//    NSLog(@"정사각형 넓이 %lf", [area squareAreaWithS]);
//    [area setFigureValueL:8];
//    NSLog(@"직사각형 넓이 %lf", [area rectangleAreaWithS]);
//    NSLog(@"원       넓이 %lf", [area circleAreaWithR]);
//    NSLog(@"삼각형   넓이 %lf", [area triangleAreaWithB]);
//    NSLog(@"마름모   넓이 %lf", [area trapezoidAreaWithA]);
//    
//    FigurePerimeter * perimeter = [[FigurePerimeter alloc] init];
//    NSLog(@"정사각형 둘레 %lf", [perimeter squarePerimeterWithS]);
//    NSLog(@"직사각형 둘레 %lf", [perimeter RectanglePerimeterWithL]);
//    
//    FigureCircumference * circumference = [[FigureCircumference alloc] init];
//    NSLog(@"원       둘레 %lf", [circumference circleCirumferenceWithR]);
//    
//    FigureVolume * volumn = [[FigureVolume alloc] init];
//    NSLog(@"정사각체 부피 %lf", [volumn cubeVolumeWithS]);
//    NSLog(@"직사각체 부피 %lf", [volumn RectangulrSolidVolumeWithL]);
//    NSLog(@"원통     부피 %lf", [volumn circularVolumeWithR]);
//    NSLog(@"원형     부피 %lf", [volumn sphereVolumeWithR]);
//    NSLog(@"뿔       부피 %lf", [volumn coneVolumeWithR]);
//    
//    
//    NSLog(@"%f", [ToolBox inchToCm:3]);
//    NSLog(@"%f", [ToolBox cmToInch:15]);
//    
//    NSLog(@"%f", [ToolBox m2ToPyeong:3]);
//    NSLog(@"%f", [ToolBox pyeongTom2:15]);
//    
//    NSLog(@"%f", [ToolBox fahrenheitToCelsius:3]);
//    NSLog(@"%f", [ToolBox celsiusToFahrenheit:15]);
    
//    RemindPerson *person = [[RemindPerson alloc] initWithName:@"홍길동" withAge:30 withJob:@"개발자" withBirthDay:@"19861018"];
//    
//    [person settingWithJob:@"건물주"];
//    
//    Boolean resultN = [person isYourBirthDay:@"19871018"];
//    Boolean resultY = [person isYourBirthDay:@"19861018"];
//    
//    NSLog(@"resultN : %hhd", resultN);
//    NSLog(@"resultY : %hhd", resultY);
//    
//    NSLog(@"resultN : %@", person.job);
//    [person conference];
//    
//    Developer *developer =  [[Developer alloc] init];
//    
//    developer.job = @"Developer";
//    
//    [developer conference];
//    [developer develop];
//    [developer test];
//    
//    Designer *designer = [[Designer alloc] init];
//    [designer conference];
//    [designer design];
//    [designer confirm];
//    
// 
//    NSInteger result = [Teacher returnLastDayWithMonth:2];
//    
//    [Teacher scholarshipWithGrade:2];
//    
//    NSLog(@"last Day : %lu", result);
//    
//    NSLog(@"50%@", @"%");
//    
//    
//    BOOL developerResult = [Teacher checkDeveloper:developer];
//    NSLog(@"Developer YN : %hhd", developerResult);
    
    // 1번
//    NSLog(@"%lu", [PracticeProblem absoluteNum:-124]);
//    NSLog(@"%lu", [PracticeProblem absoluteNum:124]);
//    
//    // 2번
//    NSLog(@"%f", [PracticeProblem roundNum:3]);
//    NSLog(@"%f", [PracticeProblem roundNum:3.1]);
//    NSLog(@"%f", [PracticeProblem roundNum:3.9]);
//    NSLog(@"%f", [PracticeProblem roundNum:3.99]);
//    NSLog(@"%f", [PracticeProblem roundNum:3.999]);
////    NSLog(@"%f", [PracticeProblem roundNum:-3.999]);
//    NSLog(@"%f", [PracticeProblem roundNum:3.999]);
//    NSLog(@"%f", [PracticeProblem roundNum:3.459]);
//    NSLog(@"%f", [PracticeProblem roundNum:3.134]);
    
    NSLog(@"%f", [PracticeProblem roundNum:3.14515]);
//    
//    // 3번
//    NSLog(@"%lu", [PracticeProblem calcuOp:@"+" withNum1:10 withNum2:3]);
//    NSLog(@"%lu", [PracticeProblem calcuOp:@"-" withNum1:10 withNum2:3]);
//    NSLog(@"%lu", [PracticeProblem calcuOp:@"-" withNum1:3 withNum2:10]);
    
    //[Iteration googoodanFor:3];
    NSLog(@"%ld", [Iteration factorial:5]);
    //[Iteration googoodan:3];
//    NSString *result = [Iteration findMultipleNum:3 maxLange:30];
//    NSLog(@"%@", result);
//    
//    NSInteger resultNum = [Iteration addAllNum:12345];
//    NSLog(@"%ld", resultNum);
//    
//    NSInteger resultIndex = [Iteration findStart:@"*asd*qwe*"];
//    NSLog(@"%ld", resultIndex);
    
    [Iteration printStartWithCase:1 withNum:3];
    [Iteration printStartWithCase:2 withNum:3];
    [Iteration printStartWithCase:3 withNum:3];
    [Iteration printStartWithCase:4 withNum:3];

    return 0;
}
