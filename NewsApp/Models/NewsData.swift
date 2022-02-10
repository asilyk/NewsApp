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
}

struct DataResult: Decodable {
    let published_date: String?
    let subsection: String?
    let byline: String?
    let title: String?
    let abstract: String?
}

struct NewsData: Decodable {
    let results: [DataResult]?
}
