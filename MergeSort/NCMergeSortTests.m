//
//  NCMergeSortTests.m
//  exercies
//
//  Created by NakCheonJung on 10/20/15.
//  Copyright © 2015 ncjung. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NCSortObject.h"
#import "NCMergeSort.h"

@interface NCMergeSortTests : XCTestCase
{
    NCMergeSort* _mergeSort;
}

@end

@implementation NCMergeSortTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _mergeSort = [[NCMergeSort alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInsertAndSort {
    
    [_mergeSort.arrarListOfElementsToSort removeAllObjects];
    
    // insert
    NSArray* arrayValues = @[@30, @20, @40, @35, @5, @50, @45, @10, @25, @15];
    [arrayValues enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NCSortObject* object = [[NCSortObject alloc] init];
        object.objectValue = [obj intValue];
        [_mergeSort insetValue:object];
    }];
    
    // sort
    [_mergeSort startSort];
    
    // print
    for (NCSortObject* object in _mergeSort.arrarListOfElementsToSort) {
        NSLog(@"sorted result = %d", object.objectValue);
    }
}

- (void)testInsertLArgeAndSort {
    
    [_mergeSort.arrarListOfElementsToSort removeAllObjects];
    
    // insert
    int n = 1000 ;
    while (n-- > 0) {
        NCSortObject* object = [[NCSortObject alloc] init];
        object.objectValue = arc4random() % 1000;
        [_mergeSort insetValue:object];
    }
    
    // sort
    [_mergeSort startSort];
    
    // print
    for (NCSortObject* object in _mergeSort.arrarListOfElementsToSort) {
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
