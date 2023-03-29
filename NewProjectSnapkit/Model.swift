//
//  Model.swift
//  NewProjectSnapkit
//
//  Created by Nurlan Seitov on 29/3/23.
//

import Foundation

// MARK: - NewsData
struct NewsData: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
    let title, description: String
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
