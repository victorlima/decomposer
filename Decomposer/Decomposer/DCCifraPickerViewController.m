//
//  DCCifraPickerViewController.m
//  Decomposer
//
//  Created by Victor Lima on 9/30/12.
//  Copyright (c) 2012 vlima. All rights reserved.
//

#import "DCCifraPickerViewController.h"

NSString* const CifraGenerationNotificationKey = @"CifraGenerationNotification";

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
  
  if( pickerView == majorMinorPickerView )
    return 6;
  
  if( pickerView == otherPickerView )
    return 11;
  
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

  if( pickerView == majorMinorPickerView )
    switch (row) {
      case 0:
        title = @"m";
        break;
      case 1:
        title = @"maj";
        break;
      case 2:
        title = @"M";
        break;
      case 3:
        title = @"aug";
        break;
      case 4:
        title = @"dim";
        break;
      case 5:
        title = @"sus";
        break;
      default:
        break;
    }
  
  if( pickerView == otherPickerView )
    switch (row) {
      case 0:
        title = @"2";
        break;
      case 1:
        title = @"3";
        break;
      case 2:
        title = @"4";
        break;
      case 3:
        title = @"5";
        break;
      case 4:
        title = @"6";
        break;
      case 5:
        title = @"7";
        break;
      case 6:
        title = @"b5";
        break;
      case 7:
        title = @"9";
        break;
      case 8:
        title = @"b9";
        break;
      case 9:
        title = @"13";
        break;
      case 10:
        title = @"b13";
        break;
      default:
        break;
    }
  
  return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
  
}

#pragma mark - Actions
-( IBAction ) done:(id)sender
{
  [self dismissViewControllerAnimated: YES completion:
   ^{
     [self notifyCifraGeneration];
  }];
}

-( void ) notifyCifraGeneration
{
  NSUInteger selectedRow;
  
  selectedRow = [rootNotePickerView selectedRowInComponent:0];
  NSString* rootTitle;
  if( selectedRow != -1 )
    rootTitle = [self pickerView: rootNotePickerView titleForRow: selectedRow forComponent: 0];
  else
    rootTitle = @"";

  selectedRow = [majorMinorPickerView selectedRowInComponent:0];
  NSString* majorMinorTitle;
  if( selectedRow != -1 )
    majorMinorTitle = [self pickerView: majorMinorPickerView titleForRow: selectedRow forComponent: 0];
  else
    majorMinorTitle = @"";

  selectedRow = [otherPickerView selectedRowInComponent:0];
  NSString* otherTitle;
  if( selectedRow != -1 )
    otherTitle = [self pickerView: otherPickerView titleForRow: selectedRow forComponent: 0];
  else
    otherTitle = @"";

  NSString* cifra = [NSString stringWithFormat:@"%@%@%@", rootTitle, majorMinorTitle, otherTitle];
  
  [[NSNotificationCenter defaultCenter] postNotificationName: CifraGenerationNotificationKey
                                                      object: cifra];
}

@end
