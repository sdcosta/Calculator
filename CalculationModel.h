//
//  CalculationModel.h
//  Calculator
//
//  Created by Shouvik D'Costa on 12/8/2013.
//  Copyright (c) 2013 Shouvik D'Costa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculationModel : NSObject

@property NSString* resultScreen;
//@property (nonatomic, weak) NSString *arithmaticOperation; //don't really need this
//@property double lastInput;
@property BOOL isArithmaticButtonPressed;
//@property double result;
@property (nonatomic,strong) NSMutableArray* inputList;
@property BOOL resetResultScreen;

- (void)showResult;

- (void)clearAll;

- (void)decimalButtonPressed;

- (void)numberButtonPressed:(id)sender;

- (void)arithmaticButtonPressed:(id)sender;

- (void) performCalculation;

@end
