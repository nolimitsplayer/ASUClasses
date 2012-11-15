//
//  XMLParser.m
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 11/14/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser

@synthesize classesList;

- (XMLParser *)initXMLParser {
	self = [super init];
	return self;
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
										 namespaceURI:(NSString *)namespaceURI
										qualifiedName:(NSString *)qName
										   attributes:(NSDictionary *)attributeDict {
	if ([elementName isEqualToString:@"classList"]) {
		classesList = [[NSMutableArray alloc] init];
	} else if ([elementName isEqualToString:@"class"]) {
		currentClass = [[XMLClass alloc] init];
	}
	//NSLog(@"Processing Element: %@", elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	if (!currentElement)
		currentElement = [[NSMutableString alloc] initWithString:string];
	else
		[currentElement appendString:string];
	//NSLog(@"Processing Value: %@", currentElement);
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	if ([elementName isEqualToString:@"classlist"]) {
		return;
	}/*
	if ([elementName isEqualToString:@"title"]) {
		currentClass.title = currentElement;
	} if ([elementName isEqualToString:@"number"]) {
		currentClass.number = currentElement;
	} if ([elementName isEqualToString:@"semester"]) {
		currentClass.semester = currentElement;
	} if ([elementName isEqualToString:@"year"]) {
		currentClass.semester = currentElement;
	} if ([elementName isEqualToString:@"professor"]) {
		currentClass.professor = currentElement;
	} if ([elementName isEqualToString:@"startTime"]) {
		currentClass.startTime = currentElement;
	} if ([elementName isEqualToString:@"endTime"]) {
		currentClass.endTime = currentElement;
	} if ([elementName isEqualToString:@"id"]) {
		currentClass.classID = currentElement;
	}*/
	if ([elementName isEqualToString:@"class"]) {
		[classesList addObject:currentClass];
		NSLog(@"%@", [currentClass number]);
		NSLog(@"%@", classesList);
	} else {
		//[currentClass setValue:currentElement forKey:elementName];
	}
}


- (NSMutableArray *)getClassList {
	return classesList;
}

@end