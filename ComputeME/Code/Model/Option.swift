//
//  Option.swift
//  ComputeME
//
//  Created by Ryne Cheow on 8/18/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit

/// Choices that are of a given question.

class Option {
    
    /// String content of the option
    let stringContent: String
    
    /**
    Initialise option with string content and image content
    
    :param: stringContent The string content of the option
    */
    init(stringContent:String){
        self.stringContent = stringContent
    }
}

extension Option : Printable {
    var description :String {
        return "[ Option content: \(stringContent) ]"
    }
}