//
//  CalculationModel.m
//  Calculator
//
//  Created by Shouvik D'Costa on 12/8/2013.
//  Copyright (c) 2013 Shouvik D'Costa. All rights reserved.
//

#import "CalculationModel.h"

@implementation CalculationModel

-(id)init {
    if ( self = [super init] ) {
        self.inputList = [NSMutableArray array];
    }
    return self;
}

- (void)numberButtonPressed:(id)sender
{
    if (self.resetResultScreen)
    {
        self.resultScreen = @"";
        self.resetResultScreen = false;
    }
    self.resultScreen = [NSString stringWithFormat:@"%@%i",self.resultScreen, [sender tag]];
}

- (void)arithmaticButtonPressed:(id)sender
{
    if (self.isArithmaticButtonPressed)
    {
        [self performCalculation];
    }
    self.isArithmaticButtonPressed = true;
    
    //self.lastInput = [self.resultScreen doubleValue];
    NSNumber *wrapper = [NSNumber numberWithDouble:[self.resultScreen doubleValue]];
    
    [self.inputList addObject:wrapper];
    //self.lastInput = [self.resultScreen doubleValue];
    
    switch ([sender tag])
    {
        case 10:
            [self.inputList addObject:@"add"];
            break;
            
        case 11:
            [self.inputList addObject:@"subtract"];
            break;
            
        case 12:
            [self.inputList addObject:@"multiply"];
            break;
            
        case 13:
            [self.inputList addObject:@"divide"];
            break;
    }
    self.resetResultScreen = true;
}

- (void)showResult
{
    self.isArithmaticButtonPressed = false;
    [self performCalculation];
    self.resetResultScreen = true;
}

- (void)clearAll
{
    //self.result = 0;
    //self.lastInput = 0;
    self.resultScreen = @"0";
    self.isArithmaticButtonPressed = false;
    self.resetResultScreen = true;
    [self.inputList removeAllObjects];
}

- (void) performCalculation
{
    //self.lastInput = [self.resultScreen doubleValue];
    NSNumber *wrapper = [NSNumber numberWithDouble:[self.resultScreen doubleValue]];
    [self.inputList addObject:wrapper];
    
    double result;
    result = [self.inputList[0] doubleValue];
    
    for (int i=0; i < [self.inputList count]; i++)
    {
        if ([self.inputList[i] isEqual:@"add"])
        {
            result += [self.inputList[i+1] doubleValue];
        }
        else if ([self.inputList[i] isEqual:@"subtract"])
        {
            result -= [self.inputList[i+1] doubleValue];
        }
        else if ([self.inputList[i] isEqual:@"multiply"])
        {
            result *= [self.inputList[i+1] doubleValue];
        }
        else if ([self.inputList[i] isEqual:@"divide"])
        {
            result /= [self.inputList[i+1] doubleValue];
        }
    }
    
    self.resultScreen = [NSString stringWithFormat:@"%g", result];
    //self.lastInput = [self.resultScreen doubleValue];
    [self.inputList removeAllObjects];
    wrapper = [NSNumber numberWithDouble:[self.resultScreen doubleValue]];
    [self.inputList addObject:wrapper];
}

- (void)decimalButtonPressed
{
    if (fmod([self.resultScreen doubleValue],1) == 0)
    {
        self.resultScreen = [NSString stringWithFormat:@"%@%@",self.resultScreen, @"."];
    }
}

@end
