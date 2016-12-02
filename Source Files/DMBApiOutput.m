//
//  DMBApiOutput.m
//  DumbLogger
//
//  Created by Igor Ferreira on 01/12/16.
//  Copyright © 2016 Igor Ferreira. All rights reserved.
//

#import "DMBApiOutput.h"
@import AFNetworking;

@interface DMBApiOutput ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation DMBApiOutput


- (BOOL)putString:(NSString *)message
{
    NSDictionary<NSString *, NSString *> *parameters = @{@"number":@"5551234567", @"message":message};
    
    [self.sessionManager POST:@"/text"
                   parameters:parameters
                     progress:nil
                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                          NSLog(@"Succes: %@", responseObject);
                      }
                      failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                          NSLog(@"Failure: %@", error.debugDescription);
                      }];
    
    return YES;
}

- (AFHTTPSessionManager *)sessionManager
{
    if (self->_sessionManager == nil) {
        NSURL *URL = [NSURL URLWithString:@"https://textbelt.com/"];
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:URL];
        self->_sessionManager = manager;
    }
    
    return self->_sessionManager;
}

@end
