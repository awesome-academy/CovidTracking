//
//  NewsViewModel.swift
//  CovidTracking
//
//  Created by Tiến on 5/25/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import NSObject_Rx
import Then

struct NewsViewModel: ViewModel {
    
    let navigator: NewsNavigatorType
    let useCase: NewsUseCaseType
    let isSavedNews: Bool
    
    let dataSource = BehaviorRelay<[Articles]>(value: [])
    let savedData = BehaviorRelay<[String]>(value: [])
        
    struct Input {
        let loadTrigger: Driver<Void>
        let cellSelected: Driver<IndexPath>
        let saveButtonTrigger: Driver<(Int, Bool)>
    }
    
    struct Output {
        let newsList: Driver<[Articles]>
        let getData: Driver<[Articles]>
        let loadCoreData: Driver<Void>
        let pushToSafariView: Driver<Void>
        var saveButtonAction: Driver<Void>
    }
    
    func transform(_ input: Input) -> Output {
        
        let newsList = dataSource.asDriver()
        
        let loadCoreData = input.loadTrigger
            .flatMapLatest { _ in
                return self.useCase.getSavedArticles().asDriver(onErrorJustReturn: [])
        }
        .map { data -> [String] in
            return data.map { ($0.articlesUrl ?? "") }
        }
        .do(onNext: savedData.accept)
        .mapToVoid()
        
        let selected = input.cellSelected
            .withLatestFrom(newsList) { indexPath, newsList in
                return newsList[indexPath.row]
        }
        .do(onNext: { news in
            self.navigator.pushToSafari(urlString: news.articlesUrl)
        })
        .mapToVoid()
        
        let saveButtonAction = input.saveButtonTrigger
            .withLatestFrom(dataSource.asDriver()) { ($0, $1) }
            .flatMapLatest({ tuple, articles -> Driver<[Articles]> in
                let (index, saved) = tuple
                if !saved {
                    return self.useCase.saveArticles(aritcles: articles[index]) {
                        articles.with { $0[tuple.0].isSaved = true }
                    }
                    .asDriverOnErrorJustComplete()
                } else {
                    return self.useCase.removeArticles(articles: articles[index]) {
                        articles.with { $0[tuple.0].isSaved = false }
                    }
                    .asDriverOnErrorJustComplete()
                }
            })
            .do(onNext: dataSource.accept)
            .mapToVoid()
        
        if !isSavedNews {
            let getData = input.loadTrigger
                .flatMapLatest {
                    return self.useCase.getNews().asDriver(onErrorJustReturn: [])
            }
            .withLatestFrom(savedData.asDriver()) { articles, urls in
                return articles.map {
                    if urls.contains($0.articlesUrl) {
                        return $0.with {
                            $0.isSaved = true
                        }
                    }
                    return $0
                }
            }
            .do(onNext: dataSource.accept)
            
            return Output(newsList: newsList,
                                 getData: getData,
                                 loadCoreData: loadCoreData,
                                 pushToSafariView: selected,
                                 saveButtonAction: saveButtonAction)
        } else {
            let getData = input.loadTrigger
                .flatMapLatest {
                    return self.useCase.getSavedArticles().asDriverOnErrorJustComplete()
            }
            .map { (savedArticles) -> [Articles] in
                return savedArticles.map { (savedArticle) -> Articles in
                    return Articles().with {
                        $0.title = savedArticle.title ?? ""
                        $0.description = savedArticle.descripton ?? ""
                        $0.publishedDateTime = savedArticle.publishTime ?? ""
                        $0.imageUrl = savedArticle.imageUrl ?? ""
                        $0.articlesUrl = savedArticle.articlesUrl ?? ""
                        $0.isSaved = true
                    }
                }
            }
            .do(onNext: dataSource.accept)
            
            return Output(newsList: newsList,
                                 getData: getData,
                                 loadCoreData: loadCoreData,
                                 pushToSafariView: selected,
                                 saveButtonAction: saveButtonAction)
        }
    }
}
