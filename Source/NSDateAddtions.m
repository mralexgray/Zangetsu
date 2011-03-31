//
//  NSDateAddtions.m
//  Zangetsu
//
//  Created by Colin Wheeler on 3/31/11.
//  Copyright 2011. All rights reserved.
//

#import "NSDateAddtions.h"

static const NSTimeInterval kCWSecondsIn1Day = 86400;

@implementation NSDate (CWNSDateAddtions)

-(NSDate *)cw_dateByAddingDays:(NSUInteger)days {
	return [self dateByAddingTimeInterval:(kCWSecondsIn1Day * days)];
}

@end