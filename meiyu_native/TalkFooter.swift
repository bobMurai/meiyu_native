//
//  TalkFooter.swift
//  meiyu_native
//
//  Created by 村井翔 on 2020/12/14.
//

import SwiftUI
import Moya
import SwiftyJSON

struct TalkFooter: View {
    //let category: TodoEntity.Category
    
    var friend_relation_id: String
    @State var newMessage: String = ""
    @Environment(\.managedObjectContext) var viewContext
    
    init(friend_relation_id: String){
        self.friend_relation_id = friend_relation_id
    }
    
    fileprivate func sendMessage() {
        //send a chat to remote db
        let provider = MoyaProvider<MeiyuApiClient>()
        provider.request(.send_chat(friend_relation_id: self.friend_relation_id, content: self.newMessage)) { result in
            print(result)
            switch result {
                case let .success(res):
                    let data = try? res.mapJSON()
                    let dataJson = JSON(data!)["data"]
                    let statusCode = res.statusCode // Int - 200, 401, 500, etc
                    if(statusCode == 200){
                        print(dataJson)
                        print(dataJson["created_at"])
                        ChatsEntity.create(in: self.viewContext,
                                          json: dataJson)
                    }else{
//                        print(data!)
                        // implement fail action
                    }

                    // do something in your app
                case let .failure(error):
                // TODO: handle the error == best. comment. ever.
                    print(error)
                    // implement fail action
            }
        }
        self.newMessage = ""
    }
    
    var body: some View {
        HStack {
            TextField("message", text: $newMessage, onCommit:  {
                self.sendMessage()
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                self.sendMessage()
            }) {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.black)
                    .font(.title)
            }
        }
        .padding(10)
        .background(Color.tBackground)
    }
}

struct TalkFooter_Previews: PreviewProvider {
    static var previews: some View {
        TalkFooter(friend_relation_id: "1")
    }
}
