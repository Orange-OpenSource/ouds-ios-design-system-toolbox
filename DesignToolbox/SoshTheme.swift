/// Dans SoshTheme.swift, remplacer l'extension Tuning par :
extension Tuning {

    /// The theme tuning for *Sosh* contains **square corners for buttons**,
    /// **square corners for text / PIN code / password / text area inputs** and **list items**;
    /// and **rounded corners for alert messages** and **progress indicators**.
    public static let Sosh = Tuning(hasRoundedButtons: false,
                                    hasRoundedTextInputs: false,
                                    hasRoundedAlertMessages: true,
                                    hasRoundedProgressIndicators: true,
                                    hasRoundedListItems: false,
                                    hasRoundedCard: false)
}
