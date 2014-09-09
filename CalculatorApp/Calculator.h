//
//  Calculator.h
//  CalculatorApp
//
//  Created by Jeffrey Shih on 8/31/14.
//  Copyright (c) 2014 Jeffrey Shih. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject{

    double memOperand;
    double currentOperand;
    double prevOperand;
    NSString * memOp;
    NSString * prevOp;
    BOOL perfEqual;

}

-(void)setOp:(double)someNum;
-(double)doOperations:(NSString *)operator;
-(void)doBasicOp;
-(double)getOperand;
-(void)setEqual;
-(void)clearAll;
-(void)doRepeatOps:(NSString *)oper;

@end
