//
//  M0528StackCalculatorModel.m
//  Calculator
//
//  Created by lab506 on 2014/5/28.
//  Copyright (c) 2014年 Mango. All rights reserved.
//

#import "M0528StackCalculatorModel.h"

@interface M0528StackCalculatorModel ()
@property (nonatomic,strong) NSMutableArray* operandStack;
//必須宣告為strong 否則run完一次就會被消滅
@end

@implementation M0528StackCalculatorModel
-(NSMutableArray*) operandStack
{
    if(!_operandStack)
    {
        _operandStack=[NSMutableArray new];
    }
    return _operandStack;
}

-(void) allClear
{
    [self.operandStack removeAllObjects];
}

-(void) pushOperand:(double)operand
{
    NSNumber *operandObject=[NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
    NSLog(@"%@",self.operandStack);
}

-(double) popOperand
{
    NSNumber *operandObject=[self.operandStack lastObject];
    if(operandObject)
    {
        [self.operandStack removeLastObject];
    }
    return [operandObject doubleValue];
}

-(double)performOperation:(NSString *)operation
{
    double result=0;
    if([operation isEqualToString:@"+"])
    {
        result = [self popOperand]+[self popOperand];
    }
    if([operation isEqualToString:@"-"])
    {
        double fnum,Snum;
        Snum = [self popOperand];
        fnum = [self popOperand];
        result = fnum - Snum;
    }
    if([operation isEqualToString:@"*"])
    {
        result = [self popOperand]*[self popOperand];
    }
    if([operation isEqualToString:@"/"])
    {
        double fnum,Snum;
        Snum = [self popOperand];
        fnum = [self popOperand];
        result = fnum / Snum;
    }
    
    [self pushOperand:result];
    return result;
}
@end
