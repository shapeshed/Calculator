//
//  CalculatorViewController.h
//  Calculator
//
//  Created by George Ornbo on 03/12/2010.
//  Copyright 2010 Pebble IT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface CalculatorViewController : UIViewController {
    IBOutlet UILabel *display;
    IBOutlet UILabel *memoryDisplay;
    CalculatorBrain *brain;
    BOOL userIsInTheMiddleOfTypingANumber;
}
- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)decimalPlacePressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;


@end
