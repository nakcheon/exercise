//
//  ViewController.m
//  exercies
//
//  Created by JungNakCheon on 9/1/15.
//  Copyright (c) 2015 ncjung. All rights reserved.
//

#import "ViewController.h"
#import "Exercise.h"
#import "findingSiblings.h"
#import "CheckEmialValidation.h"
#import "GenerateParenthesis.h"
#import "MakePermutation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Exercise* exer1 = [[Exercise alloc] init];
    [exer1 interSectExercise];
    [exer1 unionExercise];
    [exer1 reverseString];
    
    findingSiblings* exer2 = [[findingSiblings alloc] init];
    [exer2 findSiblings];
    
    CheckEmialValidation* exer3 = [[CheckEmialValidation alloc] init];
    [exer3 validateExample];
    
    GenerateParenthesis* exer4 = [[GenerateParenthesis alloc] init];
    [exer4 initialize];
    [exer4 startWithCount:3];
    
    MakePermutation* exer5 = [[MakePermutation alloc] init];
    NSMutableArray* arrayCharacters = [[NSMutableArray alloc] init];
    [arrayCharacters addObject:@"a"];
    [arrayCharacters addObject:@"b"];
    [arrayCharacters addObject:@"c"];
    [arrayCharacters addObject:@"d"];
    NSArray* arrayResult = [exer5 makePermutation:arrayCharacters];
    NSLog(@"%@", arrayResult);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
