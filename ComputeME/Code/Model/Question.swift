//
//  Question.swift
//  ComputeME
//
//  Created by Kok Hong on 8/28/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import Foundation

enum QuestionType : NSNumber {
    case ImageType
    case TextualType
    
    var description: String {
        switch self {
        case .ImageType:
            return "Image type"
        case .TextualType:
            return "Textual type"
            }
    }
}

enum QuestionCategory: NSNumber {
    case Hardware
    case ProgrammingLanguage
    case History
    case Networking
    case Unknown
}

class Question {

    var category: QuestionCategory!
    var content: String
    var image: NSData
    var type: QuestionType!
    var optionSet: OptionSet!
    

    init(content:String, type:QuestionType, category: QuestionCategory, image:NSData, optionSet:OptionSet) {
        self.content = content
        self.type = type
        self.category = category
        self.image = image
        self.optionSet = optionSet
    }
    
}

extension Question : Printable {
    var description: String {
        var d = "{\n"
            d += "Content: \(self.content)\n"
            d += "Image: \(self.image)\n"
            d += "Type: \(self.type.description)\n"
            d += "Options: \(self.optionSet)"
            d += "\n}"
            return d
    }
}
