//
//  ViewController.m
//  Calculator
//
//  Created by LDC on 7/25/13.
//  Copyright (c) 2013 Todd Perkins. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    valueString = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tappedClear:(id)sender
{
    total = 0;
    valueString = @"";
    label.text = @"0";
}
- (IBAction)tappedNumber:(UIButton*)btn
{
    // Take the tag and use it as the number pressed
    int num = btn.tag;
    
    // If num and total = 0 do nothing
    if (num == 0 && total == 0)
        return;
    
    // If lastButtonWasMode, turn it off and set the valueString to empty
    if (lastButtonWAsMode) {
        lastButtonWAsMode = NO;
        valueString = @"";
    }
    
    // Turn it into a NSString and append them
    NSString *numAsString = [NSString stringWithFormat:@"%i", num];
    valueString = [valueString stringByAppendingString:numAsString];
    
    /**********************************************************************/
    /********************* NSNumberFormatter EXAMPLE **********************/
    /**********************************************************************/
    /**********************************************************************/
    /**/    // Create NSNumberFormatter and formate te number           /**/
    /**/    NSNumberFormatter *formatter = [NSNumberFormatter new];     /**/
    /**/    // Add commas every 3 digets                                /**/
    /**/    formatter.numberStyle = NSNumberFormatterDecimalStyle;      /**/
    /**/    NSNumber *n = [formatter numberFromString:valueString];     /**/
    /**/    label.text = [formatter stringFromNumber:n];                /**/
    /**********************************************************************/
    
    // Now chnage the total
    if (total == 0)
        total = [valueString intValue];
    
}
- (IBAction)tappedPlus:(id)sender
{
    
    self.theOperation = operationPlus;
}
- (IBAction)tappedMinus:(id)sender
{
    
    self.theOperation = operationMinus;
}
- (IBAction)tappedMultiply:(id)sender
{
    
    self.theOperation = operationMultiply;
}
- (IBAction)tappedEquals:(id)sender
{
    switch (_theOperation) {
        case operationNone:
            return;
            break;
        case operationPlus:
            total += [valueString intValue];
            break;
        case operationMinus:
            total -= [valueString intValue];
            break;
        case operationMultiply:
            total *= [valueString intValue];
            break;
        default:
            NSLog(@"Operation Error");
            break;
    }
    
    // Set label to total and mode to 0
    valueString = [NSString stringWithFormat:@"%i",total];
    // Create NSNumberFormatter and formate te number
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    // Add commas every 3 digets
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *n = [formatter numberFromString:valueString];
    
    label.text = [formatter stringFromNumber:n];
    self.theOperation = operationNone;
}

- (void)setTheOperation:(operationType)theOperation
{
    if (total == 0)
        return;
    
    _theOperation = theOperation;
    lastButtonWAsMode = YES;
    total = [valueString intValue];
}

@end
