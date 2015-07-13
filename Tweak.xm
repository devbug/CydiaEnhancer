

%hook UILocalizedIndexedCollation

- (id)initWithDictionary:(id)dictionary {
	NSDictionary *dict = @{
		@"UICollationKey" : @"en@collation=dictionary",
		@"UIIndexTitles" : @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#"],
		@"UISectionTitles" : @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#"],
		@"UISectionStartStrings" : @[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",@"ʒ"]
	};
	
	return %orig(dict);
}

%end


%ctor {
	@autoreleasepool {
		NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
		
		if (![identifier isEqualToString:@"com.saurik.Cydia"]) return;
		
		%init;
	}
}
