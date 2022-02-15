//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Alexander on 10.02.2022.
//

import Alamofire

class NetworkManager {
    static let shared = NetworkManager()

    func fetchData(from link: String, completionHandler: @escaping (Result<NewsData, Error>) -> Void) {
        AF.request(link)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    DispatchQueue.main.async {
                        completionHandler(.success(NewsData(value: value)))
                    }
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
    }

    private init() {}
}
