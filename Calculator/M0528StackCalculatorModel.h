//
//  M0528StackCalculatorModel.h
//  Calculator
//
//  Created by lab506 on 2014/5/28.
//  Copyright (c) 2014年 Mango. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface M0528StackCalculatorModel : NSObject
-(void) pushOperand:(double)operand;
-(double)performOperation:(NSString*)operation;
-(void) allClear;
@end
