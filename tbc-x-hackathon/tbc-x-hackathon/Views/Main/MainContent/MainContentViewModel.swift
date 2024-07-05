//
//  MainContentViewModel.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 04.07.24.
//

import Foundation

final class MainContentViewModel: ObservableObject {
    @Published var modules: [Module] = []
    @Published var chapters: [LevelData] = []
    @Published var questions: [Questions] = []
    @Published var selectedAnswer: Int? = nil
    @Published var showCorrectAnswer: Bool = false
    @Published var isCorrect: Bool = false
    
    private let tokenKey = "some.keys.token"
    @Published var money: Int = 0
    
    var simulations = [
        Simulate(image: "placeholder1", name: "A day in the bank"),
        Simulate(image: "placeholder2", name: "Create an eWallet"),
        Simulate(image: "placeholder3", name: "A day at the store"),
        Simulate(image: "placeholder1", name: "Fund a company")
    ]
    
    
    init() {
        fetchModules()
    }
    
    func fetchModules() {
        NetworkService.shared.fetchModules { [weak self] modules, error in
            if let modules = modules {
                DispatchQueue.main.async {
                    self?.modules = modules
                }
            } else if let error = error {
                print("Error fetching modules:", error.localizedDescription)
            }
        }
    }
    
    func fetchChapters(for moduleId: Int) {
        NetworkService.shared.fetchChapters(moduleId: moduleId) { [weak self] chapters, error in
            if let chapters = chapters {
                DispatchQueue.main.async {
                    self?.chapters = chapters
                }
            } else if let error = error {
                print("Error fetching chapters:", error.localizedDescription)
            }
        }
    }
    
    func fetchQuestions(for chapterId: Int) {
        print(chapterId)
        NetworkService.shared.fetchQuestions(chapterId: chapterId) { [weak self] chapter, error in
            if let chapter = chapter {
                DispatchQueue.main.async {
                    self?.questions = chapter.questions ?? []
                }
            } else if let error = error {
                print("Error fetching questions:", error.localizedDescription)
            }
        }
    }
    
    func checkAnswer(answerId: Int, completion: @escaping (Bool) -> Void) {
        NetworkService.shared.checkAnswer(answerId: answerId) { [weak self] isCorrectResponse, error in
            if let isCorrectResponse = isCorrectResponse {
                DispatchQueue.main.async {
                    self?.isCorrect = isCorrectResponse
                    self?.showCorrectAnswer = true
                    completion(isCorrectResponse)
                }
            }
        }
    }
    
    func resetStates() {
        selectedAnswer = nil
        showCorrectAnswer = false
        isCorrect = false
    }
    
    func getSimulations() -> [Simulate] {
        return simulations
    }
    
    
    func getFullImagePath(relativePath: String) -> String {
        "\(NetworkService.shared.baseUrl)\(relativePath)"
    }
    
    func completeTask() {
        money += 1
        // this should be done through backend, but no time
        // adittionally send completed chapter or module id to track them.
    }
    
}
