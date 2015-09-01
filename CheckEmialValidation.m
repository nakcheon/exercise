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
    NSArray* arrayResult = [self validateEmail:@"aaa@gmail.com; bbb@gmail.com; ccc@gmail.com; ddd.gmail.com; eee@@gmail.com; #$ADB@gmail.com; vvv@gma!l.com"];
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

        // 유저 파트 호스트 파트 나눔
        if (arrayUserAndHost.count != 2) {
            [invalidEmails addObject:trimmedEmail];
            continue;
        }
        
        // regular expression 검사
        {
            NSError* error = nil;
            NSRegularExpression* expression = [[NSRegularExpression alloc] initWithPattern:@"[a-zA-Z0-9.]"
                                                                                   options:NSRegularExpressionCaseInsensitive
                                                                                     error:&error];
            BOOL bIsValid = YES;
            for (NSString* stringToRegularExpressionValidate in arrayUserAndHost) {
                NSString* afterEmail = [expression stringByReplacingMatchesInString:stringToRegularExpressionValidate
                                                                            options:0
                                                                              range:NSMakeRange(0, [stringToRegularExpressionValidate length])
                                                                       withTemplate:@""];
                NSLog(@"afterEmail=%@", afterEmail);
                if (![afterEmail isEqualToString:@""]) {
                    bIsValid = NO;
                    break;
                }
            }
            if (!bIsValid) {
                [invalidEmails addObject:trimmedEmail];
                continue;
            }
        }
        
        [validEmails addObject:trimmedEmail];
    }
    NSLog(@"invalid emails: %@", invalidEmails);
    
    return validEmails;
}


#pragma mark - private methods


@end
