//
//  HomeViewModel.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/3/23.
//

import Foundation
import Combine

/// View model for home screen.
final class HomeViewModel {
    
    let didFetchingCompleted: PassthroughSubject<Void, Never> = .init()
    
    let didFetchingFailed: PassthroughSubject<String, Never> = .init()
    
    @Published
    var articles: [ArticleItem] = []
    @Published
    var articlesCategories: [ArticleCategories] = []
    
    struct ArticleItem {
        let id: Int
        let title: String
        let content: String
    }
    
    struct ArticleCategories {
        let name: String
    }
    
    func fetchAPI() {
        fetchLogin()
        fetchArticle()
        fetchArticleCategories()
    }
    
    func fetchLogin() {
        APIClient.login(
            loginRequest: .init(
                email: "superadmin@onenex.co",
                password: "password"
            )
        ) { result in
            switch result {
            case .success(let response):
                guard let token = response.data?.accessToken else { return }
                UserDefaults.standard.set(token, forKey: "Token")
                self.didFetchingCompleted.send()
            case .failure(let error):
                self.didFetchingFailed.send(error.localizedDescription)
            }
        }
    }
    
    func fetchArticle() {
        APIClient.getArticle { result in
            switch result {
            case .success(let response):
                let article = response.data.map { $0.value }
                self.articles = article.map {
                    .init(
                        id: $0.id ?? 0,
                        title: $0.title ?? "",
                        content: $0.content ?? ""
                    )
                }
                self.didFetchingCompleted.send()
            case .failure(let error):
                self.didFetchingFailed.send(error.localizedDescription)
            }
        }
    }
    
    func fetchArticleCategories() {
        APIClient.getArticleCategories { result in
            switch result {
            case .success(let response):
                let article = response.data.map { $0.value }
                self.articlesCategories = article.map {
                    .init(
                        name: $0.name ?? ""
                    )
                }
                self.didFetchingCompleted.send()
            case .failure(let error):
                self.didFetchingFailed.send(error.localizedDescription)
            }
        }
    }
    
}
