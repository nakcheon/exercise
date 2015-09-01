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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
