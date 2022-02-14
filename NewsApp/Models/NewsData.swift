//
//  News.swift
//  NewsApp
//
//  Created by Alexander on 09.02.2022.
//

import Foundation

enum Subsection: String {
    case politics = "Politics"
    case olympics = "Olympics"
    case europe = "Europe"
    case africa = "Africa"
    case media = "Media"
    case music = "Music"
    case television = "Television"

    var image: String {
        switch self {
        case .politics: return "person"
        case .olympics: return "sportscourt"
        case .europe, .africa: return "globe"
        case .media: return "play"
        case .music: return "music.note"
        case .television: return "tv"
        }
    }
}

struct ArticleData: Decodable {
    let date: String?
    let byline: String?
    let title: String?
    let subsection: String?
    let bodyText: String?

    init(dataResult: [String: Any]) {
        date = dataResult["published_date"] as? String
        byline = dataResult["byline"] as? String
        title = dataResult["title"] as? String
        subsection = dataResult["subsection"] as? String
        bodyText = dataResult["abstract"] as? String
    }

    static func getArticlesData(from value: Any) -> [ArticleData] {
        guard let data = value as? [String: Any] else { return [] }
        guard let articlesData = data["results"] as? [[String: Any]] else { return [] }

        return articlesData.compactMap { ArticleData(dataResult: $0) }
    }
}

struct NewsData: Decodable {
    let articlesData: [ArticleData]?

    init(value: Any) {
        articlesData = ArticleData.getArticlesData(from: value)
    }
}
