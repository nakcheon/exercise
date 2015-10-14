//
//  NCQuickSortTest.m
//  DealOptionSort
//
//  Created by NakCheonJung on 9/13/15.
//  Copyright (c) 2015 ncjung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NCQuickSort.h"
#import "NCSortObject.h"

@interface NCQuickSortTest : XCTestCase
{
    NCQuickSort* _quickSort;
}

@end

@implementation NCQuickSortTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _quickSort = [[NCQuickSort alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInsertAndSort {
    
    // insert
    int n = 60000 ;
    while (n-- > 0) {
        NCSortObject* object = [[NCSortObject alloc] init];
        object.objectValue = arc4random() % 70000;
        [_quickSort insetValue:object];
    }
    
    // sort
    [_quickSort startSort];
    
    // print
    for (NCSortObject* object in _quickSort.arrarListOfElementsToSort) {
        NSLog(@"sorted result = %d", object.objectValue);
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
