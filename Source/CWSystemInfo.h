/*
//  CWSystemInfo.h
//  Zangetsu
//
//  Created by Colin Wheeler on 11/14/10.
//  Copyright 2010. All rights reserved.
//
 
 Copyright (c) 2011 Colin Wheeler
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import <Foundation/Foundation.h>

static NSString * const kCWSystemMajorVersion =  @"majorVersion";
static NSString * const kCWSystemMinorVersion =  @"minorVersion";
static NSString * const kCWSystemBugFixVersion = @"bugfixVersion";

@interface CWSystemInfo : NSObject

/**
 * Convenience Method to return a dictionary with the Mac OS X version
 * information in a way where you can query a specific part of the version
 * information you want
 *
 * @return hostVersion a NSDictionary with the key/value pairs for the majaor/minor/bugfix version #'s of Mac OS X
 */
+(NSDictionary *)hostVersion;

/**
 * Convenience method to return a NSString with the Mac OS X version
 * information.
 *
 * @return hostVersionString a string for the version of Mac OS X in use like "10.6.6" for Mac OS X 10.6.6
 */
+(NSString *)hostVersionString;

/**
 * Does what it says it does, returns the # of cpu cores on the host Mac
 *
 * @return numberOfCUPCores a NSInteger with the number of CPU cores on the Host Mac
 */
+(NSInteger)numberOfCPUCores;

/**
 * Returns the amount of physical ram in megabytes the host device has
 *
 * @return a NSInteger representing the physical ram size of the host system
 */
+(NSInteger)physicalRamSize;

/**
 * Returns the amount of logical ram in megabytes the host device has. This
 * may be less than the physical ram size because things like the OS/gpu
 * may be using some of the physical ram.
 * 
 * @return a NSInteger representing the logical ram size of the host system
 */
+(NSInteger)logicalRamSize;

/**
 * Returns the processor speed of the host system in MHz as a NSInteger
 * 
 * @return a NSInteger representing the processor speed in MHz
 */
+(NSInteger)processorSpeed;
@end
