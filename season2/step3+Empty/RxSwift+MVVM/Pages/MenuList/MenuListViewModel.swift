//
//  MenuListViewModel.swift
//  RxSwift+MVVM
//
//  Created by 이관렬 on 2021/08/29.
//  Copyright © 2021 iamchiwon. All rights reserved.
//

import Foundation
import RxSwift

class MenuListViewModel {
    
    init() {
        let menus: [Menu] = [
            Menu(name: "튀김1", price: 100, count: 0),
            Menu(name: "튀김2", price: 200, count: 0),
            Menu(name: "튀김3", price: 300, count: 0),
            Menu(name: "튀김4", price: 400, count: 0)
        ]
        
        menuObsevable.onNext(menus)
    }

    lazy var menuObsevable = PublishSubject<[Menu]>()
    
    lazy var itemsCount = menuObsevable.map {
        $0.map { $0.count }.reduce(0, +)
    }

    lazy var totalPrice = menuObsevable.map {
        $0.map { $0.price * $0.count }.reduce(0, +)
    }
    
}
