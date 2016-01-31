//
//  NCMergeSort.m
//  exercies
//
//  Created by NakCheonJung on 10/15/15.
//  Copyright © 2015 ncjung. All rights reserved.
//

#import "NCMergeSort.h"
#import "NCSortObject.h"

@interface NCMergeSort (privateMethods)
-(void)privateMergeSortWihtLow:(int)low high:(int)high;
-(void)privateMergeWithLow:(int)low mid:(int)mid high:(int)high;
@end

@implementation NCMergeSort

-(void)insetValue:(id<NCSortObjectProtocolDelegate>)element
{
    if (!_arrarListOfElementsToSort) {
        _arrarListOfElementsToSort = [[NSMutableArray alloc] init];
    }
    [_arrarListOfElementsToSort addObject:element];
}

-(void)startSort
{
    //NSLog(@"==========");
    //for (NCSortObject* object in _arrarListOfElementsToSort) {
    //    NSLog(@"sorted2 result = %d", object.objectValue);
    //}
    //NSLog(@"==========");
    [self privateMergeSortWihtLow:0 high:(int)_arrarListOfElementsToSort.count - 1];
}

#pragma mark - private methods

-(void)privateMergeSortWihtLow:(int)low high:(int)high
{
    if (low >= high) {
        return;
    }
    int mid = (low + high) / 2;
    [self privateMergeSortWihtLow:low high:mid];
    [self privateMergeSortWihtLow:mid+1 high:high];
    [self privateMergeWithLow:low mid:mid high:high];
}

-(void)privateMergeWithLow:(int)low mid:(int)mid high:(int)high
{
    NSMutableArray* arrayBuffer = [[NSMutableArray alloc] init];
    for (int i = 0; i < _arrarListOfElementsToSort.count; ++i) {
        NCSortObject* obj = [[NCSortObject alloc] init];
        obj.objectValue = INT32_MAX;
        [arrayBuffer addObject:obj];
    }
    int indexLeft = low;
    int indexRight = mid + 1;
    int indexBuffer = low;
    
    // sort
    while (indexLeft <= mid && indexRight <= high) {
        id<NCSortObjectProtocolDelegate> leftObj = _arrarListOfElementsToSort[indexLeft];
        id<NCSortObjectProtocolDelegate> rightObj = _arrarListOfElementsToSort[indexRight];
        if (leftObj.objectValue < rightObj.objectValue) {
            [(id<NCSortObjectProtocolDelegate>)arrayBuffer[indexBuffer++] deepCopy:_arrarListOfElementsToSort[indexLeft++]];
        }
        else {
            [(id<NCSortObjectProtocolDelegate>)arrayBuffer[indexBuffer++] deepCopy:_arrarListOfElementsToSort[indexRight++]];
        }
    }
    
    // copy rest of the array to B
    if (indexLeft > mid) {
        for (int i = indexRight; i <= high; ++i) {
            [(id<NCSortObjectProtocolDelegate>)arrayBuffer[indexBuffer++] deepCopy:_arrarListOfElementsToSort[i]];
        }
    }
    else {
        for (int i = indexLeft; i <= mid; ++i) {
            [(id<NCSortObjectProtocolDelegate>)arrayBuffer[indexBuffer++] deepCopy:_arrarListOfElementsToSort[i]];
        }
    }
    
    // copy back (deep copy)
    for (int i = low; i <= high; ++i) {
        [(id<NCSortObjectProtocolDelegate>)_arrarListOfElementsToSort[i] deepCopy:arrayBuffer[i]];
    }

    //// debug
    //NSLog(@"==========");
    //for (NCSortObject* object in arrayBuffer) {
    //    NSLog(@"sorted1 result = %d", object.objectValue);
    //}
    //NSLog(@"==========");
    //for (NCSortObject* object in _arrarListOfElementsToSort) {
    //    NSLog(@"sorted2 result = %d", object.objectValue);
    //}
    //NSLog(@"==========");
}

@end
