//
//  CodersListVM.swift
//  CodersList
//
//  Created by Mohamed Salem on 22/03/2022.
//
import Foundation
import Combine

class CodersListVM: ObservableObject {
    let useCases:CoderUseCasesProtocol = CoderUseCases()
    let cancellableBag = CancellableBag()
    @Published var isloading:Bool = false
    @Published var codersList:[CoderItem] = []

    init(){
        fetchList()
    }
   private func fetchList(){
        isloading = true
        useCases.getCodersList()
            .receive(on: RunLoop.main)
            .sinkToResult { [weak self] in
                self?.isloading = false
                switch $0 {
                case let .success(value):
                    print(value)
                    self?.codersList = value
                case let .failure(error):
                    print(error)
                }
            }.store(in: cancellableBag)
    }
}
