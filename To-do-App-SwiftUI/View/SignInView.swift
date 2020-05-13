//
//  SignInView.swift
//  To-do-App-SwiftUI
//
//  Created by vitor.ferrazvarela on 13/05/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//
import Foundation
import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var coordinator: SignInWithAppleCoordinator?
    
    var body: some View {
        VStack {
            Text("Thank for using To-do App. Sign in here")
            SignInWithAppleButton().frame(width: 280, height: 45).onTapGesture {
                self.coordinator = SignInWithAppleCoordinator()
                if let coordinator = self.coordinator {
                    coordinator.startSignInWithAppleFlow {
                        print("You successfully signed in")
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
                
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
