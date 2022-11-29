#if DEBUG_MENU

protocol AccountSelectorDemoBuilderDataSource {
    var itemModels: [TitledTextFieldCellModel] { get }
    var cardColorModel: TitleValueCellModel { get }
    var accountSelectorModel: AccountSelectorDemoCellModel { get }
}

#endif
