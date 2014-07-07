#import <CoreFoundation/CoreFoundation.h>
#import <UIKit/UIWebView.h>


static CFLocaleRef myLocale = NULL;


%hook CyteWebViewController

- (void)webView:(UIWebView *)view didFinishLoadForFrame:(id)frame {
	%orig;
	
	NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
	
	if ([identifier isEqualToString:@"com.saurik.Cydia"]) {
		NSString *js = @"document.body.style.webkitTouchCallout='default'";
		
		if ([view respondsToSelector:@selector(stringByEvaluatingJavaScriptFromString:)]) {
			[view stringByEvaluatingJavaScriptFromString:js];
		}
	}
}

%end


CFComparisonResult (*origin_CFStringCompareWithOptionsAndLocale)(CFStringRef, CFStringRef, CFRange, CFStringCompareFlags, CFLocaleRef);

CFComparisonResult new_CFStringCompareWithOptionsAndLocale (
	CFStringRef theString1,
	CFStringRef theString2,
	CFRange rangeToCompare,
	CFStringCompareFlags compareOptions,
	CFLocaleRef locale
) {
	return origin_CFStringCompareWithOptionsAndLocale(theString1, theString2, rangeToCompare, compareOptions, myLocale);
}


%ctor {
	@autoreleasepool {
		NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
		
		if (![identifier isEqualToString:@"com.saurik.Cydia"]) return;
		
		myLocale = CFLocaleCreate(NULL, CFSTR("en_US"));
		
		MSHookFunction((void *)CFStringCompareWithOptionsAndLocale, (void *)new_CFStringCompareWithOptionsAndLocale, (void **)&origin_CFStringCompareWithOptionsAndLocale);
		
		%init;
	}
}
