//
//  URLRequest.swift
//  RxSpecial
//
//  Created by Jason Sanchez on 8/15/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct Resource<T: Decodable> {
    let url: URL
}

extension URLRequest {
    static func load<T>(resource: Resource<T>) -> Observable<T?> {
        
        return Observable.from([resource.url])
            .flatMap { url -> Observable<Data> in
                var request = URLRequest(url: url)
                request.addValue("content-type", forHTTPHeaderField: "application/json")
                return URLSession.shared.rx.data(request: request)
            }.map { data -> T? in
                return try? JSONDecoder().decode(T.self, from: data)
                
        }.asObservable()
    }
}
