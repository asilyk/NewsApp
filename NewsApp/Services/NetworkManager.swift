//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Alexander on 10.02.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()

    func fetchData(from link: String, completionHandler: @escaping (Result<NewsData, NetworkError>) -> Void) {
        guard let url = URL(string: link) else {
            completionHandler(.failure(.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completionHandler(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }

            do {
                let newsData = try JSONDecoder().decode(NewsData.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(newsData))
                }
            } catch {
                completionHandler(.failure(.decodingError))
            }

        }.resume()
    }

    private init() {}
}
