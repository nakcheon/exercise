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
#import "CheckInterSectionBtwTwoRectangles.h"

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
    
    // intersection
    CheckInterSectionBtwTwoRectangles* interSection = [[CheckInterSectionBtwTwoRectangles alloc] init];
    {
        NSLog(@"===================================================");
        NSLog(@"0.not meet");
        int ret1 = [interSection solutionWithK:-4 L:1
                                             M:2 N:6
                                             P:0 Q:-4
                                             R:4 S:0]; // not meet
        NSLog(@"0.not meet = %d", ret1); // => 0
    }
    {
        NSLog(@"===================================================");
        NSLog(@"1.right bottom");
        int ret1 = [interSection solutionWithK:-4 L:1
                                             M:2 N:6
                                             P:0 Q:-1
                                             R:4 S:3]; // right bottom
        NSLog(@"1.intersection - right bottom = %d", ret1); // => 42
    }
    {
        NSLog(@"===================================================");
        NSLog(@"2.left bottom");
        int ret1 = [interSection solutionWithK:-4 L:1
                                             M:2 N:6
                                             P:-6 Q:-2
                                             R:-2 S:2]; // left bottom
        NSLog(@"2.intersection - left bottom = %d", ret1); // => 44
    }
    {
        NSLog(@"===================================================");
        NSLog(@"3.right upper");
        int ret1 = [interSection solutionWithK:-4 L:1
                                             M:2 N:6
                                             P:1 Q:4
                                             R:5 S:8]; // right upper
        NSLog(@"3.intersection - right upper = %d", ret1); // => 44
    }
    {
        NSLog(@"===================================================");
        NSLog(@"4.left upper");
        int ret1 = [interSection solutionWithK:-4 L:1
                                             M:2 N:6
                                             P:-6 Q:4
                                             R:-2 S:8]; // left upper
        NSLog(@"4.intersection - left upper = %d", ret1); // => 44
    }
    {
        NSLog(@"===================================================");
        NSLog(@"5.bottom");
        int ret1 = [interSection solutionWithK:-4 L:1
                                             M:2 N:6
                                             P:-6 Q:-2
                                             R:5 S:2]; // bottom
        NSLog(@"4.intersection - bottom = %d", ret1); // => 74
    }
    
    NSLog(@"===================================================");
    
    int ret2 = [interSection solutionWithK:0 L:0 M:1000 N:1000 P:1 Q:1 R:10 S:10];
    NSLog(@"2.intersection - include second = %d", ret2);
    
    int ret3 = [interSection solutionWithK:0 L:0 M:1000 N:1000 P:-10 Q:-10 R:100000 S:100000];
    NSLog(@"3.intersection - include first = %d", ret3);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
