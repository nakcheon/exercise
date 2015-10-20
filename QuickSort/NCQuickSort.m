//
//  NCQuickSort.m
//  exercies
//
//  Created by NakCheonJung on 10/15/15.
//  Copyright © 2015 ncjung. All rights reserved.
//

#import "NCQuickSort.h"

@interface NCQuickSort (privateMethods)
-(void)privateSortArrayWithLeft:(int)left
                          right:(int)right;
-(int)privatePartitionWithLeft:(int)left
                         right:(int)right;
-(void)privateSwapElementsWithLeft:(int)left
                             right:(int)right;
@end

@implementation NCQuickSort

-(void)insetValue:(id<NCSortObjectProtocolDelegate>)element;
{
    if (!_arrarListOfElementsToSort) {
        _arrarListOfElementsToSort = [[NSMutableArray alloc] init];
    }
    [_arrarListOfElementsToSort addObject:element];
}

-(void)startSort
{
    [self privateSortArrayWithLeft:0
                             right:(int)_arrarListOfElementsToSort.count - 1];
}

#pragma mark - private methods

-(void)privateSortArrayWithLeft:(int)left
                          right:(int)right
{
    if (left >= right) {
        return;
    }
    
    int middle = [self privatePartitionWithLeft:left
                                          right:right+1];
    
    [self privateSortArrayWithLeft:left right:middle - 1];
    [self privateSortArrayWithLeft:middle + 1 right:right];
}

-(int)privatePartitionWithLeft:(int)left
                         right:(int)right
{
    int nPivotIndex = left;
    id<NCSortObjectProtocolDelegate> idValue = (id<NCSortObjectProtocolDelegate>)[_arrarListOfElementsToSort objectAtIndex:nPivotIndex];
    
    do {
        id<NCSortObjectProtocolDelegate> idLeftValue = nil;
        id<NCSortObjectProtocolDelegate> idRightValue = nil;
        
        // search left
        do {
            if (left >= _arrarListOfElementsToSort.count - 1) {
                break;
            }
            idLeftValue = (id<NCSortObjectProtocolDelegate>)_arrarListOfElementsToSort[++left];
        } while ([idLeftValue objectValue] < [idValue objectValue]);
        
        // search right
        do {
            if (right <= 0) {
                break;
            }
            idRightValue = (id<NCSortObjectProtocolDelegate>)_arrarListOfElementsToSort[--right];
        } while ([idRightValue objectValue] > [idValue objectValue]);
        
        // compare and swap
        if (left < right) {
            [self privateSwapElementsWithLeft:left right:right];
        }
        
    } while (left < right);
    
    _arrarListOfElementsToSort[nPivotIndex] = _arrarListOfElementsToSort[right];
    _arrarListOfElementsToSort[right] = idValue;
    
    return right;
}

-(void)privateSwapElementsWithLeft:(int)left
                             right:(int)right
{
    id<NCSortObjectProtocolDelegate> idLeft = (id<NCSortObjectProtocolDelegate>)[_arrarListOfElementsToSort objectAtIndex:left];
    id<NCSortObjectProtocolDelegate> idRight = (id<NCSortObjectProtocolDelegate>)[_arrarListOfElementsToSort objectAtIndex:right];
    
    [_arrarListOfElementsToSort replaceObjectAtIndex:left withObject:idRight];
    [_arrarListOfElementsToSort replaceObjectAtIndex:right withObject:idLeft];
}

@end
