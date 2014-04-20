//
//  HTTPRequest.m
//  Employee Photo Uploader
//
//  Created by Fernando Dingler on 11/11/13.
//  Copyright (c) 2013 Deo Consultores. All rights reserved.
//

#import "HTTPRequest.h"

@implementation HTTPRequest

NSString *serverURL = @"http://54.86.66.130:8080/";
NSMutableData *webData;


-(void) sendMessage:(NSString *)msg ToURL:(NSString *)url
{
    webData = [NSMutableData data];
    
    NSLog(@"Sending: %@", msg);
    
    NSString *serverurl = [serverURL stringByAppendingString:url];
    
    NSLog(@"dest: %@", serverurl);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:serverurl]];
    
    NSString *params = [[NSString alloc] initWithFormat:@"data=%@", msg];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(!theConnection){
        NSLog(@"Connection error.");
    }
}

-(void) doGet:(NSString *)url
{
    webData = [NSMutableData data];
    
    NSString *serverurl = [serverURL stringByAppendingString:url];
    
    NSLog(@"dest: %@", serverurl);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:serverurl]];
    
    [request setHTTPMethod:@"GET"];
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(!theConnection){
        NSLog(@"Connection error.");
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength: 0];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *error;
    NSArray *response = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&error];
    
    [_delegate didReceiveResponse:response];
}

@end