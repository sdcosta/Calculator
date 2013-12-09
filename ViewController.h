//
//  ViewController.h
//  Calculator
//
//  Created by Shouvik D'Costa on 12/1/2013.
//  Copyright (c) 2013 Shouvik D'Costa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *resultScreen;
@property (nonatomic, weak) NSString *arithmaticOperation; //don't really need this
@property double lastInput;
@property BOOL isArithmaticButtonPressed;
@property double result;
@property (nonatomic,strong) NSMutableArray* inputList;
@property BOOL resetResultScreen;

- (IBAction)numberButtonPressed:(id)sender;

- (IBAction)arithmaticButtonPressed:(id)sender;

- (IBAction)showResult:(id)sender;

- (IBAction)clearAll:(id)sender;

- (IBAction)decimalButtonPressed:(id)sender;
@end
