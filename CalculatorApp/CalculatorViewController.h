//
//  CalculatorViewController.h
//  CalculatorApp
//
//  Created by Jeffrey Shih on 8/31/14.
//  Copyright (c) 2014 Jeffrey Shih. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

@interface CalculatorViewController : UIViewController{
    Calculator *calc;
    BOOL hasDecimal;
    BOOL displayHasNums;
    double memory;
}

@end
