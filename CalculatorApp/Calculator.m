//
//  Calculator.m
//  CalculatorApp
//
//  Created by Jeffrey Shih on 8/31/14.
//  Copyright (c) 2014 Jeffrey Shih. All rights reserved.
//

#import "Calculator.h"

@interface Calculator()

@end

@implementation Calculator

-(void)setEqual{
    perfEqual = NO;
}

-(void)setOp:(double)someNum{
    memOperand = someNum;
}

-(double)getOperand{
    return memOperand;
}

-(double)doOperations:(NSString *)operator{

    if ([operator isEqualToString:@"+/-"] && memOperand != 0){
        memOperand = memOperand * -1;
    }
    else if ([operator isEqualToString:@"%"]){
        memOperand = (memOperand / 100);
    }
    else{
        if (![operator isEqualToString:@"="] && perfEqual == YES){
            perfEqual = NO;
        }
        else{
            
        }
        if (perfEqual == YES){

            [self doRepeatOps:prevOp];

        }
        else{
            prevOp = memOp;
            if ([operator isEqualToString:@"="]){
                perfEqual = YES;
            }
            [self doBasicOp];
            currentOperand = memOperand;
            memOp = operator;
        }
    }
    return memOperand;

}

-(void)doRepeatOps:(NSString *)oper{
    if ([@"+" isEqual:oper]){

        memOperand = prevOperand + memOperand;
    }
    else if  ([@"-" isEqual:oper]){
        memOperand = memOperand - prevOperand;
    }
    else if  ([@"X" isEqual:oper]){
        memOperand = memOperand * prevOperand;
    }
    else if  ([@"/" isEqual:oper]){
        if (currentOperand != 0){
            memOperand = memOperand / prevOperand;
        }
    }
}

-(void)clearAll{
    memOp = @"";
    currentOperand = 0;
    memOperand = 0;
}


-(void)doBasicOp{
    prevOperand = memOperand;
    if ([@"+" isEqual:memOp]){
        memOperand = memOperand + currentOperand;
    }
    else if  ([@"-" isEqual:memOp]){
        memOperand = currentOperand - memOperand;
    }
    else if  ([@"X" isEqual:memOp]){
        memOperand = memOperand * currentOperand;
    }
    else if  ([@"/" isEqual:memOp]){
        if (currentOperand != 0){
            memOperand = currentOperand / memOperand;
        }
    }
}
@end
