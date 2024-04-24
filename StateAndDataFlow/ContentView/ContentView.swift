//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(ContentViewViewModel.self) private var contentViewVM
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack {
            Text("Hi, \(loginViewVM.name)")
                .font(.title)
                .padding(.top, 100)
            
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
                
            Spacer()
            
            ButtonView(
                contentViewVM: contentViewVM,
                action: contentViewVM.startTimer,
                text: contentViewVM.buttonTitle,
                buttonColor: .red
            )
            
            Spacer()
            
            ButtonView(
                contentViewVM: contentViewVM,
                action: logout,
                text: contentViewVM.exitButtonTitle,
                buttonColor: .blue
            )
        }
        .padding()
    }
    private func logout() {
        loginViewVM.isLoggedIn = false
        loginViewVM.name = ""
    }
}

#Preview {
    ContentView()
        .environment(ContentViewViewModel())
        .environmentObject(LoginViewViewModel())
}

struct ButtonView: View {
    @Bindable var contentViewVM: ContentViewViewModel
    var action: () -> Void
    var text: String
    var buttonColor: Color

    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(buttonColor)
        .clipShape(.rect(cornerRadius: 20))
        .overlay (
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}


