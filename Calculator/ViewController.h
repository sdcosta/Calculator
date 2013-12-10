//
//  ViewController.h
//  Calculator
//
//  Created by Shouvik D'Costa on 12/1/2013.
//  Copyright (c) 2013 Shouvik D'Costa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculationModel.h"

@interface ViewController : UIViewController{
    CalculationModel *model;
}

@property (nonatomic, strong) IBOutlet UILabel *resultScreen;

- (IBAction)numberButtonPressed:(id)sender;

- (IBAction)arithmaticButtonPressed:(id)sender;

- (IBAction)showResult:(id)sender;

- (IBAction)clearAll:(id)sender;

- (IBAction)decimalButtonPressed:(id)sender;
@end
