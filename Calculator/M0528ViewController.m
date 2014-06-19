//
//  M0528ViewController.m
//  Calculator
//
//  Created by lab506 on 2014/5/28.
//  Copyright (c) 2014年 Mango. All rights reserved.
//

#import "M0528ViewController.h"
#import "M0528StackCalculatorModel.h"

@interface M0528ViewController ()
@property (nonatomic,strong) M0528StackCalculatorModel *calculator;

@end

@implementation M0528ViewController
{
    BOOL firstClick;
    NSString *optration;
}

-(M0528StackCalculatorModel*)calculator
{
    if (!_calculator) {
        _calculator=[M0528StackCalculatorModel new];
    }
    return _calculator;
}

- (IBAction)allClearPressed:(UIButton *)sender {
    firstClick=YES;
    self.display.text=@"0";
    [self.calculator init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    firstClick=YES;
    optration=@"";
	// Do any additional setup after loading the view, typically from a nib.
    //self.display.text=@"example"; //測試初始化用
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)digitPressed:(UIButton *)sender//0~9 button
{
    NSString *digit=[sender currentTitle];
    //NSLog(@"%@ ,digit pressed.",digit); //debug用
    if(firstClick)
    {
        self.display.text=digit;
        firstClick=NO;
    }
    else
    {
        self.display.text=[self.display.text stringByAppendingString:digit];
    }
}
- (IBAction)clearPress:(id)sender {//Clearn button
    self.display.text=@"0";
    firstClick=YES;
}

- (IBAction)optrationPressed:(UIButton *)sender {//+ - * / button
    if (!firstClick) {
        [self.calculator pushOperand:[self.display.text doubleValue]];
        firstClick=YES;
    }
    optration = [sender currentTitle];

    }

- (IBAction)pushPressed:(UIButton *)sender {// = button
    [self.calculator pushOperand:[self.display.text doubleValue]];
    firstClick=YES;
    
    double result=[self.calculator performOperation:optration];
    NSLog(@"%@", [sender currentTitle]);
    self.display.text=[NSString stringWithFormat:@"%g",result];

}
@end
