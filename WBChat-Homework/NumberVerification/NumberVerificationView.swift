//
//  NumberVerificationView.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 12.07.2024.
//

import SwiftUI

struct NumberVerificationView: View {
    @State var selectedCountry: Country
    @State private var phoneNumber: String = ""
    @State private var showProgressView: Bool = false
    @State private var navigateToCodeVerification: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    textDescription
                    HStack {
                        countryMenu
                        phoneNumberInput
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 49)
                    continueButton
                }
                
                .blur(radius: showProgressView ? 5 : 0)
                
                if showProgressView {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5, anchor: .center)
                        .padding()
                        .background(Color.white.opacity(0.8), in: RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 10)
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    BackButton()
                }
            }
            .padding(.top, 169)
            Spacer()
                .navigationDestination(isPresented: $navigateToCodeVerification) {
                    CodeVerificationView(phoneNumber: phoneNumber)
                }
        }
    }

    private var textDescription: some View {
        VStack {
            Text(NSLocalizedString("enter_phone_number", comment: ""))
                .font(.system(size: 24, weight: .bold))
                .padding(.bottom, 8)
            Text(NSLocalizedString("confirmation_code_message", comment: ""))
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
        }
        
    }
    
    private var countryMenu: some View {
        HStack {
            Menu {
                ForEach(Country.countries) { country in
                    Button(action: {
                        selectedCountry = country
                    }) {
                        HStack {
                            Text("\(country.flag) \(country.name)   \(country.code)")
                        }
                    }
                }
            } label: {
                HStack {
                    Text(selectedCountry.flag)
                    Text(selectedCountry.code)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(UIColor.systemGray6))
                )
            }
        }
    }
    
    private var phoneNumberInput: some View {
        TextField("000 000-00-00", text: $phoneNumber)
        
            .foregroundColor(.gray)
            .fontWeight(.semibold)
            .padding(.horizontal, 8)
            .padding(.vertical, 10)
            .keyboardType(.numberPad)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor.systemGray6))
            )
            .onChange(of: phoneNumber) {
                phoneNumber = phoneNumber.formatCustomNumber(mask: "XXX XXX-XX-XX")
                
            }
            .onChange(of: isPhoneNumberValid()) {
                hideKeyboard()
                
            }
        
            .onTapGesture {
                hideKeyboard()
            }
        
    }
    
    private var continueButton: some View {
        Button(action: {
            showProgressView = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                showProgressView = false
                navigateToCodeVerification = true
            }
            
        }) {
            HStack {
                Spacer()
                Text(NSLocalizedString("continue", comment: ""))
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .padding(.horizontal, 48)
                    .padding(.vertical, 12)
                Spacer()
            }
        }
        .padding(.vertical, 7)
        .background(isPhoneNumberValid() ? .purple : .purple.opacity(0.5))
        .cornerRadius(30)
        .disabled(!isPhoneNumberValid())
        .padding(.horizontal, 24)
        .padding(.top, 69)
        
    }
    
    private func isPhoneNumberValid() -> Bool {
        phoneNumber.filter({ $0.isNumber }).count == selectedCountry.digits
    }
}

#Preview {
    NumberVerificationView(selectedCountry: .init(name: "Russia", flag: "🇷🇺", code: "+7", digits: 10))
   
    
}
