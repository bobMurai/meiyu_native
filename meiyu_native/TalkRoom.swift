//
//  TalkRoom.swift
//  meiyu_native
//
//  Created by 村井翔 on 2020/12/14.
//

import SwiftUI

struct TalkRoom: View {
    var friend_relation_id: String
    //var chats: []
    
    init(friend_relation_id: String){
        self.friend_relation_id = friend_relation_id
        print(self.friend_relation_id)
        //ここでfriend_relation_idから紐づくチャット履歴を取得する。
    }
    
    var body: some View {
        VStack(spacing: 0){
            Color.tBackground
                .edgesIgnoringSafeArea(.top)
                .frame(height:0)
            TalkHeader(friend_relation_id: self.friend_relation_id)
            
            //ここでChatsのでループを回して、TFForTFSのViewをポンポン入れていく。
            //TFFとTFSの区別はChatのUserIDが自分のUserIDと一致しているかで判断。
            
            Spacer()
            
            TalkFooter(friend_relation_id: self.friend_relation_id)
        }
    }
}

struct TalkRoom_Previews: PreviewProvider {
    static var previews: some View {
        TalkRoom(friend_relation_id: "1")
    }
}
