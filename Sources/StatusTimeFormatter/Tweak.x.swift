import Orion
import StatusTimeFormatterC

class StatusBarTimeHook: ClassHook<_UIStatusBarStringView> {
    func setText(_ text: String) {
        if text.contains(":") {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            orig.setText(formatter.string(from: Date()))
        } else {
            orig.setText(text)
        }
    }
}