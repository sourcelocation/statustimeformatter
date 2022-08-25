import Orion
import StatusTimeFormatterC

class StatusBarTimeHook: ClassHook<_UIStatusBarStringView> {
    // orion:new
    func isDateLabel(_ text: String) -> Bool {
        return text.contains(":")
    }

    func setText(_ text: String) {
        if isDateLabel(text) {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            orig.setText(formatter.string(from: Date()))
        } else {
            orig.setText(text)
        }
    }

    func setTextColor(_ color: UIColor) {
        if isDateLabel(target.text ?? "") {
            orig.setTextColor(.yellow)
        } else {
            orig.setTextColor(color)
        }
    }
}