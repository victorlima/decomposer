//
//  DCCifraPickerViewController.m
//  Decomposer
//
//  Created by Victor Lima on 9/30/12.
//  Copyright (c) 2012 vlima. All rights reserved.
//

#import "DCCifraPickerViewController.h"

@interface DCCifraPickerViewController () {
  IBOutlet UIPickerView* rootNotePickerView;
  IBOutlet UIPickerView* majorMinorPickerView;
  IBOutlet UIPickerView* otherPickerView;
}

@end

@implementation DCCifraPickerViewController

+( DCCifraPickerViewController* ) cifraPickerViewController
{
  return [[DCCifraPickerViewController alloc] initWithNibName:@"DCCifraPickerViewController" bundle:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UIPickerViewDataSource & UIPickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
  return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  if( pickerView == rootNotePickerView )
    return 12;
  
  return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  NSString* title = nil;
  if( pickerView == rootNotePickerView )
    switch (row) {
      case 0:
        title = @"A";
        break;
      case 1:
        title = @"A# - Bb";
        break;
      case 2:
        title = @"B";
        break;
      case 3:
        title = @"C";
        break;
      case 4:
        title = @"C# - Db";
        break;
      case 5:
        title = @"D";
        break;
      case 6:
        title = @"D# - Eb";
        break;
      case 7:
        title = @"E";
        break;
      case 8:
        title = @"F";
        break;
      case 9:
        title = @"F# - Gb";
        break;
      case 10:
        title = @"G";
        break;
      case 11:
        title = @"G# - Ab";
        break;
      default:
        break;
    }
  
  return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
  
}

@end
