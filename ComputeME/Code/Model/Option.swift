//
//  Option.swift
//  ComputeME
//
//  Created by Kok Hong on 8/28/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import Foundation

class Option {

    var stringContent: String

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
