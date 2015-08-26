JsOsaDAS1.001.00bplist00�Vscript_�ObjC.import('AppKit')

/// Classes


ObjC.registerSubclass({
	name: 'TableDataSource',
	superclass: 'NSObject',
	protocols: ['NSTableViewDataSource'],
	properties: {
  },
	methods: {
		'numberOfRowsInTableView:': function (tableView) {
			$.NSLog('Number of rows');
			return 4
		},
		'tableView:objectValueForTableColumn:row:': function (tableView, column, row) {
			return "Something"
		},
	}
})

ObjC.registerSubclass({
	name: 'TableDelegate',
	superclass: 'NSObject',
	protocols: ['NSTableViewDelegate'],
	properties: {
  },
	methods: {
		'tableView:viewForTableColumn:row:': function (tableView, column, row) {
			var reuseID = "reuseID";
			var cell = tableView.makeViewWithIdentifierOwner(reuseID, this);
			if (cell === $()) {
				cell = newTextLabel("Hi", 0, 0, 100, 16);
				cell.identifier = reuseID;
			}
			return cell;
		}
	}
})


// Convenience constructor functions

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

function newTableView(x, y, width, height) {
	var frame = $.NSMakeRect(x, y, width, height);
	var tableView = $.NSTableView.alloc.initWithFrame(frame);
	tableView.setTranslatesAutoresizingMaskIntoConstraints(false)
	tableView.usesAlternatingRowBackgroundColors = true;
	//tableView.setNumberOfColumns(1);
	return tableView;
}

function run() {
	var w = newWindow("ToDo", 100, 100, 400, 400);
	
	var l = newTextLabel("What needs to be done?", 10, 45, 380, 40);
	var t = newTextField(10, 10, 380, 40);
	var b = newTableView(10, 10, 380, 40);
	b.setDataSource($.TableDataSource.new);
	
	var stack = $.NSStackView.stackViewWithViews($([l, t, b]));
	stack.orientation = $.NSUserInterfaceLayoutOrientationVertical;
	
	var fieldConstraints = $.NSLayoutConstraint.constraintsWithVisualFormatOptionsMetricsViews($("H:|[textField(>=100)]|"), $(), $(), $({"textField" : t}));
	stack.addConstraints(fieldConstraints);
	
	var labelConstraints = $.NSLayoutConstraint.constraintsWithVisualFormatOptionsMetricsViews($("H:|[label]"), $(), $(), $({"label" : l}));
	stack.addConstraints(labelConstraints);
	
	var tableHConstraints = $.NSLayoutConstraint.constraintsWithVisualFormatOptionsMetricsViews($("H:|[table]"), $(), $(), $({"table" : b}));
	stack.addConstraints(tableHConstraints);
	
	w.contentView.addSubview(stack);
	
	var stackHConstraints = $.NSLayoutConstraint.constraintsWithVisualFormatOptionsMetricsViews($("H:|-[stack(>=200)]-|"), $(), $(), $({"stack" : stack}));
	var stackVConstraints = $.NSLayoutConstraint.constraintsWithVisualFormatOptionsMetricsViews($("V:|-[stack(>=300)]-|"), $(), $(), $({"stack" : stack}));

	var constraints = $.NSMutableArray.new;
	constraints.addObjectsFromArray(stackHConstraints);
	constraints.addObjectsFromArray(stackVConstraints);
	w.contentView.addConstraints(constraints);
	
	w.makeKeyAndOrderFront($.NSApplication.sharedApplication);
}

function idle() {}
                              �jscr  ��ޭ