#if DEBUG_MENU

protocol AccountSelectorModule: BaseModule {
    var onSelectAccountColor: ParameterClosure<SelectionItemData<AccountSelectorAccountColor>>? { get set }
}

#endif
