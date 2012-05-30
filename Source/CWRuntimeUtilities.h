/*
//  CWRuntimeUtilities.h
//  Zangetsu
//
//  Created by Colin Wheeler on 3/11/11.
//  Copyright 2011. All rights reserved.
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

static NSString *const kCWRuntimeErrorDomain = @"com.Zangetsu.CWRuntimeUtilities";

static const NSInteger kCWErrorNoOriginalInstanceMethod = 201;
static const NSInteger kCWErrorNoNewInstanceMethod = 202;
static const NSInteger kCWErrorNoOriginalClassMethod = 203;
static const NSInteger kCWErrorNoNewClassMethod = 204;

//so we don't have to include <objc/runtime.h> here in this header
typedef struct objc_method *Method;

/**
 Swizzles the Instance Method implementations
 
 Attempts to get the method implementations for the selectors on the class specified and swizzles them. If
 it can't get either method implementations then it writes to error and returns NO. Otherwise it exchanges
 the implementations and returns YES.
 
 @param methodClass The Class whose class methods you are swizzling
 @param originalSel The original method you are swizzling
 @param newSel The New method you are swizzling
 @param error an error object to write to if something goes wrong
 @return the original Objective-C Method implementation if successfull or nil if not successfull
 */
Method CWSwizzleInstanceMethods(Class instanceClass, SEL originalSel, SEL newSel, NSError **error);

/**
 Swizzles the Class Method implementations
 
 Attempts to get the method implementations for the selectors on the class specified and swizzles them. If
 it can't get either method implementations then it writes to error and returns NO. Otherwise it exchanges
 the implementations and returns YES.
 
 @param methodClass The Class whose class methods you are swizzling
 @param originalSel The original method you are swizzling
 @param newSel The New method you are swizzling
 @param error an error object to write to if something goes wrong
 @return the original Objective-C Method implementation if successfull or nil if not successfull
 */
Method CWSwizzleClassMethods(Class methodClass, SEL originalSel, SEL newSel, NSError **error);
