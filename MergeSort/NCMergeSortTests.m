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
    {
        NCSortObject* object = [[NCSortObject alloc] init];
        object.objectValue = 30;
        [_mergeSort insetValue:object];
    }
    {
        NCSortObject* object = [[NCSortObject alloc] init];
        object.objectValue = 20;
        [_mergeSort insetValue:object];
    }
    {
        NCSortObject* object = [[NCSortObject alloc] init];
        object.objectValue = 40;
        [_mergeSort insetValue:object];
    }
    {
        NCSortObject* object = [[NCSortObject alloc] init];
        object.objectValue = 35;
        [_mergeSort insetValue:object];
    }
    {
        NCSortObject* object = [[NCSortObject alloc] init];
        object.objectValue = 5;
        [_mergeSort insetValue:object];
    }
    {
        NCSortObject* object = [[NCSortObject alloc] init];
        object.objectValue = 50;
        [_mergeSort insetValue:object];
    }
    {
        NCSortObject* object = [[NCSortObject alloc] init];
        object.objectValue = 45;
        [_mergeSort insetValue:object];
    }
    {
        NCSortObject* object = [[NCSortObject alloc] init];
        object.objectValue = 10;
        [_mergeSort insetValue:object];
    }
    {
        NCSortObject* object = [[NCSortObject alloc] init];
        object.objectValue = 25;
        [_mergeSort insetValue:object];
    }
    {
        NCSortObject* object = [[NCSortObject alloc] init];
        object.objectValue = 15;
        [_mergeSort insetValue:object];
    }
    
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
