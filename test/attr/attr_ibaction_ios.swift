// RUN: not %target-build-swift -parse %s 2>&1 | FileCheck -check-prefix=CHECK-%target-os %s

class IBActionWrapperTy {
  @IBAction func nullary() {}
  // CHECK-ios-NOT: attr_ibaction_ios:[[@LINE-1]]
  // CHECK-macosx: attr_ibaction_ios.swift:[[@LINE-2]]:18: error: 'IBAction' methods must have a single argument
  
  @IBAction func reqReq(_: AnyObject, _: AnyObject) {}
  @IBAction func reqOpt(_: AnyObject, _: AnyObject?) {}
  @IBAction func reqImp(_: AnyObject, _: AnyObject!) {}
  @IBAction func optReq(_: AnyObject?, _: AnyObject) {}
  @IBAction func optOpt(_: AnyObject?, _: AnyObject?) {}
  @IBAction func optImp(_: AnyObject?, _: AnyObject!) {}
  @IBAction func impReq(_: AnyObject!, _: AnyObject) {}
  @IBAction func impOpt(_: AnyObject!, _: AnyObject?) {}
  @IBAction func impImp(_: AnyObject!, _: AnyObject!) {}
  // CHECK-ios-NOT: attr_ibaction_ios:[[@LINE-9]]
  // CHECK-ios-NOT: attr_ibaction_ios:[[@LINE-9]]
  // CHECK-ios-NOT: attr_ibaction_ios:[[@LINE-9]]
  // CHECK-ios-NOT: attr_ibaction_ios:[[@LINE-9]]
  // CHECK-ios-NOT: attr_ibaction_ios:[[@LINE-9]]
  // CHECK-ios-NOT: attr_ibaction_ios:[[@LINE-9]]
  // CHECK-ios-NOT: attr_ibaction_ios:[[@LINE-9]]
  // CHECK-ios-NOT: attr_ibaction_ios:[[@LINE-9]]
  // CHECK-ios-NOT: attr_ibaction_ios:[[@LINE-9]]
  // CHECK-macosx: attr_ibaction_ios.swift:[[@LINE-18]]:18: error: 'IBAction' methods must have a single argument
  // CHECK-macosx: attr_ibaction_ios.swift:[[@LINE-18]]:18: error: 'IBAction' methods must have a single argument
  // CHECK-macosx: attr_ibaction_ios.swift:[[@LINE-18]]:18: error: 'IBAction' methods must have a single argument
  // CHECK-macosx: attr_ibaction_ios.swift:[[@LINE-18]]:18: error: 'IBAction' methods must have a single argument
  // CHECK-macosx: attr_ibaction_ios.swift:[[@LINE-18]]:18: error: 'IBAction' methods must have a single argument
  // CHECK-macosx: attr_ibaction_ios.swift:[[@LINE-18]]:18: error: 'IBAction' methods must have a single argument
  // CHECK-macosx: attr_ibaction_ios.swift:[[@LINE-18]]:18: error: 'IBAction' methods must have a single argument
  // CHECK-macosx: attr_ibaction_ios.swift:[[@LINE-18]]:18: error: 'IBAction' methods must have a single argument
  // CHECK-macosx: attr_ibaction_ios.swift:[[@LINE-18]]:18: error: 'IBAction' methods must have a single argument

  @IBAction func reqBad(_: AnyObject, _: IBActionWrapperTy) {}
  // CHECK-ios: attr_ibaction_ios.swift:[[@LINE-1]]:18: error: argument to 'IBAction' method cannot have non-'@objc' class type
  // CHECK-macosx: attr_ibaction_ios.swift:[[@LINE-2]]:18: error: 'IBAction' methods must have a single argument

  @IBAction func badReq(_: Int, _: AnyObject) {}
  // CHECK-ios: attr_ibaction_ios.swift:[[@LINE-1]]:18: error: argument to 'IBAction' method cannot have non-object type
  // CHECK-macosx: attr_ibaction_ios.swift:[[@LINE-2]]:18: error: 'IBAction' methods must have a single argument

  @IBAction func badBad(_: Int, _: IBActionWrapperTy) {}
  // CHECK-ios: attr_ibaction_ios.swift:[[@LINE-1]]:18: error: argument to 'IBAction' method cannot have non-object type
  // CHECK-ios: attr_ibaction_ios.swift:[[@LINE-2]]:18: error: argument to 'IBAction' method cannot have non-'@objc' class type
  // CHECK-macosx: attr_ibaction_ios.swift:[[@LINE-3]]:18: error: 'IBAction' methods must have a single argument

  @IBAction func tooManyArgs(_: AnyObject, _: AnyObject, _: AnyObject) {}
  // CHECK-ios: attr_ibaction_ios.swift:[[@LINE-1]]:18: error: 'IBAction' methods can only have up to 2 arguments
  // CHECK-macosx: attr_ibaction_ios.swift:[[@LINE-2]]:18: error: 'IBAction' methods must have a single argument
}
