//
//  CodeVerificationView.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 18.07.2024.
//

import SwiftUI

struct CodeVerificationView: View {
    @State private var verificationCode = Array(repeating: "", count: 4)
    @State private var generatedCode: String = ""
    @State private var isCodeCorrect: Bool = false
    @State private var showError: Bool = false
    @State private var displayedCode: String = ""
    @FocusState private var focusedField: Int?
    
    let phoneNumber: String
    let codeLength = 4
    
    var body: some View {
        NavigationStack {
            VStack {
                headerView
                codeInputView
                errorView
                requestCodeButton
            }
            .onAppear {
                generateVerificationCode()
                NotificationManager.instance.requestAuth()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    BackButton()
                }
            }
            .padding(.top, 169)
            Spacer()
        }
    }
    
    private var headerView: some View {
        VStack {
            Text(LocalizedStrings.enterCode)
                .font(.system(size: 24, weight: .bold))
                .padding(.bottom, 8)
            Text(LocalizedStrings.sentCodeToNumber)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .padding(.bottom, 8)
            Text(phoneNumber)
                .font(.system(size: 14))
                .padding(.bottom, 49)
        }
    }
    private var codeInputView: some View {
        HStack(spacing: 40) {
            ForEach(0..<codeLength, id: \.self) { index in
                codeTextField(for: index)
                    .focused($focusedField, equals: index)
                    .onChange(of: verificationCode[index]) {
                        handleTextFieldChange(for: index, newValue: verificationCode[index])
                        
                    }
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 25)
    }
    
    private func handleTextFieldChange(for index: Int, newValue: String) {
        // Проверяем, что текущий текстовый поле находится в фокусе
        guard focusedField == index else { return }
        
        if newValue.isEmpty {
            // Если текущее поле пустое и это не первое поле, перемещаем фокус на предыдущее поле
            if index > 0 {
                focusedField = index - 1
            }
        } else if newValue.count > 1 {
            // Обработка вставки нескольких символов (например, при вставке)
            let endIndex = index + newValue.count
            
            if endIndex <= verificationCode.count {
                // Распределяем дополнительные символы по массиву
                verificationCode.replaceSubrange(index..<endIndex, with: newValue.map { String($0) })
                // Перемещаем фокус на последний вставленный символ
                focusedField = endIndex - 1
            } else {
                // Если введённое значение содержит больше одного символа, оставляем только первый символ в текущем текстовом поле.
                verificationCode[index] = String(newValue[newValue.startIndex])
            }
            
        }
        // Если текущий индекс - последний и поле не пустое, проверяем код и скрываем клавиатуру
        if index == verificationCode.count - 2 && newValue.count == 1 {
            checkCode()
            hideKeyboard()
        }
    }
    
    
    private var errorView: some View {
        Group {
            if showError {
                Text(LocalizedStrings.incorrectCodeTryAgain)
                    .foregroundColor(.red)
                    .font(.system(size: 14))
                    .padding(.bottom, 15)
            }
        }
    }
    
    private var requestCodeButton: some View {
        Button(action: generateVerificationCode) {
            Text(LocalizedStrings.requestCodeAgain)
                .font(.system(size: 16))
                .foregroundColor(.purple)
                .padding(.horizontal, 48)
                .padding(.vertical, 12)
        }
        .padding(.top, 20)
    }
    
    private func generateVerificationCode() {
        let randomDigitSequence = RandomDigitSequence(length: codeLength)
        generatedCode = randomDigitSequence.joined()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            displayedCode = generatedCode
            NotificationManager.instance.scheduleNotification(code: generatedCode)
        }
        print("Сгенерированный код: \(generatedCode)")
    }
    
    private func checkCode() {
        let enteredCode = verificationCode.joined()
        isCodeCorrect = (enteredCode == generatedCode)
        if isCodeCorrect {
            print("Проверка кода: Успешно")
        } else {
            print("Проверка кода: Неудачно")
            showError = true
            UINotificationFeedbackGenerator().notificationOccurred(.error)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showError = false
                verificationCode = Array(repeating: "", count: 4)
                focusedField = 0
                // Вызов клавиатуры
                UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
                
            }
        }
    }
    
    private func codeTextField(for index: Int) -> some View {
        TextField("", text: $verificationCode[index])
            .frame(width: 24, height: 24)
            .background(verificationCode[index].isEmpty ? Circle().fill(Color(UIColor.systemGray6)) : Circle().fill(Color.white))
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .font(.system(size: 24, weight: .bold))
            .onAppear {
                print(verificationCode)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    focusedField = index
                }
            }
    }
}

#Preview {
    CodeVerificationView(phoneNumber: "+7 999 999-99-99")
}
