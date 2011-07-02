//
//  lipGenerator.m
//  lipServiceX
//
//  Created by Dave Rosborough on 27/02/05.
//  Copyright 2005 Dave Rosborough. All rights reserved.
//

#import "lipGenerator.h"


@implementation lipGenerator

- (id)init
{
	self = [super init];
	if (self != nil) {
		NSString *wordFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"greekeddictionary" ofType:@"txt"]
                                                       encoding:NSUTF8StringEncoding
                                                          error:NULL];
		words = [[wordFile componentsSeparatedByString:@"\n"] retain];
		
		NSString *sentFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sentence" ofType:@"txt"]
                                                       encoding:NSUTF8StringEncoding
                                                          error:NULL];
		sentences = [[sentFile componentsSeparatedByString:@"\n"] retain];
		
		unsigned int seed = (unsigned int)[NSDate timeIntervalSinceReferenceDate];
		srandom(seed);
		
	}
	return self;
}

- (void)generateParagraph:(NSPasteboard *)pboard
				 userData:(NSString *)data
					error:(NSString **)error
{
    [pboard clearContents];
    [pboard writeObjects:[NSArray arrayWithObject:[self generateParagraph]]];
    

//	[pboard declareTypes:[NSArray arrayWithObject:NSPasteboardTypeString] 
//				   owner:nil];
//	[pboard setString:[self generateParagraph] forType:NSPasteboardTypeString];
	
	return;
}

- (void)generateSentence:(NSPasteboard *)pboard
				userData:(NSString *)data
				   error:(NSString **)error
{
	[pboard clearContents];
    [pboard writeObjects:[NSArray arrayWithObject:[self generateSentence]]];
//    [pboard addTypes:[NSArray arrayWithObject:NSPasteboardTypeString] owner:self];

//	[pboard declareTypes:[NSArray arrayWithObject:NSStringPboardType] 
//				   owner:nil];
//	[pboard setString:[self generateSentence] forType:NSStringPboardType];
	
//	return;
}

- (NSString *)generateSentence
{
	NSRange wRange;
	unsigned long int wordIndex;
	// Choose sentence structure from sentence array
	unsigned long sentenceIndex = (random() % [sentences count]);
	
	NSMutableString *sent = [NSMutableString stringWithString:[sentences objectAtIndex:sentenceIndex]];
	
	// Populate it with words from word array
	while (1) {
		wRange = [sent rangeOfString:@"w"];

		if (wRange.location == NSNotFound) {
			break;
		}
		wordIndex = (random() % [words count]);
		[sent replaceCharactersInRange:wRange withString:[words objectAtIndex:wordIndex]];
	}
	// Capitalize first letter of first word
	NSMutableArray *sentArray = [[[sent componentsSeparatedByString:@" "] mutableCopy] autorelease];
	[sentArray replaceObjectAtIndex:0 withObject:[[sentArray objectAtIndex:0] capitalizedString]];
	
    
	return [sentArray componentsJoinedByString:@" "];
    
}

- (NSString *)generateParagraph
{
	int sentenceCount = ((int)random() % 7) + 3;
	int i;
	NSMutableString *para = [NSMutableString string];
	
	for (i=0; i<sentenceCount; i++) {
		[para appendString:[self generateSentence]];
	}
	
	return para;
}

@end
