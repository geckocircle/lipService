//
//  lipServiceAppDelegate.m
//  lipService
//
//  Created by Dave Rosborough on 07/02/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "lipServiceAppDelegate.h"
#import "lipGenerator.h"

@implementation lipServiceAppDelegate

@synthesize gen;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.gen = [[lipGenerator alloc] init];
    [NSApp setServicesProvider:self.gen];

}

@end
