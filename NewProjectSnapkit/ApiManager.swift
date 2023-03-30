//  ApiManager.swift
//  NewProjectSnapkit
//  Created by Nurlan Seitov on 29/3/23.
//
import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    let urlString = "https://newsapi.org/v2/everything?q=apple&from=2023-03-28&to=2023-03-28&sortBy=popularity&apiKey=60370b214d0b4cf48e72818fd383a586"
    
    func getData(completion: @escaping (Result<NewsData, Error>) -> Void) {
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else {return}
 
            do {
                let newsData = try JSONDecoder().decode(NewsData.self, from: data)
                completion(.success(newsData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
