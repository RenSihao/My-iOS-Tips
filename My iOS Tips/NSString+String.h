//
//  NSString+String.h
//  My iOS Tips
//
//  Created by RenSihao on 16/1/12.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (String)

/**
 *  将传入字符串重复N次并返回
 *
 *  @param string <#string description#>
 *  @param count  <#count description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)repeateString:(NSString *)string count:(NSUInteger)count;

@end
