//
//  Extension.swift
//  ComputeME
//
//  Created by Ryne Cheow on 8/18/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit

extension Array
    {
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<self.count
        {
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

}