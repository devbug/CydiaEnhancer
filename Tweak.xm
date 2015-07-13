

%hook UILocalizedIndexedCollation

- (id)initWithDictionary:(id)dictionary {
	id rtn = %orig;
	
	if (rtn) {
		MSHookIvar<NSLocale *>(rtn, "_locale") = [[NSLocale localeWithLocaleIdentifier:@"en@collation=dictionary"] retain];
		MSHookIvar<NSArray *>(rtn, "_sectionStartStrings") = [@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",@"ʒ"] retain];
		MSHookIvar<NSArray *>(rtn, "_sectionTitles") = [@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#"] retain];
		MSHookIvar<NSArray *>(rtn, "_sectionIndexTitles") = [@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#"] retain];
	}
	
	return rtn;
}

%end


%ctor {
	@autoreleasepool {
		NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
		
		if (![identifier isEqualToString:@"com.saurik.Cydia"]) return;
		
		%init;
	}
}
