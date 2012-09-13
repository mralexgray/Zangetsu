/*
//  CWFixedQueue.m
//  Zangetsu
//
//  Created by Colin Wheeler on 9/10/12.
//
//
 
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

#import "CWFixedQueue.h"

@interface CWFixedQueue()
@property(retain) NSMutableArray *storage;
-(void)clearExcessObjects;
@end

@implementation CWFixedQueue

-(id)initWithCapacity:(NSUInteger)capacity
{
	self = [super init];
	if (self) {
		_storage = [NSMutableArray new];
		_capacity = capacity;
	}
	return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        _storage = [NSMutableArray new];
		_capacity = 50;
    }
    return self;
}

-(NSUInteger)count
{
	return [_storage count];
}

-(void)enqueue:(id)object
{
	if (object) {
		[_storage addObject:object];
		[self clearExcessObjects];
	}
}

-(void)enqueueObjectsInArray:(NSArray *)array
{
	if (array && ([array count] > 0)) {
		[_storage addObjectsFromArray:array];
		[self clearExcessObjects];
	}
}

-(void)clearExcessObjects
{
	while ([_storage count] > _capacity) {
		[_storage removeObjectAtIndex:0];
	}
}

-(id)dequeue
{
	if ([_storage count] > 0) {
		id dequeuedObject = [_storage objectAtIndex:0];
		[_storage removeObjectAtIndex:0];
		return dequeuedObject;
	}
	return nil;
}

-(void)enumerateContents:(void (^)(id object, NSUInteger index, BOOL *stop))block
{
	[_storage enumerateObjectsUsingBlock:block];
}

@end
