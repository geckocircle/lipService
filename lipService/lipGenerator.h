//
//  lipGenerator.h
//  lipServiceX
//
//  Created by Dave Rosborough on 27/02/05.
//  Copyright 2005 Dave Rosborough. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface lipGenerator : NSObject {
	NSArray *words;
	NSArray *sentences;
}

- (NSString *)generateParagraph;
- (NSString *)generateSentence;

@end
