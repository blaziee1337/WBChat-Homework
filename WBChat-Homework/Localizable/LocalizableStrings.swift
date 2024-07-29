//
//  LocalizableStrings.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 18.07.2024.
//

import Foundation

struct LocalizedStrings {
    static var communicateWithFriends: String { NSLocalizedString("communicate_with_friends", comment: "")}
    static var pressingContinueButton: String { NSLocalizedString("pressing_button_continue", comment: "")}
    static var privacyPolicy: String { NSLocalizedString("privacy_policy", comment: "")}
    static var startChatting: String { NSLocalizedString("start_chatting", comment: "")}
    
    static var enterphoneNumber: String { NSLocalizedString("enter_phone_number", comment: "")}
    static var conformationCodeMessage: String { NSLocalizedString("confirmation_code_message", comment: "")}
    static var continueButton: String { NSLocalizedString("continue", comment: "")}
    
    static var enterCode: String { NSLocalizedString("enter_code", comment: "") }
    static var sentCodeToNumber: String { NSLocalizedString("confirmation_code_message", comment: "") }
    static var yourCode: String { NSLocalizedString("your_code", comment: "") }
    static var incorrectCodeTryAgain: String { NSLocalizedString("incorrect_code_try_again", comment: "") }
    static var requestCodeAgain: String { NSLocalizedString("request_code_again", comment: "") }
}
