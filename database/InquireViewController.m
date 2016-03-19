//
//  ViewController.m
//  database
//
//  Created by lololol on 12/22/15.
//  Copyright © 2015 Kenny Huang. All rights reserved.
//

#import "ViewController.h"
#define ip @"http://foodjoinu.gear.host/lol.php"
@interface ViewController ()
{
    NSData *datas;
    NSMutableArray *info;
}
@end

@implementation ViewController

-(void)setVaule:(int)count :(NSString *)response
{
    if (count == 0)
        _preorder.text = [NSString stringWithFormat:@"預約代號：%@", response];
    else if (count == 1)
        _user.text = [NSString stringWithFormat:@"預約者：%@", response];
    else if (count == 2)
        _dish.text = [NSString stringWithFormat:@"餐點：%@", response];
    else if (count == 3)
        _output.text = [NSString stringWithFormat:@"餐廳：%@", response];
    else if (count == 4)
        _price.text = [NSString stringWithFormat:@"價格：%@", response];
}

-(IBAction)inquireButtonPressed:(id)sender
{
    int count;
    for (count = 0; count < 5; count++)
    {
        NSString *post =[NSString stringWithFormat: @"rID=%@&count=%i", _input.text, count];
        NSData *datans = [NSData dataWithBytes: [post UTF8String] length: [post length]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: ip]];
        [request setHTTPMethod: @"POST"];
        [request setHTTPBody: datans];
        NSData *returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
        NSString *response = [[NSString alloc] initWithBytes:[returnData bytes] length:[returnData length] encoding:NSUTF8StringEncoding];
        if (!response)
        {
            _preorder.text = @"查無資料";
            _user.text = @"";
            _dish.text = @"";
            _output.text = @"";
            _price.text = @"";
            break;
        }
        [self setVaule:count :response];
    }
}

- (IBAction)submitButtonPressed:(id)sender
{
    NSString *post =[NSString stringWithFormat: @"user=%@&dish=%@", _inputUser.text, _inputDish.text];
    NSData *datans = [NSData dataWithBytes: [post UTF8String] length: [post length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: ip]];
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody: datans];
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse: nil error: nil];
    NSString *response = [[NSString alloc] initWithBytes:[returnData bytes] length:[returnData length] encoding:NSUTF8StringEncoding];
    if ([response isEqual:@"success"])
        _message.text = @"傳送成功！";
    else if ([response isEqual:@"failed"])
        _message.text = @"傳送失敗";
    
}
@end
