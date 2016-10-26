//
//  NetworkingCoordinator.m
//  Albany
//
//  Created by Matthew Dutton on 10/1/15.
//  Copyright © 2015 Echo Interaction Group. All rights reserved.
//

#import "NetworkingCoordinator.h"


@interface NetworkingCoordinator ()

@property (nonatomic, strong) NSOperationQueue * operationQueue;

@end



@implementation NetworkingCoordinator


+ (instancetype)sharedCoordinator {
    
    static id sharedCoordinator;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedCoordinator = [self new];
        
    });
    
    return sharedCoordinator;
    
}



//create an operation queue here. Give its properties and return itk
- (NSOperationQueue *)operationQueue {
    
    if (_operationQueue != nil) {
        
        return _operationQueue;
        
    }
    
    _operationQueue = [NSOperationQueue new];
    
    _operationQueue.maxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentOperationCount;
    
    _operationQueue.name = @"Server Operation Queue";
    
    return _operationQueue;
    
}

// method that adds the operation we just created to the async operation param.
-(void)addOperation:(AsynchronousOperation*)operation {
    
    [self.operationQueue addOperation:operation];
    
}

@end
