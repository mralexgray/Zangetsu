/*
 *  Zangetsu.h
 *  Zangetsu
 *
 *  Created by Colin Wheeler on 6/29/10.
 *  Copyright 2010. All rights reserved.
 *
 
 Copyright (c) 2012 Colin Wheeler
 
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

/**
 The headers here are listed in order of when
 they were created & added to Zangetsu
 */

//#if ! __has_feature(objc_arc)
//#warning This project requires ARC
//#endif
// ARC is compatible with iOS 4.0 upwards, but you need at least Xcode 4.2 with Clang LLVM 3.0 to compile it.
#if !defined(__clang__)
// || __clang_major__ < 3 || !__has_feature(objc_arc)
#warning This project must be compiled with ARC (Xcode 4.2+ with LLVM 3.0 and above)
#endif


#import "CWAssertionMacros.h"
#import "CWLogging.h"

#import "CWMacros.h"
#import "CWSHA1Utilities.h"
#import "CWTask.h"
#import "CWDateUtilities.h"
#import "NSString+Empty.h"
#import "NSString+URL.h"
#import "NSString+Enumeration.h"
#import "NSString+UUID.h"
#import "NSArray+Search.h"
#import "NSArray+Enumeration.h"
#import "NSArray+Transform.h"
#import "NSDictionary+Search.h"
#import "NSDictionary+Enumeration.h"
#import "NSDictionary+Transform.h"
#import "CWSystemInfo.h"
#import "NSSet+Search.h"
#import "NSSet+Transform.h"
#import "NSSet+Enumeration.h"
#import "NSURLConnection+Asynchronous.h"
#import "CWDebugUtilities.h"
#import "NSObject+Nil.h"
#import "NSObject+AssociatedObjects.h"
#import "NSObject+PerformOperation.h"
#import "CWFoundation.h"
#import "CWPathUtilities.h"
#import "CWErrorUtilities.h"
#import "CWGraphicsFoundation.h"
#import "CWMD5Utilities.h"
#import "NSData+HexRepresentation.h"
#import "CWExceptionUtilities.h"
#import "CWURLUtilities.h"
#import "CWRuntimeUtilities.h"
#import "CWCFConversionMacros.h"
#import "CWApplicationRegistry.h"
#import "CWStack.h"
#import "CWTree.h"
#import "NSMutableArray+Copying.h"
#import "NSMutableArray+Shuffle.h"
#import "CWBase64.h"
#import "CWZLib.h"
#import "CWQueue.h"
#import "CWURLRequest.h"
#import "NSMutableURLRequest+Authorization.h"
#import "NSRecursiveLock+UnlockWithBlock.h"
#import "NSColorAdditions.h"
#import "CWBlockQueue.h"
#import "CWTrie.h"
#import "NSImageAdditions.h"
#import "NSURL+DebugDescription.h"
#import "CWBlockTimer.h"
#import "CWFixedQueue.h"
#import "CWPriorityQueue.h"
#import "NSNumberAdditions.h"

#import "EXTADT.h"
#import "EXTAnnotation.h"
#import "EXTAspect.h"
#import "EXTBlockMethod.h"
#import "EXTBlockTarget.h"
#import "EXTConcreteProtocol.h"
#import "EXTDispatchObject.h"
#import "EXTFinalMethod.h"
#import "EXTKeyPathCoding.h"
#import "EXTMaybe.h"
#import "EXTMixin.h"
#import "EXTMultimethod.h"
#import "EXTMultiObject.h"
#import "EXTNil.h"
#import "EXTPassthrough.h"
#import "EXTPrivateMethod.h"
#import "EXTProtocolCategory.h"
#import "EXTSafeCategory.h"
#import "EXTScope.h"
#import "EXTSelectorChecking.h"
#import "EXTSynthesize.h"
#import "EXTSwizzle.h"
#import "EXTTuple.h"
#import "EXTVarargs.h"
#import "NSInvocation+EXT.h"
#import "NSMethodSignature+EXT.h"

