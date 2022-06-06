//
//  Helpers.swift
//  Cypto Report
//
//  Created by Jerry Purnama on 12/04/21.
//

import Foundation
import Moya

//MARK: Enum
enum status {
    case success
    case failed
}

//MARK: plugin Moya
class CompleteUrlLoggerPlugin: PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
        print(request.request?.url?.absoluteString ?? "Something is wrong")
    }
}

//Default tableView cell
public class DefaultTableViewCell: UITableViewCell {}
