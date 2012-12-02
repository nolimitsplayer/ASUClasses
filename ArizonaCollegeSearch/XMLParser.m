#import "XMLParser.h"
#import "XMLClass.h"

@implementation XMLParser

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
	attributes:(NSDictionary *)attributeDict {
	
	if([elementName isEqualToString:@"classes"]) {
		//Initialize the array.
		//appDelegate.books = [[NSMutableArray alloc] init];
	}
	else if([elementName isEqualToString:@"class"]) {
		
		//Initialize the book.
		aClass = [[XMLClass alloc] init];
		
		//Extract the attribute here.
		aClass.title = [attributeDict objectForKey:@"title"];
		
		NSLog(@"Reading id value :%@", aClass.title);
	}
	
	NSLog(@"Processing Element: %@", elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
	if(!currentElementValue)
		currentElementValue = [[NSMutableString alloc] initWithString:string];
	else
		[currentElementValue appendString:string];
	
	NSLog(@"Processing Value: %@", currentElementValue);
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"classes"])
		return;
	
	//There is nothing to do if we encounter the Books element here.
	//If we encounter the Book element howevere, we want to add the book object to the array
	// and release the object.
	if([elementName isEqualToString:@"class"]) {
		[array addObject:aClass];
		aClass = nil;
	}
	else
		[aClass setValue:currentElementValue forKey:elementName];
	
	currentElementValue = nil;
}

- (NSMutableArray *)getClassList {
	return array;
}

@end
