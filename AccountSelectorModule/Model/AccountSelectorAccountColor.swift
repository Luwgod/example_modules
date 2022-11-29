#if DEBUG_MENU

import UbrdDesignSystem

/// Represents AccountSelector possible colors
enum AccountSelectorAccountColor: String, CaseIterable {
    /// Represents `credit` gradient
    case credit = "Credit"

    /// Represents `deposit` gradient
    case deposit = "Deposit"

    /// Represents `account` gradient
    case account = "Account"

    /// Generates `AccountSelector.CardColor` from self
    /// - Returns: `AccountSelector.CardColor` from UbrdDesignSystem represented by self
    func asAccountColor() -> AccountSelector.CardColor {
        switch self {
        case .credit:
            return .credit

        case .deposit:
            return .deposit

        case .account:
            return .account
        }
    }
}

extension AccountSelectorAccountColor: ListPickerPresentableItem {
    func asDebugMenuCellModel(isSelected: Bool) -> DebugMenuCellModel {
        .title(model: .init(title: self.rawValue, isSelected: isSelected))
    }

    var uniqueID: String {
        rawValue
    }
}

#endif
