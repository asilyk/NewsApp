//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Alexander on 10.02.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    func fetchData(from link: String, completionHandler: @escaping (Result<NewsData, Error>) -> Void) {
        guard let url = URL(string: link) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                if let error = error {
                    completionHandler(.failure(error))
                }
                return
            }

            do {
                let newsData = try JSONDecoder().decode(NewsData.self, from: data)
                completionHandler(.success(newsData))
            } catch {
                completionHandler(.failure(error))
            }

        }.resume()
    }

    private init() {}
}
