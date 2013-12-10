//
//  ViewController.m
//  Calculator
//
//  Created by Shouvik D'Costa on 12/1/2013.
//  Copyright (c) 2013 Shouvik D'Costa. All rights reserved.
//

#import "ViewController.h"
#import <math.h>
#import "CalculationModel.h"

@interface ViewController ()

@end
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Initialize model
    model = [[CalculationModel alloc]init];
    model.resetResultScreen = true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberButtonPressed:(id)sender
{
    [model numberButtonPressed:sender];
    self.resultScreen.text = model.resultScreen;
}

- (IBAction)arithmaticButtonPressed:(id)sender
{
    [model arithmaticButtonPressed:sender];
    self.resultScreen.text = model.resultScreen;
}

- (IBAction)showResult:(id)sender
{
    [model showResult];
    self.resultScreen.text = model.resultScreen;
}

- (IBAction)clearAll:(id)sender
{
    [model clearAll];
    self.resultScreen.text = model.resultScreen;
}

- (void) performCalculation
{
    [model performCalculation];
    self.resultScreen.text = model.resultScreen;
}

- (IBAction)decimalButtonPressed:(id)sender
{
    [model decimalButtonPressed];
    self.resultScreen.text = model.resultScreen;
}
@end
