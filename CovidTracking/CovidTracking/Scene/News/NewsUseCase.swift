//
//  NewsUseCase.swift
//  CovidTracking
//
//  Created by Tiến on 5/25/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol NewsUseCaseType {
    func getNews() -> Observable<[Articles]>
    func getSavedArticles() -> Observable<[SavedArticles]>
    func saveArticles(aritcles: Articles, completion: @escaping () -> [Articles]) -> Observable<[Articles]>
    func removeArticles(articles: Articles, completion: @escaping () -> [Articles]) -> Observable<[Articles]>
}

struct NewsUseCase: NewsUseCaseType {
    
    func saveArticles(aritcles: Articles, completion: @escaping () -> [Articles]) -> Observable<[Articles]> {
        return CoreDataManager.SavedNewsManager.shared.saveArticles(articles: aritcles, completion: completion)
    }
    
    func removeArticles(articles: Articles, completion: @escaping () -> [Articles]) -> Observable<[Articles]> {
        return CoreDataManager.SavedNewsManager.shared.removeAritcle(articlesUrl: articles.articlesUrl, completion: completion)
    }
    
    func getNews() -> Observable<[Articles]> {
        return APIServices.shared.getNews()
    }
    
    func getSavedArticles() -> Observable<[SavedArticles]> {
        return CoreDataManager.SavedNewsManager.shared.fetchAllSavedArticles()
    }
    
}
