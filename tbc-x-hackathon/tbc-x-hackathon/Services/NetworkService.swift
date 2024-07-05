//
//  NetworkService.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 05.07.24.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    private init() {}
    
    let baseUrl = "http://178.134.88.6:5141"
    
    func performRequest(
        urlPath: String,
        method: String,
        body: [String: Any]? = nil,
        completion: @escaping (Data?, URLResponse?, Error?) -> Void
    ) {
        guard let url = URL(string: baseUrl + urlPath) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let token = KeychainService.shared.retrieveFromKeychain(key: "some.keys.token") {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        if let body = body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: completion)
        task.resume()
    }
    
    func fetchModules(completion: @escaping ([Module]?, Error?) -> Void) {
        performRequest(urlPath: "/Module", method: "GET") { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            do {
                let modules = try JSONDecoder().decode([Module].self, from: data)
                completion(modules, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
    
    func fetchChapters(moduleId: Int, completion: @escaping ([LevelData]?, Error?) -> Void) {
        performRequest(urlPath: "/Module/\(moduleId)", method: "GET") { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            do {
                let module = try JSONDecoder().decode(Module.self, from: data)
                let chapters = module.chapters?.enumerated().map { index, chapter in
                    LevelData(id: chapter.id, chapterNumber: index + 1, isComplete: index < 2)
                }
                completion(chapters, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
    
    func fetchQuestions(chapterId: Int, completion: @escaping (Chapter?, Error?) -> Void) {
        performRequest(urlPath: "/Chapter/\(chapterId)", method: "GET") { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            do {
                let chapter = try JSONDecoder().decode(Chapter.self, from: data)
                completion(chapter, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
    
    func checkAnswer(answerId: Int, completion: @escaping (Bool?, Error?) -> Void) {
        print(answerId)
        performRequest(urlPath: "/Answer/checkAnswer/\(answerId)", method: "GET") { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Bool.self, from: data)
                print(result)
                completion(result, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}

