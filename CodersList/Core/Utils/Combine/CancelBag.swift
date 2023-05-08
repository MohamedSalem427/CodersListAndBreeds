//
//  CancelBag.swift
//  Shift
//
//  Created by ziad on 3/26/20.
//  Copyright © 2020 generation-c. All rights reserved.
//

import Combine

final class CancellableBag {
    var subscriptions = Set<AnyCancellable>()
    
    func cancel() {
        subscriptions.forEach {$0.cancel()}
        subscriptions.removeAll()
    }
}

extension AnyCancellable {
    
    func store(in cancellableBag: CancellableBag) {
        cancellableBag.subscriptions.insert(self)
    }
}
