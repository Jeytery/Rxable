//
//  ListViewModel.swift
//  RxApp-List
//
//  Created by Jeytery on 07.04.2022.
//

import Foundation
import RxSwift
import RxCocoa

class ListViewModel: ViewModelable {
    struct Input {
        let createButtonObserable: Observable<String>
    }
    
    struct Output {
        //let createButtonDriver: Driver<String>
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
}
