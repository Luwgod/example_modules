#if DEBUG_MENU

import UbrdDesignSystem
import TableKit
import LeadKit

final class AccountSelectorDemoCell: BaseRxTableViewCell {

    private var accountSelector = AccountSelector()

    override func addViews() {
        super.addViews()

        contentView.addSubview(accountSelector)
    }

    override func configureLayout() {
        accountSelector.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension AccountSelectorDemoCell: ConfigurableCell {
    func configure(with model: AccountSelectorDemoCellModel) {
        accountSelector.configure(with: model.accountSelectorModel)
    }
}

#endif
