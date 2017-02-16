//
//  CoreDataController.m
//  MyDayApp
//
//  Created by 박종찬 on 2017. 2. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "CoreDataController.h"
#import "MyDay.h"

@interface CoreDataController ()


@property AppDelegate *appDelegate;
@property NSManagedObjectContext *context;

@end

@implementation CoreDataController

-(NSManagedObjectContext *)managedObjectContext {
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.context = [[self.appDelegate persistentContainer] viewContext];
    
    return self.context;
}

-(void)saveMyDayItem:(MyDay *)day {
    self.context = [self managedObjectContext];
    
    NSManagedObject *managedObject = [[MyDayEntity alloc] initWithContext:self.context];
    
    [managedObject setValue:day.title forKey:@"title"];
    [managedObject setValue:day.content forKey:@"content"];
    [managedObject setValue:day.writtenDate forKey:@"writtenDate"];
    
    
    [self.appDelegate saveContext];
    
}

-(void)deleteMyDayItemAtIndex:(NSInteger)index {
    self.context = [self managedObjectContext];
    
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MyDayEntity"];
    
    
    NSError *error = nil;
    NSArray *array = [self.context executeFetchRequest:request error:&error];
    
    [self.context deleteObject:array[index]];
    [self.appDelegate saveContext];
}


-(NSArray *)fetchedArrayFromCoreData {
    self.context = [self managedObjectContext];
    
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MyDayEntity"];
    
    
    NSError *error = nil;
    NSArray *result = [self.context executeFetchRequest:request error:&error];
    
    return result;
    
}

@end
