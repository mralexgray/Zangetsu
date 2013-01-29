//
//  CWPriorityQueueTests.m
//  ObjC_Playground
//
//  Created by Colin Wheeler on 12/19/12.
//  Copyright (c) 2012 Colin Wheeler. All rights reserved.
//

#import "CWPriorityQueueTests.h"
#import "CWPriorityQueue.h"
#import "CWAssertionMacros.h"

@implementation CWPriorityQueueTests

-(void)testBasicPushAndPop
{
	CWPriorityQueue *queue = [CWPriorityQueue new];
	
	[queue addItem:@"1" withPriority:1];
	[queue addItem:@"5" withPriority:5];
	[queue addItem:@"3" withPriority:3];
	[queue addItem:@"2" withPriority:2];
	[queue addItem:@"100" withPriority:100];
	[queue addItem:@"20" withPriority:20];
	[queue addItem:@"9" withPriority:9];
	
	CWAssertEqualsStrings([queue dequeue], @"1");
	CWAssertEqualsStrings([queue dequeue], @"2");
	CWAssertEqualsStrings([queue dequeue], @"3");
	CWAssertEqualsStrings([queue dequeue], @"5");
	CWAssertEqualsStrings([queue dequeue], @"9");
	CWAssertEqualsStrings([queue dequeue], @"20");
	CWAssertEqualsStrings([queue dequeue], @"100");
}

-(void)testObjectsOfPriority
{
	CWPriorityQueue *queue = [CWPriorityQueue new];
	
	[queue addItem:@"All" withPriority:0];
	[queue addItem:@"Glory" withPriority:3];
	[queue addItem:@"To" withPriority:1];
	[queue addItem:@"The" withPriority:5];
	[queue addItem:@"Hypnotoad" withPriority:5];
	[queue addItem:@"Fry" withPriority:13];
	[queue addItem:@"Leela" withPriority:2];
	
	NSArray *results = [queue allObjectsOfPriority:5];
	
	STAssertTrue(results.count == 2, nil);
	
	NSArray *expected = @[ @"The", @"Hypnotoad" ];
	STAssertEqualObjects(expected, results, nil);
}

-(void)testCountOfPriority
{
	CWPriorityQueue *queue = [CWPriorityQueue new];
	
	[queue addItem:@"1" withPriority:1];
	[queue addItem:@"2" withPriority:2];
	[queue addItem:@"3" withPriority:3];
	[queue addItem:@"3" withPriority:3];
	[queue addItem:@"3" withPriority:3];
	[queue addItem:@"3" withPriority:3];
	[queue addItem:@"4" withPriority:4];
	[queue addItem:@"7" withPriority:7];
	[queue addItem:@"9" withPriority:9];
	[queue addItem:@"9" withPriority:9];
	
	STAssertTrue([queue countofObjectsWithPriority:1] == 1, nil);
	STAssertTrue([queue countofObjectsWithPriority:2] == 1, nil);
	STAssertTrue([queue countofObjectsWithPriority:3] == 4, nil);
	STAssertTrue([queue countofObjectsWithPriority:4] == 1, nil);
	STAssertTrue([queue countofObjectsWithPriority:7] == 1, nil);
	STAssertTrue([queue countofObjectsWithPriority:9] == 2, nil);
}

-(void)testDequeueAllObjectsOfNextPriorityLevel
{
	CWPriorityQueue *queue = [CWPriorityQueue new];
	
	[queue addItem:@"1-1" withPriority:1];
	[queue addItem:@"2-1" withPriority:2];
	[queue addItem:@"2-2" withPriority:2];
	[queue addItem:@"2-3" withPriority:2];
	[queue addItem:@"2-4" withPriority:2];
	[queue addItem:@"2-5" withPriority:2];
	[queue addItem:@"3-1" withPriority:3];
	[queue addItem:@"3-2" withPriority:3];
	[queue addItem:@"3-3" withPriority:3];
	[queue addItem:@"4-1" withPriority:4];
	[queue addItem:@"4-2" withPriority:4];
	[queue addItem:@"4-3" withPriority:4];
	[queue addItem:@"4-4" withPriority:4];
	
	STAssertTrue([queue dequeueAllObjectsOfNextPriorityLevel].count == 1, nil);
	STAssertTrue([queue dequeueAllObjectsOfNextPriorityLevel].count == 5, nil);
	STAssertTrue([queue dequeueAllObjectsOfNextPriorityLevel].count == 3, nil);
	STAssertTrue([queue dequeueAllObjectsOfNextPriorityLevel].count == 4, nil);
}

-(void)test
{
	CWPriorityQueue *queue = [CWPriorityQueue new];
	
	STAssertNil([queue peek], nil);
	
	[queue addItem:@"Hypnotoad" withPriority:4];
	
	id item = [queue peek];
	STAssertNotNil(item, nil);
	CWAssertEqualsStrings(item, @"Hypnotoad");
}

@end