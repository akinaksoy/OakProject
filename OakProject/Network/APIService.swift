//
//  APIService.swift
//  OakProject
//
//  Created by Akın Aksoy on 10.05.2023.
//

import Foundation

class ApiService {
    
    class func ApiRequest(urlPage : NetworkConstants.Pages,
                          method: NetworkConstants.HTTPMethods,
                          completion: @escaping ([AppModel]?,RequestError.ErrorTypes?) -> Void) {
        let networkConstants = NetworkConstants()
        let baseURL = networkConstants.baseUrl
        guard let url = URL(string: "\(baseURL)\(urlPage.rawValue)") else {
            completion(nil,.NetworkError)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(networkConstants.headerValue, forHTTPHeaderField: "JsonStub-User-Key")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            guard let data = data else { return }
            DispatchQueue.main.async {
                do {
                    let productList = try JSONDecoder().decode([AppModel].self, from: data)
                    completion(productList, nil)
                } catch {
                    completion(nil,.NetworkError)
                }
            }
        })
        
        task.resume()
    }
}
