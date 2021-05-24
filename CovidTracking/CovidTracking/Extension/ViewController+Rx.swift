//
//  ViewController+Rx.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/24/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

extension Reactive where Base: UIViewController {

    public var viewWillAppear: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewWillAppear))
            .map { _ in }
        return ControlEvent(events: source)
      }
}
