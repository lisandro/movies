//
//  NetworkManager.swift
//  movies
//
//  Created by Lisandro on 25/11/2018.
//  Copyright © 2018 Lisandro. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

struct Resource<A> {
    let url: String
    let method: HTTPMethod
    let parse: (Data) -> A?
}
