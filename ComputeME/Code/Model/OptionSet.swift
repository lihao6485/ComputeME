//
//  OptionSet.swift
//  ComputeME
//
//  Created by Kok Hong on 8/28/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import Foundation
import CoreData

class OptionSet: NSManagedObject {

    /// Set of options that are not answers.
    @NSManaged var dummyOptions: AnyObject
    /// Correct option or answer.
    @NSManaged var correctOption: Option
    @NSManaged var question: Question
    
    lazy var allOptions = [Option]()
    
//    init(correctOption: Option, dummyOptions:[Option]) {
//        super.init()
//        self.correctOption = correctOption
//        self.dummyOptions = dummyOptions
//        setupAnswerSet()
//    }
    
    private func setupAnswerSet() {
        allOptions = dummyOptions as [Option]
        allOptions.append(correctOption)
        allOptions.shuffle()
    }

}
