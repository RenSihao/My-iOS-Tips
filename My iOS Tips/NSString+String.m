//
//  NSString+String.m
//  My iOS Tips
//
//  Created by RenSihao on 16/1/12.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "NSString+String.h"

@implementation NSString (String)

+ (NSString *)repeateString:(NSString *)string count:(NSUInteger)count
{
    NSMutableString *mutableStr = [NSMutableString string];
    for (NSUInteger i=0; i<count; i++)
    {
        [mutableStr appendString:string];
    }
    return (NSString *)mutableStr;
}
@end
