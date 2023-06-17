//
//  Modifier.swift
//  FoodIsFood
//
//  Created by Mert ATK on 9.06.2023.
//

import SwiftUI

struct TextFieldModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(18)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 22)
            .foregroundColor(.black)
    }
}

struct ButtonModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(12)
            .frame(width: 350, height: 50)
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

struct MainButtonModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(width: 150, height: 50)
            .background(Color(.systemRed))
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

struct ButtonModifierGreen: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(12)
            .frame(width: 350, height: 50)
            .background(Color(.systemGreen))
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

struct ButtonRedBorder: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(width: 350, height: 60)
            .background(.white)
            .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.red, lineWidth: 2))
            .foregroundColor(.red)
            
    }
}

struct ButtonRedModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(width: 350, height: 60)
            .background(Color(.systemRed))
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

