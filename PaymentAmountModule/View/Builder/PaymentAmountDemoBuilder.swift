#if DEBUG_MENU

import TableKit

final class PaymentAmountDemoBuilder {

    typealias DataSource = PaymentAmountDemoBuilderDataSource

    func buildSections(with dataSource: DataSource) -> [TableSection] {
        [
            buildPaymentAmountSection(with: dataSource),
            buildPaymentAmountItemsSection(with: dataSource)
        ]
    }

    func buildPaymentAmountSection(with dataSource: DataSource) -> TableSection {
        let section = TableSection(headerTitle: "Payment Amount View", footerTitle: nil, rows: [])

        let row = TableRow<PaymentAmountDemoCell>(item: dataSource.paymentAmountModel)
        section.append(row: row)

        return section
    }

    func buildPaymentAmountItemsSection(with dataSource: DataSource) -> TableSection {
        let section = TableSection(headerTitle: "Payment Amount Items", footerTitle: nil, rows: [])

        dataSource.itemModels.forEach { itemModel in
            let row = TableRow<TitledTextFieldCell>(item: itemModel)
            section.append(row: row)
        }

        return section
    }
}

#endif
