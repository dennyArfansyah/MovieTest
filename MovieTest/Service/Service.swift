//
//  Service.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 25/06/21.
//

import Alamofire

protocol ServiceProtocol {
    
    func request(with url: URL, method: HTTPMethod, parameter: Data?, completion: @escaping (Result<Data, Error>) -> Void)
    
}

struct Service: ServiceProtocol {
    
    func request(with url: URL, method: HTTPMethod, parameter: Data?, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let manager = NetworkReachabilityManager(host: "www.apple.com") else { return }
        if !manager.isReachable {
            completion(.failure(NSError(domain: Constants.noInternetConnection, code: 1, userInfo: nil)))
            return
        }
        
        AF.request(url, method: method, parameters: Request.setParams(data: parameter), encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON { response in
            
            print(response)
            
            switch response.result {
            case .failure(let error):
                completion(.failure(NSError(domain: error.localizedDescription, code: 1, userInfo: nil)))
            case .success(_):
                guard let data = response.data else {
                    completion(.failure(NSError(domain: Constants.generalError, code: 2, userInfo: nil)))
                    return
                }
                completion(.success(data))
            }
            
        }
    }
    
}
