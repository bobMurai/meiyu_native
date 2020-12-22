//
//  ChatsEntity+Extension.swift
//  meiyu_native
//
//  Created by 村井翔 on 2020/12/16.
//


import CoreData
import SwiftUI
import SwiftyJSON

extension ChatsEntity {
    
    static func create(in managedObjectContext: NSManagedObjectContext,
                       json: Any
//                       id: String,
//                       friend_relation_id: String,
//                       user_id: String,
//                       content: String,
//                       created_at: Date,
//                       updated_at: Date
    ){
        let chat = self.init(context: managedObjectContext)
        let dataJson = JSON(json)
        chat.id = dataJson["id"].string
        chat.friend_relation_id = dataJson["friend_relation_id"].string
        chat.user_id = dataJson["user_id"].string
        chat.content = dataJson["content"].string
        chat.created_at = Util.dateFromString(string: dataJson["created_at"].string!, format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
        chat.updated_at = Util.dateFromString(string: dataJson["updated_at"].string!, format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
        
        do {
            try  managedObjectContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}

    
//
//    enum Category: Int16 {
//        case ImpUrg_1st     // Important & Urgent (第Ⅰ領域）
//        case ImpNUrg_2nd    // Important & Not Urgent (第Ⅱ領域）
//        case NImpUrg_3rd    // Not Important & Urgent（第Ⅲ領域）
//        case NImpNUrg_4th   // Not Important & Not Urgent（第Ⅳ領域）
//
//        func toString() -> String {
//            switch self {
//            case .ImpUrg_1st:
//                return "重要かつ緊急"
//            case .ImpNUrg_2nd:
//                return "重要だが緊急ではない"
//            case .NImpUrg_3rd:
//                return "重要でないが緊急"
//            case .NImpNUrg_4th:
//                return "重要でも緊急でもない"
//            }
//        }
//        func image() -> String {
//            switch self {
//            case .ImpUrg_1st:
//                return "flame"
//            case .ImpNUrg_2nd:
//                return "tortoise.fill"
//            case .NImpUrg_3rd:
//                return "alarm"
//            case .NImpNUrg_4th:
//                return "tv.music.note"
//            }
//        }
//        func color() -> Color {
//            switch self {
//            case .ImpUrg_1st:
//                return .tRed
//            case .ImpNUrg_2nd:
//                return .tBlue
//            case .NImpUrg_3rd:
//                return .tGreen
//            case .NImpNUrg_4th:
//                return .tYellow
//            }
//        }
//    }
//
//    enum State: Int16 {
//        case todo
//        case done
//    }
//
//    static func count(in managedObjectContext: NSManagedObjectContext,
//                      category: Category) -> Int {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TodoEntity")
//        fetchRequest.predicate = NSPredicate(format: "category == \(category.rawValue)")
//
//
//        do {
//            let count = try managedObjectContext.count(for: fetchRequest)
//            return count
//        } catch  {
//            print("Error: \(error.localizedDescription)")
//            return 0
//        }
//    }
//}
//
