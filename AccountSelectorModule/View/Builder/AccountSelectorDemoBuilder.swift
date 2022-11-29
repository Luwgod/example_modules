#if DEBUG_MENU

import TableKit

final class AccountSelectorDemoBuilder {

    typealias DataSource = AccountSelectorDemoBuilderDataSource

    func buildSections(with dataSource: DataSource, delegate: AccountSelectorDemoInput?) -> [TableSection] {
        [
            buildAccountSelectorSection(with: dataSource),
            buildAccountSelectorItemsSection(with: dataSource, delegate: delegate)
        ]
    }

    func buildAccountSelectorSection(with dataSource: DataSource) -> TableSection {
        let section = TableSection(headerTitle: "Account Selector View", footerTitle: nil, rows: [])

        let row = TableRow<AccountSelectorDemoCell>(item: dataSource.accountSelectorModel)
        section.append(row: row)

        return section
    }

    func buildAccountSelectorItemsSection(with dataSource: DataSource, delegate: AccountSelectorDemoInput?) -> TableSection {
        let section = TableSection(headerTitle: "Account Selector Items", footerTitle: nil, rows: [])

        dataSource.itemModels.forEach { itemModel in
            let row = TableRow<TitledTextFieldCell>(item: itemModel)
            section.append(row: row)
        }

        let colorRow = TableRow<TitleValueDebugMenuCell>(item: dataSource.cardColorModel)
            .on(.click) { [delegate] _ in
                delegate?.selectAccountColor()
            }
        section.append(row: colorRow)

        return section
    }
}

#endif
