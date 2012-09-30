//
//  DCCifraPickerViewControllerTests.m
//  Decomposer
//
//  Created by Victor Lima on 9/30/12.
//  Copyright (c) 2012 vlima. All rights reserved.
//

#import "DCCifraPickerViewControllerTests.h"

@interface DCCifraPickerViewControllerTests ()
{
  BOOL didReceiveCifraGenerationNotification;
  NSString* cifraGenerated;
}

@end

@implementation DCCifraPickerViewControllerTests

-( void ) setUp
{
  [super setUp];
  didReceiveCifraGenerationNotification = NO;
  cifraGenerated = nil;

  [[NSNotificationCenter defaultCenter] addObserver: self
                                           selector: @selector( receivedCifraGenerationNotification: )
                                               name: CifraGenerationNotificationKey
                                             object: nil];
}

-( void ) tearDown
{
  [super tearDown];
  [[NSNotificationCenter defaultCenter] removeObserver: self];
  didReceiveCifraGenerationNotification = NO;
  cifraGenerated = nil;
}

-( void ) test_should_adhere_to_uipickerviewdelegate_and_datasource
{
  DCCifraPickerViewController* dcp = [DCCifraPickerViewController cifraPickerViewController];
  
  STAssertTrue( [dcp conformsToProtocol:@protocol(UIPickerViewDelegate)], @"" );
  STAssertTrue( [dcp conformsToProtocol:@protocol(UIPickerViewDataSource)], @"" );
}

-( void ) test_all_picker_views_should_have_one_component
{
  DCCifraPickerViewController* dcp = [DCCifraPickerViewController cifraPickerViewController];

  STAssertTrue([dcp numberOfComponentsInPickerView: nil] == 1, @"" );
}

-( void ) test_root_picker_view_should_have_10_rows
{
  DCCifraPickerViewController* dcp = [DCCifraPickerViewController cifraPickerViewController];
  [self pingView: dcp.view];

  UIPickerView* rootPickerView = [dcp valueForKey:@"rootNotePickerView"];
  STAssertNotNil( rootPickerView, @"" );
  
  STAssertTrue( [dcp pickerView: rootPickerView numberOfRowsInComponent:0] == 12, @"" );
}

-( void ) test_root_picker_view_should_return_all_notes_chromatic_for_rows
{
  DCCifraPickerViewController* dcp = [DCCifraPickerViewController cifraPickerViewController];
  [self pingView: dcp.view];
  
  UIPickerView* rootPickerView = [dcp valueForKey:@"rootNotePickerView"];
  STAssertNotNil( rootPickerView, @"" );

  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:0 forComponent: 0] isEqualToString:@"A"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:1 forComponent: 0] isEqualToString:@"A# - Bb"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:2 forComponent: 0] isEqualToString:@"B"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:3 forComponent: 0] isEqualToString:@"C"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:4 forComponent: 0] isEqualToString:@"C# - Db"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:5 forComponent: 0] isEqualToString:@"D"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:6 forComponent: 0] isEqualToString:@"D# - Eb"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:7 forComponent: 0] isEqualToString:@"E"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:8 forComponent: 0] isEqualToString:@"F"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:9 forComponent: 0] isEqualToString:@"F# - Gb"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:10 forComponent: 0] isEqualToString:@"G"], @"");
  STAssertTrue( [[dcp pickerView: rootPickerView titleForRow:11 forComponent: 0] isEqualToString:@"G# - Ab"], @"");
}

-( void ) test_majorMinor_picker_view_should_have_6_rows
{
  DCCifraPickerViewController* dcp = [DCCifraPickerViewController cifraPickerViewController];
  [self pingView: dcp.view];
  
  UIPickerView* majorMinorPickerView = [dcp valueForKey:@"majorMinorPickerView"];
  STAssertNotNil( majorMinorPickerView, @"" );
  
  STAssertTrue( [dcp pickerView: majorMinorPickerView numberOfRowsInComponent:0] == 6, @"" );
}

-( void ) test_majorMinor_picker_view_should_return_all_possible_music_symbols
{
  DCCifraPickerViewController* dcp = [DCCifraPickerViewController cifraPickerViewController];
  [self pingView: dcp.view];
  
  UIPickerView* majorMinorPickerView = [dcp valueForKey:@"majorMinorPickerView"];
  STAssertNotNil( majorMinorPickerView, @"" );
  
  STAssertTrue( [[dcp pickerView: majorMinorPickerView titleForRow:0 forComponent: 0] isEqualToString:@"m"], @"");
  STAssertTrue( [[dcp pickerView: majorMinorPickerView titleForRow:1 forComponent: 0] isEqualToString:@"maj"], @"");
  STAssertTrue( [[dcp pickerView: majorMinorPickerView titleForRow:2 forComponent: 0] isEqualToString:@"M"], @"");
  STAssertTrue( [[dcp pickerView: majorMinorPickerView titleForRow:3 forComponent: 0] isEqualToString:@"aug"], @"");
  STAssertTrue( [[dcp pickerView: majorMinorPickerView titleForRow:4 forComponent: 0] isEqualToString:@"dim"], @"");
  STAssertTrue( [[dcp pickerView: majorMinorPickerView titleForRow:5 forComponent: 0] isEqualToString:@"sus"], @"");
}

-( void ) test_otherNotes_picker_view_should_have_11_rows
{
  DCCifraPickerViewController* dcp = [DCCifraPickerViewController cifraPickerViewController];
  [self pingView: dcp.view];
  
  UIPickerView* otherNotesPickerView = [dcp valueForKey:@"otherPickerView"];
  STAssertNotNil( otherNotesPickerView, @"" );
  
  STAssertTrue( [dcp pickerView: otherNotesPickerView numberOfRowsInComponent:0] == 11, @"" );
}

-( void ) test_otherNotes_picker_view_should_return_all_possible_music_symbols
{
  DCCifraPickerViewController* dcp = [DCCifraPickerViewController cifraPickerViewController];
  [self pingView: dcp.view];
  
  UIPickerView* otherNotesPickerView = [dcp valueForKey:@"otherPickerView"];
  STAssertNotNil( otherNotesPickerView, @"" );
  
  STAssertTrue( [[dcp pickerView: otherNotesPickerView titleForRow:0 forComponent: 0] isEqualToString:@"2"], @"");
  STAssertTrue( [[dcp pickerView: otherNotesPickerView titleForRow:1 forComponent: 0] isEqualToString:@"3"], @"");
  STAssertTrue( [[dcp pickerView: otherNotesPickerView titleForRow:2 forComponent: 0] isEqualToString:@"4"], @"");
  STAssertTrue( [[dcp pickerView: otherNotesPickerView titleForRow:3 forComponent: 0] isEqualToString:@"5"], @"");
  STAssertTrue( [[dcp pickerView: otherNotesPickerView titleForRow:4 forComponent: 0] isEqualToString:@"6"], @"");
  STAssertTrue( [[dcp pickerView: otherNotesPickerView titleForRow:5 forComponent: 0] isEqualToString:@"7"], @"");
  STAssertTrue( [[dcp pickerView: otherNotesPickerView titleForRow:6 forComponent: 0] isEqualToString:@"b5"], @"");
  STAssertTrue( [[dcp pickerView: otherNotesPickerView titleForRow:7 forComponent: 0] isEqualToString:@"9"], @"");
  STAssertTrue( [[dcp pickerView: otherNotesPickerView titleForRow:8 forComponent: 0] isEqualToString:@"b9"], @"");
  STAssertTrue( [[dcp pickerView: otherNotesPickerView titleForRow:9 forComponent: 0] isEqualToString:@"13"], @"");
  STAssertTrue( [[dcp pickerView: otherNotesPickerView titleForRow:10 forComponent: 0] isEqualToString:@"b13"], @"");
}

-( void ) test_choosen_cifra_gets_notified_properly
{
  DCCifraPickerViewController* dcp = [DCCifraPickerViewController cifraPickerViewController];
  [self pingView: dcp.view];
  
  UIPickerView* rootNotePickerView = [dcp valueForKey:@"rootNotePickerView"];
  UIPickerView* majorMinorPickerView = [dcp valueForKey:@"majorMinorPickerView"];
  UIPickerView* otherNotesPickerView = [dcp valueForKey:@"otherPickerView"];
  
  [rootNotePickerView selectRow: 0 inComponent:0 animated: YES];
  [majorMinorPickerView selectRow: 0 inComponent:0 animated: YES];
  [otherNotesPickerView selectRow: 5 inComponent:0 animated: YES];
  
  [dcp performSelector:@selector(notifyCifraGeneration)];
  
  STAssertTrue( didReceiveCifraGenerationNotification, @"" );
  STAssertTrue( [cifraGenerated isEqualToString:@"Am7"], @"" );
}

-( void ) receivedCifraGenerationNotification:(NSNotification* ) notification
{
  didReceiveCifraGenerationNotification = YES;
  cifraGenerated = (NSString*)notification.object;
}

#pragma mark - Auxilary methods
-( void ) pingView:(UIView* ) view
{
  view.alpha = 1.0f;
}

@end
