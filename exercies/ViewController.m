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
#import "QueueWithTwoStacks.h"
#import "NCQuickSort.h"
#import "NCSortObject.h"

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
    
    QueueWithTwoStacks* exer6 = [[QueueWithTwoStacks alloc] init];
    {
        [exer6 queue:@"1"];
        [exer6 queue:@"2"];
        [exer6 queue:@"3"];
        [exer6 queue:@"4"];
        [exer6 queue:@"5"];
        [exer6 queue:@"6"];
        NSString* pop = [exer6 dequeue];
        NSLog(@"dequeue: %@", pop);
        [exer6 queue:@"7"];
        [exer6 queue:@"8"];
        [exer6 queue:@"9"];
        [exer6 queue:@"10"];
        while (![exer6 isEmpty]) {
            NSString* pop = [exer6 dequeue];
            NSLog(@"dequeue: %@", pop);
        }
    }
    
    NCQuickSort* quickSort = [[NCQuickSort alloc] init];
    {
        // insert
        int n = 10 ;
        while (n-- > 0) {
            NCSortObject* object = [[NCSortObject alloc] init];
            object.objectValue = arc4random() % 20;
            [quickSort insetValue:object];
        }
        
        // sort
        [quickSort startSort];
        
        // print
        for (NCSortObject* object in quickSort.arrarListOfElementsToSort) {
            NSLog(@"sorted result = %d", object.objectValue);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
