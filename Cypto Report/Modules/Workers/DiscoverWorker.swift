//
//  DiscoverWorker.swift
//  Cypto Report
//
//  Created by Jeri Purnama on 26/02/22.
//

import Foundation
import RxCocoa
import RxSwift
import Moya
import SwiftyJSON

protocol IDiscoverWorker: AnyObject {
    //here
}

class DiscoverWorker: IDiscoverWorker {
    var disposeBag: DisposeBag! = DisposeBag()
    var provider: MoyaProvider<NetworkService>! = MoyaProvider<NetworkService>(plugins: [CompleteUrlLoggerPlugin()])
    
}
