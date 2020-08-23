//
//  HTTPClient.swift
//  MVP+Coordinators
//
//  Created by Андрей Шевчук on 17.08.2020.
//  Copyright © 2020 Андрей Шевчук. All rights reserved.
//

import Foundation

public protocol HTTPClientTask {
    func cancel()
}

 protocol HTTPClient {
    func get(from url: URL, completion: @escaping (Result<[Person]?,Error>) -> Void)
}
