//
//  lipServiceAppDelegate.h
//  lipService
//
//  Created by Dave Rosborough on 07/02/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class lipGenerator;

@interface lipServiceAppDelegate : NSObject <NSApplicationDelegate> {
    lipGenerator *gen;
}

@property (retain) lipGenerator *gen;


@end
