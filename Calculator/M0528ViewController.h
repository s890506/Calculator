//
//  M0528ViewController.h
//  Calculator
//
//  Created by lab506 on 2014/5/28.
//  Copyright (c) 2014年 Mango. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface M0528ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *display;
//IBOutlet對編譯器無任何意義，自動產生。但是對Xcode有意義，這是告訴Xcode這個物件存在storyboard這邊
//必須要有weak 記憶體才會被釋放
- (IBAction)digitPressed:(UIButton *)sender;
//可以選擇UIButton或ID，這邊選UIButton的原因是為了要讓編譯器檢查
- (IBAction)clearPress:(id)sender;
- (IBAction)optrationPressed:(UIButton *)sender;
- (IBAction)pushPressed:(UIButton *)sender;
- (IBAction)allClearPressed:(UIButton *)sender;
@end
