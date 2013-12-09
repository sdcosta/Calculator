//
//  ViewController.m
//  Calculator
//
//  Created by Shouvik D'Costa on 12/1/2013.
//  Copyright (c) 2013 Shouvik D'Costa. All rights reserved.
//

#import "ViewController.h"
#import <math.h>

@interface ViewController ()

@end
@implementation ViewController
@synthesize resultScreen, arithmaticOperation, lastInput, isArithmaticButtonPressed, result, inputList, resetResultScreen;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.inputList = [NSMutableArray array];
    self.resetResultScreen = true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberButtonPressed:(id)sender
{
    if (self.resetResultScreen)
    {
        self.resultScreen.text = @"";
        self.resetResultScreen = false;
    }
    self.resultScreen.text = [NSString stringWithFormat:@"%@%i",self.resultScreen.text, [sender tag]];
}

- (IBAction)arithmaticButtonPressed:(id)sender
{
    if (self.isArithmaticButtonPressed)
    {
        [self performCalculation];
    }
    self.isArithmaticButtonPressed = true;
    
    self.lastInput = [self.resultScreen.text doubleValue];
    NSNumber *wrapper = [NSNumber numberWithDouble:self.lastInput];
    
    [self.inputList addObject:wrapper];
    self.lastInput = [self.resultScreen.text doubleValue];
    
    switch ([sender tag])
    {
        case 10:
            self.arithmaticOperation = @"add";
            break;
            
        case 11:
            self.arithmaticOperation = @"subtract";
            break;
            
        case 12:
            self.arithmaticOperation = @"multiply";
            break;
        
        case 13:
            self.arithmaticOperation = @"divide";
            break;
    }
    [self.inputList addObject:self.arithmaticOperation];
    self.resetResultScreen = true;
}

- (IBAction)showResult:(id)sender
{
    self.isArithmaticButtonPressed = false;
    [self performCalculation];
    self.resetResultScreen = true;
}

- (IBAction)clearAll:(id)sender
{
    self.result = 0;
    self.lastInput = 0;
    self.resultScreen.text = @"0";
    self.isArithmaticButtonPressed = false;
    self.resetResultScreen = true;
    [self.inputList removeAllObjects];
}

- (void) performCalculation
{
    self.lastInput = [self.resultScreen.text doubleValue];
    NSNumber *wrapper = [NSNumber numberWithDouble:self.lastInput];
    [self.inputList addObject:wrapper];
    
    self.result = [self.inputList[0] doubleValue];
    
    for (int i=0; i < [self.inputList count]; i++)
    {
        if ([self.inputList[i] isEqual:@"add"])
        {
            self.result += [self.inputList[i+1] doubleValue];
        }
        else if ([self.inputList[i] isEqual:@"subtract"])
        {
            self.result -= [self.inputList[i+1] doubleValue];
        }
        else if ([self.inputList[i] isEqual:@"multiply"])
        {
            self.result *= [self.inputList[i+1] doubleValue];
        }
        else if ([self.inputList[i] isEqual:@"divide"])
        {
            self.result /= [self.inputList[i+1] doubleValue];
        }
    }
    
    self.resultScreen.text = [NSString stringWithFormat:@"%g", self.result];
    self.lastInput = [self.resultScreen.text doubleValue];
    [self.inputList removeAllObjects];
    wrapper = [NSNumber numberWithDouble:self.lastInput];
    [self.inputList addObject:wrapper];
}

- (IBAction)decimalButtonPressed:(id)sender
{
    if (fmod([self.resultScreen.text doubleValue],1) == 0)
    {
        self.resultScreen.text = [NSString stringWithFormat:@"%@%@",self.resultScreen.text, @"."];
    }
}
@end
