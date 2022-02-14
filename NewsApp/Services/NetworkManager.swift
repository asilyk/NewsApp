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
            .responseDecodable(of: NewsData.self) { dataResponse in
                switch dataResponse.result {
                case let .success(value):
                    DispatchQueue.main.async {
                        completionHandler(.success(value))
                    }
                case let .failure(error):
                    completionHandler(.failure(error))
                }
            }
    }

    private init() {}
}
