//
//  CalculationModel.m
//  Calculator
//
//  Created by Shouvik D'Costa on 12/8/2013.
//  Copyright (c) 2013 Shouvik D'Costa. All rights reserved.
//

#import "CalculationModel.h"

@implementation CalculationModel

//Must initialize NSMutableArray otherwise ARC will dispose
-(id)init {
    if ( self = [super init] ) {
        self.inputList = [NSMutableArray array];
    }
    return self;
}

//Called from ViewController when user clicks a number button
- (void)numberButtonPressed:(id)sender
{
    //If reset action is true then reset the screen
    if (self.resetResultScreen)
    {
        self.resultScreen = @"";
        self.resetResultScreen = false;
    }
    //Update the screen with numbers clicked
    self.resultScreen = [NSString stringWithFormat:@"%@%i",self.resultScreen, [sender tag]];
}

//Called from ViewController when user clicks +, -, x, /
- (void)arithmaticButtonPressed:(id)sender
{
    //If arithmatic button is already clicked then first perform the calculation with the associated values and operation
    if (self.isArithmaticButtonPressed)
    {
        [self performCalculation];
    }
    self.isArithmaticButtonPressed = true;
    
    //Wrapper needed to add object to array
    NSNumber *wrapper = [NSNumber numberWithDouble:[self.resultScreen doubleValue]];
    
    //Add the current value of the screen to the array
    [self.inputList addObject:wrapper];
    
    //Add a string of the type of operation pressed to the array
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

//Called when user clicks Result (=)
- (void)showResult
{
    //arithmatic button is no longer pressed
    self.isArithmaticButtonPressed = false;
    //perform calculation of two doubles and arithmatic operation in array
    [self performCalculation];
    //set the screen to reset
    self.resetResultScreen = true;
}

- (void)clearAll
{
    //reset the screen to 0
    self.resultScreen = @"0";
    //arithmatic button is no longer pressed
    self.isArithmaticButtonPressed = false;
    //set the screen to rest
    self.resetResultScreen = true;
    //remove all objects from the array
    [self.inputList removeAllObjects];
}

- (void) performCalculation
{
    //wrapper to add numerical objects to array
    NSNumber *wrapper = [NSNumber numberWithDouble:[self.resultScreen doubleValue]];
    [self.inputList addObject:wrapper];
    
    //holder variable to perform operations on numbers in array
    double result;
    result = [self.inputList[0] doubleValue];
    
    //iterate through the loop to perform a calculation
    //first index is always a number, second index is always an operation, third index is always a number
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
    
    //set the screen to be the value of the result
    self.resultScreen = [NSString stringWithFormat:@"%g", result];
    //remove all objects from the awway
    [self.inputList removeAllObjects];
    //get the new result and add it to the first index of the array
    wrapper = [NSNumber numberWithDouble:result];
    [self.inputList addObject:wrapper];
}

- (void)decimalButtonPressed
{
    //If the current number being displayed is not a decimal then allow the user to add a decimal
    if (fmod([self.resultScreen doubleValue],1) == 0)
    {
        self.resultScreen = [NSString stringWithFormat:@"%@%@",self.resultScreen, @"."];
    }
}

@end
