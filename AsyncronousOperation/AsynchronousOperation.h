//
//  AsynchronousOperation.h
//  Albany
//
//  Created by Matthew Dutton on 10/1/15.
//  Copyright © 2015 Echo Interaction Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AsynchronousOperation : NSOperation {
    BOOL executing;
    BOOL finished;
}

@property (nonatomic, strong) NSOperationQueue * callbackQueue;

- (void)finish;

@end
