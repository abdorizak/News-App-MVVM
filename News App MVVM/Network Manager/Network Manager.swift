//
//  Network Manager.swift
//  News App MVVM
//
//  Created by Abdirizak Hassan on 1/6/23.
//

import UIKit


final class NetworkManager {
    
    static let shared   = NetworkManager()
    
    private let decoder = JSONDecoder()
    private let cache   = NSCache<NSString, UIImage>()
    
    private init() {
        decoder.keyDecodingStrategy  = .convertFromSnakeCase
    }
    
    func getArticles() async throws -> Article {
        
        let request = try await createRequest(with: URL(string: API.baseURL), type: .GET)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw AppError.invalidResponse
        }
        
        do {
            return try decoder.decode(Article.self, from: data)
        } catch {
            throw AppError.inValidData
        }
    }
    
    private func createRequest(with url: URL?, type: HTTPMethod = .GET) async throws -> URLRequest {
        
        guard let apiURL = url else {
            throw AppError.invalidURL
        }

        var request = URLRequest(url: apiURL)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = type.rawValue
        return request
    }
    
    func downloadImage(from url: String) async -> UIImage? {
        let cacheKey = NSString(string: url)
        if let image = cache.object(forKey: cacheKey) { return image }
        guard let url = URL(string: url) else { return nil}
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return nil }
            cache.setObject(image, forKey: cacheKey)
            return image
        } catch {
            return nil
        }
        
    }
}
