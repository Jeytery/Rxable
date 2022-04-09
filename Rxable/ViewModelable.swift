//
//  ViewModelable.swift
//  RxApp-Validation
//
//  Created by Jeytery on 07.04.2022.
//

import Foundation

protocol ViewModelable {
    
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

