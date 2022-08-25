//
//  Typealiases.swift
//  
//
//  Created by Дмитрий Поляков on 27.04.2022.
//

import Foundation

/// Set of closure typealiases
///
public typealias DPClosure = () -> Void
public typealias ContextClosure<T> = (T) -> Void
public typealias ErrorClosure = ContextClosure<Error>
public typealias ErrorOptionalClosure = ContextClosure<Error?>
