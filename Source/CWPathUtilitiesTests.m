/*
//  CWPathUtilitiesTests.m
//  Zangetsu
//
//  Created by Colin Wheeler on 6/28/11.
//  Copyright 2012. All rights reserved.
//
 
 Copyright (c) 2013, Colin Wheeler
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 - Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 - Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "CWPathUtilities.h"

SpecBegin(CWPathUtilities)

describe(@"+pathByAppendingHomeFolderPath", ^{
	it(@"should correctly get the home folder path & append a value to it", ^{
		NSString *homePath1 = [@"~/Documents/Test" stringByExpandingTildeInPath];
		NSString *homePath2 = [CWPathUtilities pathByAppendingHomeFolderPath:@"Documents/Test"];
		
		expect(homePath1).to.equal(homePath2);
	});
});

describe(@"+documentsFolderPathForFile", ^{
	it(@"should correctly return the expected path in the Documents folder", ^{
		NSString *documentPath1 = [@"~/Documents/Test.txt" stringByExpandingTildeInPath];
		NSString *documentPath2 = [CWPathUtilities documentsFolderPathForFile:@"Test.txt"];
		
		expect(documentPath1).to.equal(documentPath2);
	});
});

describe(@"CWFullPathFromTildeString", ^{
	it(@"should return a non nil path for a valid path", ^{
		expect(CWFullPathFromTildeString(@"~/Documents")).notTo.beNil();
	});
	
	it(@"should return nil for invalid paths", ^{
		expect(CWFullPathFromTildeString(@"~/Quizzyjimbo1135599887658-111765")).to.beNil();
	});
});

describe(@"+temporaryFilePath", ^{
	it(@"should always return a unique temporary path", ^{
		NSString *path1 = [CWPathUtilities temporaryFilePath];
		NSString *path2 = [CWPathUtilities temporaryFilePath];
		NSString *path3 = [CWPathUtilities temporaryFilePath];
		
		expect(path1).notTo.equal(path2);
		expect(path1).notTo.equal(path3);
		expect(path2).notTo.equal(path3);
	});
});

SpecEnd
