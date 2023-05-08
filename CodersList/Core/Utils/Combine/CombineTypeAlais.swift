//
//  CombineTypeAlais.swift
//  Shift
//
//  Created by ziad on 4/14/20.
//  Copyright © 2020 generation-c. All rights reserved.
//

import Combine

typealias Relay<T> = CurrentValueSubject<T,Never>
typealias Subject<T> =  PassthroughSubject<T,Never>
typealias AnyDrive<T> = AnyPublisher<T,Never>
typealias Drive<T> = Published<T>.Publisher
