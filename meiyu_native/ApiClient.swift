//
//  ApiClient.swift
//  meiyu_native
//
//  Created by 村井翔 on 2020/12/18.
//

import Foundation
import Moya

enum MeiyuApiClient {
    case sign_up(email: String, password: String)
    case delete_account
    case sign_in(email: String, password: String)
    case apply_for_meiyu(user_id: String)
    case update_meiyu_status(id: String, friend_status: Int)
    case update_user(id: String, email: String, nickname: String, photo_url: String, nearest_station: String, birthday: Date, social_position: Int, job: String, introduction: String)
    case sync
    case send_chat(friend_relation_id: String, content: String)
}


// MARK: - TargetType Protocol Implementation
extension MeiyuApiClient: TargetType {
    var baseURL: URL { return URL(string: "http://localhost:3000")! }
    var path: String {
        switch self {
        case .sign_up, .delete_account:
            return "/auth"
        case .sign_in:
            return "/auth/sign_in"
        case .apply_for_meiyu, .update_meiyu_status:
            return "/friend_relations"
        case .update_user:
            return "/users"
        case .sync:
            return "/sync"
        case .send_chat:
            return "/chats"
        }
    }
    var method: Moya.Method {
        switch self {
        case .sign_up, .sign_in, .apply_for_meiyu, .send_chat:
            return .post
        case .sync:
            return .get
        case .update_user, .update_meiyu_status:
            return .put
        case .delete_account:
            return .delete
        }
    }
    var task: Task {
        switch self {
        case .delete_account, .sync: // Send no parameters
            return .requestPlain
        case let .sign_up(email, password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case let .sign_in(email, password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case let .apply_for_meiyu(user_id):
            return .requestParameters(parameters: ["user_id": user_id], encoding: JSONEncoding.default)
        case let .update_meiyu_status(id, friend_status):
            return .requestParameters(parameters: ["id": id, "friend_status": friend_status], encoding: JSONEncoding.default)
        case let .update_user(id, email, nickname, photo_url, nearest_station, birthday, social_position, job, introduction):
            return .requestParameters(parameters: ["id": id, "email": email,"nickname": nickname, "photo_url": photo_url, "nearest_station": nearest_station, "birthday": birthday, "social_position": social_position, "job": job, "introduction": introduction], encoding: JSONEncoding.default)
        case let .send_chat(friend_relation_id, content):
            return .requestParameters(parameters: ["friend_relation_id": friend_relation_id, "content": content], encoding: JSONEncoding.default)
        }
    }
    
    //must fix this stab, now temporally return a brank string
    var sampleData: Data {
        switch self {
        case .sign_up:
            return "".utf8Encoded
        case .sign_in:
            return "".utf8Encoded
        case .apply_for_meiyu:
            return "".utf8Encoded
        case .update_meiyu_status:
            return "".utf8Encoded
        case .update_user:
            return "".utf8Encoded
        case .sync:
            return "".utf8Encoded
        case .send_chat:
            return "".utf8Encoded
        case .delete_account:
            return "".utf8Encoded
        }
    }
    var headers: [String: String]? {
        //get the access token from userdefault.
        //and add it into the header.
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
