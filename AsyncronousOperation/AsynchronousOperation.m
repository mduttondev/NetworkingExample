//
//  AsynchronousOperation.m
//  Albany
//
//  Created by Matthew Dutton on 10/1/15.
//  Copyright © 2015 Echo Interaction Group. All rights reserved.
//

#import "AsynchronousOperation.h"

@implementation AsynchronousOperation

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        executing = NO;
        
        finished = NO;
        
    }
    
    return self;
    
}

- (void)start {
    
    if ([self isCancelled]) {
        
        [self willChangeValueForKey:@"isFinished"];
        
        finished = YES;
        
        [self didChangeValueForKey:@"isFinished"];
        
        return;
        
    }
    
    [self willChangeValueForKey:@"isExecuting"];
    
    executing = YES;
    
    [self main];
    
    [self didChangeValueForKey:@"isExecuting"];
    
}

- (void)finish {
    
    [self willChangeValueForKey:@"isFinished"];
    
    [self willChangeValueForKey:@"isExecuting"];
    
    executing = NO;
    
    finished = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
    
    [self didChangeValueForKey:@"isFinished"];
    
}

- (BOOL)asynchronous {
    
    return YES;
    
}

- (BOOL)isConcurrent {
    
    return YES;
    
}

- (BOOL)isExecuting {
    
    return executing;
    
}

- (BOOL)isFinished {
    
    return finished;
    
}

#pragma mark - Server Operation

- (NSOperationQueue *)callbackQueue {
    
    if (_callbackQueue != nil) {
        
        return _callbackQueue;
        
    }
    
    return [NSOperationQueue mainQueue];
    
}

@end
