//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Aasem Hany on 04/05/2023.
//


import UIKit

struct NetworkManager {
    static let shared = NetworkManager()
    
    static private let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    private let appetizersURL = baseURL + "appetizers"
    private let cache = NSCache<NSString,UIImage>()
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer],customError>) -> Void) {
        guard let url = URL(string: appetizersURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)){(data, response, error) in
                if error != nil {
                    completed(.failure(.unableToComplete))
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completed(.failure(.invalidResponse))
                    return
                }
                guard let data else {
                    completed(.failure(.invalidData))
                    return
                }
                 
                do{
                    let decoder = JSONDecoder()
                    let appetizersData = try decoder.decode(AppetizersResponse.self, from: data)
                    completed(.success(appetizersData.request))
                }
                catch{
                    completed(.failure(.invalidData))
                    return
                }
            }
            task.resume()
        }
        
    }
    
    func downloadImage(fromUrlString url: String,completed:@escaping(UIImage?)-> Void){
        let cacheKey = NSString(string: url)
        if let cachedImage = cache.object(forKey: cacheKey) {
            completed(cachedImage)
            return
        }
        
        guard let url = URL(string: url) else {
            completed(nil)
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)){(data, response, error) in
                guard let data = data, let image = UIImage(data: data) else {
                    completed(nil)
                    return
                }
                completed(image)
                cache.setObject(image, forKey: cacheKey)
            }
            task.resume()
        }
        
    }
}
