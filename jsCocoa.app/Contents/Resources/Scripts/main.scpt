JsOsaDAS1.001.00bplist00�Vscript_ObjC.import('AppKit')

function run() {
var windowSize = $.NSMakeRect(100,100,400,400);
var windowStyle = $.NSTitledWindowMask | $.NSClosableWindowMask | $.NSResizableWindowMask
var rect = $.NSWindow.contentRectForFrameRectStyleMask(windowSize, windowStyle);
var w = $.NSWindow.alloc.initWithContentRectStyleMaskBackingDefer(windowSize, windowStyle, $.NSBackingStoreBuffered, false);
//w.setBackgroundColor($.NSColor.blueColor)
w.setTitle("WoWindow")
w.makeKeyAndOrderFront($.NSApplication.sharedApplication)
}

function idle() {}                              (jscr  ��ޭ