//
//  SessionHTTPClient.swift
//  MVP+Coordinators
//
//  Created by Андрей Шевчук on 17.08.2020.
//  Copyright © 2020 Андрей Шевчук. All rights reserved.
//

import Foundation

public final class SessionHTTPClient: HTTPClient {

    
    private struct UnexpectedValuesRepresentation: Error {}
    
    private struct URLSessionTaskWrapper: HTTPClientTask {
        let wrapped: URLSessionTask
        
        func cancel() {
            wrapped.cancel()
        }
    }
    
    func get(from url: URL, completion: @escaping (Result<[Person]?, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            completion(Result {
                if let error = error {
                    throw error
                }
                do{
                    let obj = try JSONDecoder().decode([Person].self, from: data!)
                    completion(.success(obj))
                    return obj
                    
                }catch {
                    completion(.failure(error))
                    return .none
                }
                
            })
        }
        task.resume()
    }
}
