//
//  EmailView.swift
//  FoodIsFood
//
//  Created by Mert ATK on 9.06.2023.
//

import SwiftUI
import Firebase

struct EmailView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var registrationResult = ""
    @State private var showPassword = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Rectangle()
                        .frame(height: 500)
                        .foregroundColor(.red)
                        .edgesIgnoringSafeArea(.vertical)
                        
                    
                    Spacer()
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 13)
                        .foregroundColor(Color.white)
                        .frame(width: 370, height: 390)
                    VStack{
                        Spacer()
                        Text("Geçerli bir eposta giriniz sonradan eposta değişikliği mümkün değildir")
                            .multilineTextAlignment(.leading)
                            .font(.footnote)
                            .foregroundColor(Color(.systemGray))
                            .padding()
                        TextField("Adınız", text: $firstName)
                            .modifier(TextFieldModifier())
                        
                        TextField("Soyadınız", text: $lastName)
                            .modifier(TextFieldModifier())
                        
                        TextField("E-mail hesabınızı girin", text: $email)
                            .modifier(TextFieldModifier())
                        Spacer()
                            .frame(height: 8)
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
                        }.padding(.vertical,2)
                        
                        Button{
                            let user = User(firstName: firstName, lastName: lastName, email: email, password: password)
                            registerUser(user: user) { result in
                                switch result {
                                case .success(_): break
                                    
                                case .failure(let error):
                                    registrationResult = "Kayıt hatası \(error.localizedDescription)"
                                }
                                
                            }
                            
                        }label:{
                            Text("İlerle")
                                .modifier(ButtonModifierGreen())
                        }
                        Text(registrationResult)
                            .font(.footnote)
                            .foregroundColor(Color(.systemRed))
                        Spacer()
                    }
                }
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
    
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView()
    }
}
