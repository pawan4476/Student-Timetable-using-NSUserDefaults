//
//  ViewController.m
//  Student TimeTable
//
//  Created by Nagam Pawan on 9/27/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
      [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    for (int i = 0; i <54; i++) {
    NSString *myString = [defaults objectForKey:[NSString stringWithFormat:@"%d", i]];
        [[self.button objectAtIndex:i] setTitle:myString forState:UIControlStateNormal];
    NSLog(@"%@", myString);
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonPressed:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Time Table" message:@"Enter the Subject" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = NSLocalizedString(@"Enter Subject", @"Enter");
        [textField addTarget:self action:@selector(alertTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        UITextField *name = [alert.textFields objectAtIndex:0];
        [[self.button objectAtIndex:[sender tag]] setTitle:name.text forState:UIControlStateNormal];
        NSUserDefaults *defaulta = [NSUserDefaults standardUserDefaults];
        NSString *keyString = [NSString stringWithFormat:@"%ld", (long)[sender tag]];
        [defaulta setObject:name.text forKey:keyString];
        [defaulta synchronize];
    }];
    ok.enabled = NO;
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)alertTextFieldDidChange: (UITextField *)sender{
    
    UIAlertController *controller = (UIAlertController *)self.presentedViewController;
    if (controller) {
        UITextField *subject = controller.textFields.firstObject;
        UIAlertAction *ok = controller.actions.lastObject;
        ok.enabled = subject.text.length > 1;
    
    }
}
@end
