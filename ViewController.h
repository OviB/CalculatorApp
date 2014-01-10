//
//  ViewController.h
//  Calculator
//
//  Created by LDC on 7/25/13.
//  Copyright (c) 2013 Todd Perkins. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, operationType){
    operationNone = 0,
    operationPlus,
    operationMinus,
    operationMultiply
    
};

@interface ViewController : UIViewController
{
    int total;
    operationType _theOperation;
    NSString *valueString;
    IBOutlet UILabel *label;
    BOOL lastButtonWAsMode;
}

- (IBAction)tappedClear:(id)sender;
- (IBAction)tappedNumber:(UIButton*)btn;
- (IBAction)tappedPlus:(id)sender;
- (IBAction)tappedMinus:(id)sender;
- (IBAction)tappedMultiply:(id)sender;
- (IBAction)tappedEquals:(id)sender;

@end
