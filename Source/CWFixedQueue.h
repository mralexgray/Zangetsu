/*
//  CWFixedQueue.h
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

#import <Foundation/Foundation.h>

@interface CWFixedQueue : NSObject

/**
 Initializes the Queue and sets the capacity property to the NSUInteger passed in
 
 @param capacity a NSUInteger that limits the queue to this number of items it should contain
 @return a new CWFixedQueue instance
 */
-(id)initWithCapacity:(NSUInteger)capacity;

/**
 The maximum # of items the queue should contain
 */
@property(assign) NSUInteger capacity;

/**
 Enqueues the object onto the queue
 
 If the object is nil then this method does nothing. If enqueuing this item
 makes the queue over capacity then the queue will remove the oldest items
 till the queue is no longer over capacity.
 
 @param object the object to be enqueued
 */
-(void)enqueue:(id)object;

/**
 Enqueues the objects in array onto the queue
 
 If array is nil or contains 0 objects this method does nothing. Otherwise
 this method will add the objects in array onto the queue. If enqueueing
 these objects makes the queue over capacity then it will remove the
 oldest items until the queue is no longer over capacity.
 
 @param array the array of items to be enqueued
 */
-(void)enqueueObjectsInArray:(NSArray *)array;

/**
 Removes the oldest item off the queue and returns it
 
 If the queue has no items this returns nil, otherwise it removes the oldest
 item off the queue and returns it to you.
 
 @return the oldest item on the queue or nil if there are no items in the queue
 */
-(id)dequeue;

/**
 Returns the count of items in the queue
 
 @return count a NSUInteger with the number of items in the queue
 */
-(NSUInteger)count;

/**
 Enumerates over the queueu contents using a block
 */
-(void)enumerateContents:(void (^)(id object, NSUInteger index, BOOL *stop))block;

@end
