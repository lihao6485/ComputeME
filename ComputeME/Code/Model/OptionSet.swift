//
//  OptionSet.swift
//  ComputeME
//
//  Created by Kok Hong on 8/28/14.
//  Copyright (c) 2014 Pointwelve. All rights reserved.
//

import Foundation

class OptionSet {

    /// Set of options that are not answers.
    var dummyOptions: [Option]
    /// Correct option or answer.
    var correctOption: Option

    lazy var allOptions = [Option]()
    
    init(correctOption: Option, dummyOptions:[Option]) {
        self.correctOption = correctOption
        self.dummyOptions = dummyOptions
        setupAnswerSet()
    }
    
    private func setupAnswerSet() {
        allOptions = dummyOptions as [Option]
        allOptions.append(correctOption)
        allOptions.shuffle()
    }

}
