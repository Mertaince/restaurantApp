//
//  ChatView.swift
//  FoodIsFood
//
//  Created by Mert ATK on 11.06.2023.
//

import SwiftUI

struct ChatView: View {
    
    @State private var text = ""
    var body: some View {
        NavigationStack{
            VStack{
                //Header
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 20, height: 10)
                    .foregroundColor(.gray)
                    .padding(.vertical,5)
                HStack{
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    Text("Canlı Destek")
                        .font(.footnote)
                    Spacer()
                    
                }.padding(.horizontal, 10)
                Spacer()
                ZStack{
                    Capsule()
                        .fill(.gray)
                        .frame(width: 300, height: 50)
                    Text("Size nasıl yardımcı olabiliriz")
                        .foregroundColor(.white)
                }
                HStack{
                    TextField("Metin Giriniz", text: $text)
                        .modifier(TextFieldModifier())
                }
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
