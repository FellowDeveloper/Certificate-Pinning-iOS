//
//  ViewController.m
//  CertificatePinning
//
//  Created by Anton Tugolukov on 05/01/2017.
//  Copyright © 2017 Anton Tugolukov. All rights reserved.
//

#import "ViewController.h"
#import "SGSessionDelegate.h"

@interface ViewController ()

@property (nonatomic, strong) NSURLSessionTask* task;

- (void) startRequest;
- (void) stopRequest;

@end

@implementation ViewController

- (void) startRequest
{
    [self stopRequest];
    
    NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    SGSessionDelegate* sessionDelegate = [[SGSessionDelegate alloc] init];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:sessionConfig
                                                          delegate:sessionDelegate
                                                     delegateQueue:nil];
    
    NSURL* url = [NSURL URLWithString:@"https://github.com/FellowDeveloper/Certificate-Pinning-iOS.git"];
    NSURLRequest* demoRequest = [NSURLRequest requestWithURL:url];
    
    
    NSURLSessionTask* task = [session dataTaskWithRequest:demoRequest
                                        completionHandler:^(NSData* _data, NSURLResponse* _response, NSError* _error) {
                                            NSLog(@"Response:%@\nError:%@\n", _response, _error);
                                        }];
    [task resume];
}

- (void) stopRequest
{
    if (self.task) {
        [self.task suspend];
        self.task = nil;
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self startRequest];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self stopRequest];
}


@end
