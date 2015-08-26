JsOsaDAS1.001.00bplist00�Vscript_�ObjC.import('AppKit')

function newWindow(name, x, y, width, height) {
	var windowFrame = $.NSMakeRect(x, y, width, height);
	var windowStyle = $.NSTitledWindowMask | $.NSMiniaturizableWindowMask | $.NSClosableWindowMask | $.NSResizableWindowMask
	var rect = $.NSWindow.contentRectForFrameRectStyleMask(windowFrame, windowStyle);
	var w = $.NSWindow.alloc.initWithContentRectStyleMaskBackingDefer(rect, windowStyle, $.NSBackingStoreBuffered, false);
	w.setTitle(name);
	return w;
}

function newTextField(x, y, width, height) {
	var frame = $.NSMakeRect(x, y, width, height);
	var textField = $.NSTextField.alloc.initWithFrame(frame);
	textField.setTranslatesAutoresizingMaskIntoConstraints(false)
	return textField;
}

function newTextLabel(text, x, y, width, height) {
	var textField = newTextField(x, y, width, height);
	textField.editable = false;
	textField.setStringValue($(text));
	textField. setDrawsBackground(false);
	textField.bezeled = false;
	textField.selectable = false;
	return textField;
}

function run() {
	var w = newWindow("ToDo", 100, 100, 400, 400);
	
	var l = newTextLabel("What needs to be done?", 10, 45, 380, 40);
	var t = newTextField(10, 10, 380, 40);

	var stack = $.NSStackView.stackViewWithViews($([l, t]));
	
	var fieldConstraints = $.NSLayoutConstraint.constraintsWithVisualFormatOptionsMetricsViews($("H:|[textField(>=100)]|"), $(), $(), $({"textField" : t}));
	stack.addConstraints(fieldConstraints);
	
	var labelConstraints = $.NSLayoutConstraint.constraintsWithVisualFormatOptionsMetricsViews($("H:|[label]"), $(), $(), $({"label" : l}));
	stack.addConstraints(labelConstraints);
		
	stack.orientation = $.NSUserInterfaceLayoutOrientationVertical;
	
	w.contentView.addSubview(stack);
	
	var stackHConstraints = $.NSLayoutConstraint.constraintsWithVisualFormatOptionsMetricsViews($("H:|-[stack(>=200)]-|"), $(), $(), $({"stack" : stack}));
	var stackVConstraints = $.NSLayoutConstraint.constraintsWithVisualFormatOptionsMetricsViews($("V:|-[stack(>=300)]-|"), $(), $(), $({"stack" : stack}));

	w.contentView.addConstraints(stackHConstraints);
	w.contentView.addConstraints(stackVConstraints);
	
	w.makeKeyAndOrderFront($.NSApplication.sharedApplication)

}

function idle() {}                              �jscr  ��ޭ