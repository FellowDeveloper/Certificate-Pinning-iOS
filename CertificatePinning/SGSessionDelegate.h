//
//  SGSessionDelegate.h
//  CertificatePinning
//
//  Created by Anton Tugolukov on 05/01/2017.
//  Copyright © 2017 Anton Tugolukov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SGSessionDelegate : NSObject<NSURLSessionDelegate>

-(void)URLSession:(NSURLSession * _Nullable)session
didReceiveChallenge:(NSURLAuthenticationChallenge * _Nullable)challenge
completionHandler:(void (^ _Nullable)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler;

@end
