//
//  CoreDate.SavedNewsManager.swift
//  CovidTracking
//
//  Created by Tiến on 5/26/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import CoreData
import Then

extension CoreDataManager.SavedNewsManager {
    
    func fetchAllSavedArticles() -> Observable<[SavedArticles]> {
        return Observable.create { observer in
            do {
                let data = try CoreDataManager.shared.context.fetch(SavedArticles.fetchRequest()) as? [SavedArticles]
                observer.onNext(data ?? [])
            } catch {
                observer.onError(CoreDataError.fetchError)
            }
            return Disposables.create()
        }
    }
    
    func saveArticles(articles: Articles, completion: @escaping () -> [Articles] ) -> Observable<[Articles]> {
        return Observable.create { observer in
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedArticles")
                .then {
                    $0.predicate = NSPredicate(format: "articlesUrl = %@", articles.articlesUrl)
            }
            do {
                let check = try CoreDataManager.shared.context.fetch(fetchRequest)
                if check.isEmpty {
                    SavedArticles(context: CoreDataManager.shared.context)
                        .do {
                            $0.title = articles.title
                            $0.descripton = articles.description
                            $0.publishTime = articles.publishedDateTime
                            $0.imageUrl = articles.imageUrl
                            $0.articlesUrl = articles.articlesUrl
                    }
                    try CoreDataManager.shared.context.save()
                    observer.onNext(completion())
                    observer.onCompleted()
                } else {
                    observer.onError(CoreDataError.addError)
                }
            } catch {
                observer.onError(CoreDataError.addError)
            }
            return Disposables.create()
        }
    }
    
    func removeAritcle(articlesUrl: String, completion: @escaping () -> [Articles] ) -> Observable<[Articles]> {
        return Observable.create { observer in
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedArticles").then {
                $0.predicate = NSPredicate(format: "articlesUrl = %@", articlesUrl)
            }
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do {
                try CoreDataManager.shared.context.execute(deleteRequest)
                try CoreDataManager.shared.context.save()
                observer.onNext(completion())
                observer.onCompleted()
            } catch {
                observer.onError(CoreDataError.deleteError)
            }
            return Disposables.create()
        }
    }
}
