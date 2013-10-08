//
//  TemperatureViewController.m
//  temperatureconverter
//
//  Created by Justin Steffen on 10/8/13.
//  Copyright (c) 2013 Justin Steffen. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fahrenheitTextField;
@property (weak, nonatomic) IBOutlet UITextField *celsiusTextField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;

- (IBAction)onTap:(id)sender;

- (double)celsiusWithFahrenhenheit:(double) fahrenheit;
- (double)fahrenhenheitWithCelsius:(double) celsius;
@end

@implementation TemperatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.fahrenheitTextField.delegate = self;
    self.celsiusTextField.delegate = self;
    [self.convertButton setBackgroundColor: [UIColor greenColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (double) celsiusWithFahrenhenheit:(double)fahrenheit {
    return ((fahrenheit - 32.0)*5.0)/(9.0);
}

-(double) fahrenhenheitWithCelsius:(double)celsius {
    return (celsius * (9.0/5.0)) + 32.0;
}

-(void) textFieldDidEndEditing:(UITextField *)textField {
    if (textField == self.fahrenheitTextField) {
        double celsius = [self celsiusWithFahrenhenheit:[self.fahrenheitTextField.text doubleValue]];
        self.celsiusTextField.text = [NSString stringWithFormat:@"%0.2f", celsius];
    }
    else if(textField == self.celsiusTextField) {
        double fahrenheneit = [self fahrenhenheitWithCelsius:[self.celsiusTextField.text doubleValue]];
        self.fahrenheitTextField.text = [NSString stringWithFormat:@"%0.2f", fahrenheneit];
    }
}

@end
