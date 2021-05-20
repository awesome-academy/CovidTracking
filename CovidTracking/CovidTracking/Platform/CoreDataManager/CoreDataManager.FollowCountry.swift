//
//  CoreDataManager.FollowCountry.swift
//  CovidTracking
//
//  Created by Tiến on 5/20/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import CoreData
import RxSwift
import Then

extension CoreDataManager.FollowCountryManager {

    func fetchAllCountryData() -> Observable<[FollowCountry]> {
        return Observable.create { observable in
            do {
                let data = try CoreDataManager.shared.context.fetch(FollowCountry.fetchRequest()) as? [FollowCountry]
                observable.onNext(data ?? [])
            } catch {
                observable.onError(CoreDataError.fetchError)
            }
            return Disposables.create()
        }
    }

    func addNewCountry(countryName: String) -> Completable {
        return Completable.create { completable in
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FollowCountry").then {
                 $0.predicate = NSPredicate(format: "name = %@", countryName)
            }
            do {
                let check = try CoreDataManager.shared.context.fetch(fetchRequest)
                if check.isEmpty {
                    let _ = FollowCountry(context: CoreDataManager.shared.context).do {
                        $0.name = countryName
                    }
                    try CoreDataManager.shared.context.save()
                    completable(.completed)
                } else {
                    completable(.error(CoreDataError.addError))
                }
            } catch {
                completable(.error(CoreDataError.addError))
            }
            return Disposables.create()
        }
    }

    func deleteCountry(country: FollowCountry) -> Completable {
        return Completable.create { completable in
            CoreDataManager.shared.context.delete(country)
            do {
                try CoreDataManager.shared.context.save()
                completable(.completed)
            } catch {
                completable(.error(CoreDataError.deleteError))
            }
            return Disposables.create()
        }
    }
}
