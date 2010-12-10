//
//  CalculatorBrain.h
//  Calculator
//
//  Created by George Ornbo on 03/12/2010.
//  Copyright 2010 Pebble IT. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {
    double operand;
    double store;
    NSString *waitingOperation; 
    double waitingOperand;

}

- (void)setOperand:(double)aDouble;
- (double)performOperation:(NSString *)operation;
- (double)getStore;

@end
