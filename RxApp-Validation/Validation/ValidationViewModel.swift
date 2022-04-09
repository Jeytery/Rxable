//
//  ValidationViewModel.swift
//  RxApp-Validation
//
//  Created by Jeytery on 07.04.2022.
//

import Foundation
import RxSwift
import RxCocoa

class ValidationViewModel: ViewModelable {
    struct Input {
        let name: Observable<String>
        let validate: Observable<Void>
    }
    
    struct Output {
        let greeting: Driver<String>
    }
    
    func transform(input: Input) -> Output {
        let greeting = input
            .validate
            .withLatestFrom(input.name)
            .map { name in
                return "Hello, \(name)!"
            }
            .startWith("")
            .asDriver(onErrorJustReturn: "=(")
        return Output(greeting: greeting)
    }
}
