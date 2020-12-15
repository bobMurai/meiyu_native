//
//  TalkFooter.swift
//  meiyu_native
//
//  Created by 村井翔 on 2020/12/14.
//

import SwiftUI

struct TalkFooter: View {
    //let category: TodoEntity.Category
    
    @State var newMessage: String = ""
    //@Environment(\.managedObjectContext) var viewContext
    
    fileprivate func sendMessage() {
        //TodoEntity.create(in: self.viewContext,
                          //category: self.category,
                          //task: self.newTask)
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
        TalkFooter()
    }
}
