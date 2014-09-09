//
//  CalculatorViewController.m
//  CalculatorApp
//
//  Created by Jeffrey Shih on 8/31/14.
//  Copyright (c) 2014 Jeffrey Shih. All rights reserved.
//

#import "CalculatorViewController.h"
#import "Calculator.h"



@interface CalculatorViewController ()

@property (strong, nonatomic) IBOutlet UILabel *calculatorDisplay;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *functions;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *operations;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *numbers;

- (void)addButtonBordersToCalculatorButtons:(NSArray *)buttons;


- (IBAction)numberPressed:(id)sender;
- (IBAction)operationPressed:(id)sender;
@end



@implementation CalculatorViewController
- (Calculator *) calc{
    if (!calc){
        calc = [[Calculator alloc] init];
    }
    return calc;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self addButtonBordersToCalculatorButtons:self.operations];
    [self addButtonBordersToCalculatorButtons:self.functions];
    [self addButtonBordersToCalculatorButtons:self.numbers];
    hasDecimal = NO;
    displayHasNums = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Initialization

- (void)addButtonBordersToCalculatorButtons:(NSArray *)buttons
{
    for (UIButton *button in buttons) {
        [[button layer] setBorderWidth:0.25f];
        [[button layer] setBorderColor:[UIColor blackColor].CGColor];
    }
}

#pragma mark - IBActions

- (IBAction)numberPressed:(id)sender{
    UIButton *buttonPressed = (UIButton *)sender;

    
    NSString *num = buttonPressed.titleLabel.text;
    if (displayHasNums){
        _calculatorDisplay.text = [_calculatorDisplay.text stringByAppendingString:num];
    }
    else{
        if (![num isEqual:@"0"]){
            [_calculatorDisplay setText:num];
            displayHasNums = YES;
        }

    }
    [[self calc] setEqual];
}

- (IBAction)decimalPressed:(id)sender{
    if (hasDecimal == NO){
        if (displayHasNums == NO){
            displayHasNums = YES;
            [_calculatorDisplay setText:@"0."];
        }
        else{
            _calculatorDisplay.text = [_calculatorDisplay.text stringByAppendingString:@"." ];
        }
        hasDecimal = YES;
    }
    [[self calc] setEqual];

}

-(IBAction)clearDisplay{
    if (displayHasNums == NO && [[self calc] getOperand] != 0){
        //ALL CLEAR
        [[self calc] clearAll];
    }
    _calculatorDisplay.text = @"0";
    displayHasNums = NO;
}

- (IBAction)operationPressed:(id)sender{
    if (displayHasNums){
        [[self calc] setOp:[[_calculatorDisplay text] doubleValue]];
        hasDecimal = NO;
        displayHasNums = NO;
    }
    NSString * operation = [[sender titleLabel] text];
    double summation = [[self calc] doOperations:operation];
    [_calculatorDisplay setText:[NSString stringWithFormat:@"%g", summation]];
}


@end
