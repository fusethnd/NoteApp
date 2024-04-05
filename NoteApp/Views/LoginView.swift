//
//  LoginView.swift
//  NoteApp
//
//  Created by Thanadon Boontawee on 3/4/2567 BE.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "Notes", subtitle: "Memo your work", angle: 15, background: .pink)
                
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In", background: .blue) {
                        viewModel.login()
                    }
                }
                VStack {
                    Text("Don't have an Account?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
