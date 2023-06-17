//
//  LoginView.swift
//  FoodIsFood
//
//  Created by Mert ATK on 9.06.2023.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    
    
    @State var StatusMessage = ""
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    @State private var showPassword = false
    
    @ObservedObject private var onlynumber = TelefonNum()
    
    var body: some View {
        if userIsLoggedIn{
            TabBar()
        }else{
            content
        }
    }
    
    var content: some View{
        NavigationView{
            ZStack{
//                RadialGradient(gradient: Gradient(colors: [.white, .red]), center: .center, startRadius: 10, endRadius: 470)
//                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Rectangle()
                        .frame(height: 500)
                        .foregroundColor(.red)
                        .edgesIgnoringSafeArea(.vertical)
                        
                    
                    Spacer()
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 13)
                        .foregroundColor(Color.white)
                        .frame(width: 370, height: 450)
                        
                        
                        
                    VStack{
                        Spacer()
                        Image("Logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70, alignment: .center)
                            .padding()
                            
                        
                        TextField("Email", text: $email)
                            .modifier(TextFieldModifier())
                        Spacer()
                            .frame(height:10)
                        ZStack{
                            
                            if showPassword{
                                TextField("Sifre", text: $password)
                                    .modifier(TextFieldModifier())
                            } else{
                                SecureField("Sifre", text: $password)
                                    .modifier(TextFieldModifier())
                            }
                            
                            Button{
                                showPassword.toggle()
                            }label:{
                                Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.gray)
                            }.padding(.leading,300)
                        }
                        
                        Spacer()
                            .frame(height:20)
                        
                        Button{
                            login()
                        }label:{
                            Text("Giris Yap")
                                .modifier(ButtonRedModifier())
                        }
                        
                        Text(self.StatusMessage)
                            .font(.footnote)
                            .foregroundColor(.red)
                        Spacer()
                    }
                    VStack{
                        Spacer()
                            .frame(height: 420)
                        HStack{
                            Rectangle()
                                .frame(width: (UIScreen.main.bounds.width / 2 ) - 60, height: 0.5)
                                .foregroundColor(.red)
                            Text("Veya")
                                .foregroundColor(.gray)
                                
                            Rectangle()
                                .frame(width: (UIScreen.main.bounds.width / 2 ) - 40, height: 0.5)
                                .foregroundColor(.red)
                                
                        }.padding(.vertical, 12)
                            NavigationLink{
                                EmailView()
                                    .navigationBarBackButtonHidden(true)
                            }label:{
                                Text("Yeni hesap oluştur")
                                    .modifier(ButtonRedBorder())
                                    
                            }
                            
                        
                    }
                }
            }.onAppear{
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil{
                        userIsLoggedIn.toggle()
                    }else{
                    }
                }
            }
        }
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
                self.StatusMessage = "Eposta veya şifre hatalı tekrar deneyin"
            }else{
                //print("başarılı giriş")
            }
        }
    }
}




struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

class TelefonNum: ObservableObject{
    @Published var value = "" {
        didSet{
            let filtered = value.filter{$0.isNumber}
            if value != filtered{
                value = filtered
                
            }
        }
    }
}




