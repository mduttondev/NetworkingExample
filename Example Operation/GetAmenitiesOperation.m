//
//  GetAmenitiesOperation.m
//  Albany
//
//  Created by Matthew Dutton on 10/16/15.
//  Copyright © 2015 Echo Interaction Group. All rights reserved.
//

#import "GetAmenitiesOperation.h"

@implementation GetAmenitiesOperation

- (void)main {
    
    PFQuery * amenQuery = [PFQuery queryWithClassName:@"Amenity"];
    
    amenQuery.cachePolicy = kPFCachePolicyCacheThenNetwork;
    
    
    [amenQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        if (!error && [objects count] > 0) {
            
            [self finishWithEntries:objects];
            
        } else {
            if (error.code == kPFErrorCacheMiss) {
                NSLog(@"AMENITY Cache Miss");
            } else {
                NSLog(@"AMENITY ERROR");
            }
            [self finishWithError:error];
        }
        
    }];
    
    
}

- (void)finishWithEntries:(NSArray*)entries{
    
    [self.callbackQueue addOperationWithBlock:^{
        
        if (self.successBlock) {
            
            self.successBlock(entries);
            
        }
        
    }];
    
    [self finish];
    
}

- (void)finishWithError:(NSError *)error {
    
    [self.callbackQueue addOperationWithBlock:^{
        
        if (self.errorBlock) {
            
            self.errorBlock(error);
            
        }
        
    }];
    
    [self finish];
    
}



@end
