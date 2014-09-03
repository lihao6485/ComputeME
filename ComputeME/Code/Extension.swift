//
//  Extension.swift
//  ComputeME
//
//  Created by Ryne Cheow on 8/18/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit

extension Array{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle() {
        for _ in 0..<self.count {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
    
    func randomItem() -> T {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

extension UIView {
    
    class func animateWithDuration(duration: NSTimeInterval, options: UIViewAnimationOptions, animations: () -> Void) {
        self.animateWithDuration(duration, delay: 0, options: options, animations: animations, completion: nil)
    }
    
    func removeAllSubviews(){
        for view in (self.subviews as [UIView]){
            view.removeFromSuperview()
        }
    }
    
    func listAllSubviews() {
        for view in (self.subviews as [UIView]){
            println("\(object_getClassName(view))")
        }
    }
    
    class func rasterizeView(view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.frame.size, true, UIScreen.mainScreen().scale)
        view.layer.renderInContext(UIGraphicsGetCurrentContext())
        let viewImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return viewImage
    }
    
    func isSubviewOf(view:UIView) -> Bool {
        for v in view.subviews as [UIView] {
            if v === self {
                return true
            }
        }
        return false
    }
    
    
}


extension String {
    
    func encodeToBase64Encoding() -> String {
        let utf8str = self.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        let base64EncodedString = utf8str?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.fromRaw(0)!)
        return base64EncodedString!
    }
    
    func decodeFromBase64Encoding() -> String {
        let base64data = NSData(base64EncodedString: self, options: NSDataBase64DecodingOptions.fromRaw(0)!)
        let decodedString = NSString(data: base64data, encoding: NSUTF8StringEncoding)
        return decodedString
    }
    
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    
    
    var CGFloatValue: CGFloat {
        return CGFloat(self.floatValue)
    }
    
    var intValue: Int {
        return (self as NSString).integerValue
    }
    
    var length: Int {
        return self.utf16Count
    }
}


extension NSFileManager {
    
    class func applicationSupportDirectoryURL() -> NSURL? {
        return defaultManager().applicationSupportDirectoryURL()
    }
    
    func applicationSupportDirectoryURL() -> NSURL? {
        let directories = URLsForDirectory(
            NSSearchPathDirectory.ApplicationSupportDirectory,
            inDomains: .UserDomainMask)
        
        return directories[directories.endIndex - 1] as? NSURL
    }
}

extension UINavigationController {
    func hideNavigationBar() {
        if !self.navigationBarHidden {
            self.navigationBarHidden = true
        }
    }
    
    func showNavigationBar() {
        if self.navigationBarHidden {
            self.navigationBarHidden = false
        }
    }
}

extension UITableView {
    func forceUpdateTable(){
        self.beginUpdates()
        self.endUpdates()
    }
}
extension UIControl {
    func disable() {
        enabled = false
    }
    
    func enable() {
        enabled = true
    }
}