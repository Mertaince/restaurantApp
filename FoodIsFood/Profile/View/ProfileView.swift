//
//  ProfileView.swift
//  FoodIsFood
//
//  Created by Mert ATK on 11.06.2023.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @State private var user: User?
    
    @EnvironmentObject private var sessionManeger: SessionManager
    @State private var showinLoginView = false
    @State private var showingAlert = false
    
    @State private var isCartViewPresented = false
    var body: some View {
        
        NavigationStack{
            VStack{
                Form{
                    Section{
                        HStack{
                            //header
                            Image(systemName:"person.crop.circle")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                            VStack(alignment: .leading){
                                Text("Hoşgeldiniz")
                                    .bold()
                                HStack{
                                    Text("\(user?.firstName ?? "")")
                                    Text("\(user?.lastName ?? "")")
                                }
                            }.padding()
                                .onAppear {
                                            fetchUserData { result in
                                                switch result {
                                                case .success(let fetchedUser):
                                                    user = fetchedUser
                                                case .failure(let error):
                                                    print("Kullanıcı verileri alınamadı: \(error.localizedDescription)")
                                                }
                                            }
                                        }
                                
                        }
                    }
                        
                    
                    
                    ScrollView{
                        Section{
                            VStack(alignment: .leading){
                                
                                HStack{
                                    Button{
                                        
                                    }label:{
                                        Image(systemName: "cart")
                                        Text("Siparişlerin")
                                        
                                    }
                                }
                                Divider()
                                HStack{
                                    Button{
                                        
                                    }label:{
                                        Image(systemName: "house")
                                        Text("Adreslerim")
                                        
                                    }
                                    
                                }
                                Divider()
                                HStack{
                                    Button{
                                        
                                    }label:{
                                        Image(systemName: "star")
                                        Text("Favorilerim")
                                        
                                    }
                                    
                                }
                                Divider()
                                HStack{
                                    Button{
                                        
                                    }label:{
                                        Image(systemName: "creditcard")
                                        Text("Ödeme Yöntemi")
                                        
                                    }
                                    
                                }
                                Divider()
                            }
                        }
                        Section{
                            VStack(alignment: .leading){
                                HStack{
                                    Button{
                                        
                                    }label:{
                                        Image(systemName: "cart")
                                        Text("Fatura Bilgileri")
                                        
                                    }
                                    
                                }
                                
                                Divider()
                                HStack{
                                    Button{
                                        
                                    }label:{
                                        Image(systemName: "basket")
                                        Text("Siparişlerin")
                                        
                                    }
                                    
                                }
                                Divider()
                                
                            }
                        }
                    }.padding()
                    
                    
                        Section{
                            ScrollView{
                            VStack(alignment: .leading){
                                HStack{
                                    Button{
                                        
                                    }label:{
                                        Image(systemName: "lock")
                                        Text("Hesap Ayarları")
                                        
                                    }
                                    
                                }
                                
                                Divider()
                                HStack{
                                    Button{
                                        
                                    }label:{
                                        Image(systemName: "gear")
                                        Text("Uygulama Ayarları")
                                        
                                    }
                                    
                                }
                                Divider()
                            }
                            
                            
                        }
                    }.padding()
                    
                    Section{
                        ScrollView{
                            VStack(alignment: .leading){
                                HStack{
                                    Button{
                                        isCartViewPresented = true
                                    }label:{
                                        Image(systemName: "message")
                                        Text("Canlı Destek")
                                        
                                    }.sheet(isPresented: $isCartViewPresented){
                                        ChatView()
                                    }
                                    
                                    
                                }
                                Divider()
                                HStack{
                                    Button{
                                        showingAlert = true
                                    }label:{
                                        Image(systemName: "questionmark.circle")
                                        Text("Yardım")
                                        
                                    }.alert("Copyright Mert İnce", isPresented: $showingAlert){
                                        Button("Tamam", role: .cancel){ }
                                    }
                                    
                                    
                                }
                                Divider()
                                HStack{
                                        Button(action: {
                                            sessionManeger.signOut()
                                            showinLoginView = true
                                        }, label: {
                                            Image(systemName: "multiply.circle")
                                            Text("Çıkış")
                                        }).fullScreenCover(isPresented: $showinLoginView){
                                            LoginView()
                                        }
                                }.foregroundColor(.red)
                                
                                
                                Divider()
                                Group{
                                    Text("Copyright Mert İnce")
                                    Divider()
                                    Text("Version 1.0")
                                }.font(.footnote)
                                    .foregroundColor(Color(.systemGray3))
                                
                            }
                        }
                    }.padding()
                }
                
                
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    
}


struct ProfileView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProfileView()
    }
}
