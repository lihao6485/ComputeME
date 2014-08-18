//
//  Question.swift
//  ComputeME
//
//  Created by Ryne Cheow on 8/18/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import UIKit

enum QuestionType : Int {
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

class Question {
    var type: QuestionType
    var content: String
    var imageURLString: String
    var optionSet: OptionSet
    
    init(content:String, type:QuestionType, imageURLString:String, optionSet:OptionSet) {
        self.content = content
        self.type = type
        self.imageURLString = imageURLString
        self.optionSet = optionSet
    }
}

extension Question : Printable {
    var description: String {
        var d = "{\n"
            d += "Content: \(self.content)\n"
            d += "Image URL String: \(self.imageURLString)\n"
            d += "Type: \(self.type.description)\n"
            d += "Options: \(self.optionSet)"
            d += "\n}"
            return d
    }
}