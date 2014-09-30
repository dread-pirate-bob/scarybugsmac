//
//  MasterViewController.m
//  ScaryBugsMac
//
//  Created by Geo on 9/18/14.
//  Copyright (c) 2014 NWU. All rights reserved.
//

#import "MasterViewController.h"
#import "ScaryBugDoc.h"
#import "ScaryBugData.h"
#import "EDStarRating.h"

@interface MasterViewController ()
@property (weak) IBOutlet NSTableView *bugsTableView;
@property (weak) IBOutlet NSTextField *bugNameTextField;
@property (weak) IBOutlet EDStarRating *bugRatingView;
@property (weak) IBOutlet NSImageView *bugImageView;

@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

#pragma mark - NSTableView DataSource

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return self.bugsArray.count;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    //Get a new ViewCell, similar to dequeue
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    // conditional is necessary for multi-column tables
    if ([tableColumn.identifier isEqualToString:@"BugColumn"]) {
        ScaryBugDoc *bugDoc = [self.bugsArray objectAtIndex:row];
        cellView.imageView.image = bugDoc.thumbImage;
        cellView.textField.stringValue = bugDoc.data.title;
        return cellView;
    }
    
    return cellView;
}

#pragma mark - NSTableView Delegate
-(void)tableViewSelectionDidChange:(NSNotification *)notification {
    ScaryBugDoc *selectedDoc = [self selectedBugDoc];
    [self updateDetailsForBugDoc:selectedDoc];
}

#pragma mark - Utilities
-(ScaryBugDoc *)selectedBugDoc
{
    NSInteger selectedRow = [self.bugsTableView selectedRow];
    // if the selection is within the array bounds, return that bug
    if (selectedRow >= 0 && self.bugsArray.count > selectedRow) {
        ScaryBugDoc *selectedBug = [self.bugsArray objectAtIndex:selectedRow];
        return selectedBug;
    }
    // index out of bounds, return nil
    return nil;
}

-(void)updateDetailsForBugDoc:(ScaryBugDoc *)bugDoc
{
    NSString *title = @"";
    NSImage *image = nil;
    float rating = 0.0;
    if (bugDoc) {
        title = bugDoc.data.title;
        image = bugDoc.fullImage;
        rating = bugDoc.data.rating;
    }
    [self.bugNameTextField setStringValue:title];
    [self.bugImageView setImage:image];
    [self.bugRatingView setRating:rating];
}

-(void)loadView
{
    [super loadView];
    
    self.bugRatingView.starImage = [NSImage imageNamed:@"star.png"];
    self.bugRatingView.starHighlightedImage= [NSImage imageNamed:@"shockedface2_full"];
    self.bugRatingView.starImage = [NSImage imageNamed:@"shockedface2_empty"];
    self.bugRatingView.maxRating = 5.0;
    self.bugRatingView.delegate = self;
    self.bugRatingView.horizontalMargin = 0;
    self.bugRatingView.editable = YES;
    self.bugRatingView.displayMode = EDStarRatingDisplayFull;
    
    self.bugRatingView.rating = 0.0;
}

- (IBAction)bugNameTextViewDidEndEdit:(id)sender
{
    ScaryBugDoc *selectedBugDoc = [self selectedBugDoc];
    if (selectedBugDoc) {
        selectedBugDoc.data.title = self.bugNameTextField.stringValue;
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:[self.bugsArray indexOfObject:selectedBugDoc]];
        NSIndexSet *columnSet = [NSIndexSet indexSetWithIndex:0];
        [self.bugsTableView reloadDataForRowIndexes:indexSet columnIndexes:columnSet];
    }
}

- (IBAction)addButtonClicked:(id)sender
{
    ScaryBugDoc *newDoc = [[ScaryBugDoc alloc] initWithTitle:@"New Bug" andRating:0.0 andThumb:nil andFullImage:nil];
    
    [self.bugsArray addObject:newDoc];
    NSInteger newRowIndex = self.bugsArray.count - 1;
    
    [self.bugsTableView insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:newRowIndex] withAnimation:NSTableViewAnimationEffectGap];
    
    [self.bugsTableView selectRowIndexes:[NSIndexSet indexSetWithIndex:newRowIndex] byExtendingSelection:NO];
    
    [self.bugsTableView scrollRowToVisible:newRowIndex];
}

- (IBAction)removeButtonClicked:(id)sender
{
    ScaryBugDoc *selectedDoc = [self selectedBugDoc];
    
    if (selectedDoc) {
        [self.bugsArray removeObject:selectedDoc];
        
        [self.bugsTableView removeRowsAtIndexes:[NSIndexSet indexSetWithIndex:self.bugsTableView.selectedRow] withAnimation:NSTableViewAnimationSlideRight];
        
        [self updateDetailsForBugDoc:nil];
    }
}

-(void)starsSelectionChanged:(EDStarRating *)control rating:(float)rating
{
    ScaryBugDoc *selectedDoc = [self selectedBugDoc];
    if (selectedDoc) {
        selectedDoc.data.rating = rating;
    }
}
@end
