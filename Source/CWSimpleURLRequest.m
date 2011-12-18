/*
//  CWSimpleURLRequest.m
//  Zangetsu
//
//  Created by Colin Wheeler on 12/13/11.
//  Copyright (c) 2011. All rights reserved.
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
 
/**
 This is the class that eventually will replace (become) CWURLRequest. As 
 CWURLRequest was writen over a period of time so too this class will take
 a while to ramp up to replace all/most of CWURLRequests methods.
 */

#import "CWSimpleURLRequest.h"

@interface CWSimpleURLRequest() <NSURLConnectionDelegate>
//Public Readonly rewritten
@property(nonatomic, readwrite, retain) NSString *urlHost;
@property(nonatomic, readwrite, retain) NSURLResponse *connectionResponse;
@property(nonatomic, readwrite, retain) NSError *connectionError;
//Private only
@property(nonatomic, retain) NSString *httpAuthorizationHeader;
@property(nonatomic, retain) NSURLConnection *instanceConnection;
@property(nonatomic, retain) NSMutableData *receivedData;
@property(nonatomic, assign) BOOL connectionIsFinished;
-(NSMutableURLRequest *)_createInternalURLRequest;
@end

@implementation CWSimpleURLRequest

@synthesize urlHost;
@synthesize httpAuthorizationHeader;
@synthesize instanceConnection;
@synthesize connectionIsFinished;
@synthesize receivedData;
@synthesize connectionResponse;
@synthesize connectionError;

/**
 Designated Initializer
 */
-(id)initWithHost:(NSString *)host {
	self = [super init];
	if (self) {
		urlHost = host;
		httpAuthorizationHeader = nil;
		instanceConnection = nil;
		receivedData = [[NSMutableData alloc] init];
		connectionResponse = nil;
		connectionError = nil;
	}
	return self;
}

/**
 A request object initialized this way is unusable.
 This is here just to give an error message when this 
 class is initialized incorrectly.
 */
-(id)init {
	self = [super init];
	if (self) {
		urlHost = nil;
		httpAuthorizationHeader = nil;
		instanceConnection = nil;
		connectionIsFinished = NO;
		receivedData = nil;
		connectionResponse = nil;
		connectionError = CWCreateError(kCWSimpleURLRequestNoHostError, @"com.Zangetsu.CWSimpleURLRequest", 
										@"Host is nil and therefore cannot be used for a connection");
	}
	return self;
}

-(NSString *)description {
	return [NSString stringWithFormat:@"%@: Host: %@\nUses Auth Header: %@",
			NSStringFromClass([self class]),
			[self urlHost],
			[self httpAuthorizationHeader]];
}

/**
 Creates the Base64 encoded http authorization header for the instance request
 
 Creates the authorization header string for the instance request. If either 
 login or passwd are nil then this method does nothing. Otherwise it creates
 a Base64 encoded http header string and will be used when this class creates
 it NSMutableURLRequest.
 
 @param login a NSString with the login to the website you making a request from
 @param password a NSString with the password to the website you are making a request from
 */
-(void)setAuthorizationHeaderLogin:(NSString *)login 
					   andPassword:(NSString *)passwd {
	if (login && passwd) {
		NSString *base64AuthString = CWURLAuthorizationHeaderString(login, passwd);
		if (base64AuthString) {
			[self setHttpAuthorizationHeader:base64AuthString];
		}
	}
}	

-(NSMutableURLRequest *)_createInternalURLRequest {
	if ([self urlHost]) {
		NSURL *url = [NSURL URLWithString:[self urlHost]];
		NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
		if ([self httpAuthorizationHeader]) {
			[request cw_setHTTPAuthorizationHeaderFieldString:[self httpAuthorizationHeader]];
		}
		return request;
	}
	return nil;
}

//MARK: Connection Initiaton Methods

-(NSData *)startSynchronousConnection {
	NSMutableURLRequest *request = [self _createInternalURLRequest];
	if (request) {
		NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
		[connection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
		[self setInstanceConnection:connection];
		[[self instanceConnection] start];
		
		while ([self connectionIsFinished] == NO) {
			[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
		}
		return [self receivedData];
	}
	NSError *noHostError = CWCreateError(kCWSimpleURLRequestNoHostError, @"com.Zangetsu.CWSimpleURLRequest", 
										 @"Host is nil and therefore cannot be used for a connection");
	[self setConnectionError:noHostError];
	return nil;
}

-(void)startAsynchronousConnectionOnGCDQueue:(dispatch_queue_t)queue 
						 withCompletionBlock:(void (^)(NSData *data, NSError *error, NSURLResponse *response))block {
	NSParameterAssert(queue);
	
	dispatch_async(queue, ^{
		NSData *data = [self startSynchronousConnection];
		
		dispatch_async(dispatch_get_main_queue(), ^{
			block(data,[self connectionError],[self connectionResponse]);
		});
	});
}

-(void)startAsynchronousConnectionOnQueue:(NSOperationQueue *)queue 
					  withCompletionBlock:(void (^)(NSData *data, NSError *error, NSURLResponse *response))block {
	NSParameterAssert(queue);
	
	[queue addOperationWithBlock:^{
		NSData *data = [self startSynchronousConnection];
		
		[[NSOperationQueue mainQueue] addOperationWithBlock:^{
			block(data,[self connectionError],[self connectionResponse]);
		}];
	}];
}

//MARK: NSURLConnection Delegate Methods

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	if ([connection isEqual:[self instanceConnection]]) {
		[self setConnectionResponse:response];
	}
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	if ([connection isEqual:[self instanceConnection]]) {
		[[self receivedData] appendData:data];
	}
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
	if ([[self instanceConnection] isEqual:connection]) {
		[self setConnectionIsFinished:YES];
	}
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	if ([[self instanceConnection] isEqual:connection]) {
		[self setConnectionError:error];
		[self setConnectionIsFinished:YES];
		CWLogError(error);
	}
}

@end
