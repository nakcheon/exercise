//
//  CheckEmialValidation.m
//  exercies
//
//  Created by JungNakCheon on 9/1/15.
//  Copyright (c) 2015 ncjung. All rights reserved.
//

#import "CheckEmialValidation.h"

@implementation CheckEmialValidation

#pragma mark - operations

-(void)validateExample
{
    NSArray* arrayResult = [self validateEmail:@"aaa@gmail.com; bbb@gmail.com; ccc@gmail.com; ddd.gmail.com; eee@@gmail.com"];
    NSLog(@"email result: %@", arrayResult);
}

-(NSArray*)validateEmail:(NSString*)inputEmails
{
    NSArray* arrayEmailList = [inputEmails componentsSeparatedByString:@";"];

    NSMutableArray* validEmails = [[NSMutableArray alloc] init];
    NSMutableArray* invalidEmails = [[NSMutableArray alloc] init];
    for (NSString* strEmail in arrayEmailList) {
        NSString* trimmedEmail = [strEmail stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSArray* arrayUserAndHost = [trimmedEmail componentsSeparatedByString:@"@"];
        if (arrayUserAndHost.count != 2) {
            [invalidEmails addObject:trimmedEmail];
            continue;
        }
        NSLog(@"%@", trimmedEmail);
        [validEmails addObject:trimmedEmail];
    }
    NSLog(@"invalid emails: %@", invalidEmails);
    
    return validEmails;
}


#pragma mark - private methods


@end
