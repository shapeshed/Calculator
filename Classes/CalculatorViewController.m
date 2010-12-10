//
//  CalculatorViewController.m
//  Calculator
//
//  Created by George Ornbo on 03/12/2010.
//  Copyright 2010 Pebble IT. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController


- (CalculatorBrain *)brain
{
    if (!brain) brain = [[CalculatorBrain alloc] init];
    return brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [[sender titleLabel] text];
    if (userIsInTheMiddleOfTypingANumber)
    {
        [display setText:[[display text] stringByAppendingString:digit]];
    }
    else
    {
        [display setText:digit];
        userIsInTheMiddleOfTypingANumber = YES;
    }
}

- (IBAction)decimalPlacePressed:(UIButton *)sender
{
	NSLog(@"digit pressed");
	UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Oh no!"  
													  message:@"You still need to implement floating points"  
													 delegate:nil  
											cancelButtonTitle:@"OK"  
											otherButtonTitles:nil];  
	
	[message show];  
	
	[message release];  
}

- (IBAction)operationPressed:(UIButton *)sender
{
    if (userIsInTheMiddleOfTypingANumber) {
        [[self brain] setOperand:[[display text] doubleValue]];
        userIsInTheMiddleOfTypingANumber = NO;
    }
    NSString *operation = [[sender titleLabel] text];
    double result = [[self brain] performOperation:operation];
    [display setText:[NSString stringWithFormat:@"%g", result]];
	[memoryDisplay setText:[NSString stringWithFormat:@"%g", brain.getStore]];
}



@end
