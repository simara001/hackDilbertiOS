//
//  HTTPRequest.h
//  Employee Photo Uploader
//
//  Created by Fernando Dingler on 11/11/13.
//  Copyright (c) 2013 Deo Consultores. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HTTPRequestDelegate<NSObject>
-(void) didReceiveResponse:(NSArray *)serverResponse;
@end

@interface HTTPRequest : NSObject <NSURLConnectionDelegate>

@property (nonatomic, retain) id<HTTPRequestDelegate> delegate;

//Custom Methods
-(void) sendMessage:(NSString *)msg ToURL:(NSString *)url;
-(void) doGet:(NSString *)url;
@end
