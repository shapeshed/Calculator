//
//  CalculatorBrain.m
//  Calculator
//
//  Created by George Ornbo on 03/12/2010.
//  Copyright 2010 Pebble IT. All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain

// Sets the operand to whatever was passed in
- (void)setOperand:(double)aDouble
{ 
    operand = aDouble;
}

- (double)getStore
{
	return store;
}

// Performs Waiting operations
- (void)performWaitingOperation 
{
    if ([@"+" isEqual:waitingOperation])
    {
        operand = waitingOperand + operand;
    }
    else if ([@"*" isEqual:waitingOperation])
    {
        operand = waitingOperand * operand;
    }
    else if ([@"-" isEqual:waitingOperation])
    {
        operand = waitingOperand - operand;
    }
    else if ([@"/" isEqual:waitingOperation])
    {
        if (operand) {
            operand = waitingOperand / operand;
        }
    }
}

// Performs an operation on the operand based on the operation
- (double)performOperation:(NSString *)operation
{ 
    if ([@"sqrt" isEqual:operation]) 
    {
        operand = sqrt(operand); 
    } 
    else if ([@"+/-" isEqual:operation]) 
    {
        operand = - operand;
    }
    else if ([@"1/x" isEqual:operation]) 
    {
        if (operand) {        
            operand = 1 / operand;
        }
    }
    else if ([@"cos" isEqual:operation]) 
    {
        operand = cos(operand); 
    }
    else if ([@"sin" isEqual:operation]) 
    {
        operand = sin(operand); 
    }
    else if ([@"mc" isEqual:operation]) 
    {
        store = 0;
    }
    else if ([@"m+" isEqual:operation]) 
    {
        store = store + operand;
    }
    else if ([@"m-" isEqual:operation]) 
    {
        store = store - operand;
    }
    else if ([@"mr" isEqual:operation]) 
    {
        operand = store;
    }
    else if ([@"C" isEqual:operation]) 
    {
        operand = 0;
    }
    else
    {
        [self performWaitingOperation]; 
        waitingOperation = operation; 
        waitingOperand = operand;
    }
    return operand;
}

@end
