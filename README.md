# SimpleCalendar
SwiftUI simple calendar view for displaying specified month's days. Supports **iOS v14**.

<p align="center">
<img width="361" alt="SimpleCalendar samples" src="https://github.com/leekurg/SimpleCalendar/assets/105886145/49076dcb-6a80-41fb-a8a9-1bfc30103b0f">
</p>

### Overview
Simple, easy-to-use or change calendar view. Feel free to take and change on your behalf.

### Details
Repository includes a package **SimpleCalendar** for install and project **SimpleCalendarExample** with example of usage.

### Features
1. Ease-to-use API: give to **SimpleCalendar** month and year numbers, or just a `Date`
2. Use your own calendar configuration, or use default configuration `.localizedCurrent`, which is `Calendar` instance, localized with app's preferred language
4. Configure font size
5. Choose built-in styles of calendar's header - localized short, full or completely off day titles
6. Configure header padding or cell spacing
7. Use built-in modifier `.calendarTintColor()` to change **SimpleCalendar** tint color appearence

### Install
`SPM` installation: in **Xcode** tap «**File → Add packages…**», paste is search field the URL of this page and press «**Add package**».

### Usage
Annotate `SwiftUI` file with «**import SimpleCalendar**». Then pass to **SimpleCalendarView** month and year `Int`'s or just a `Date`:

```
SimpleCalendarView(
  month: 9,
  year: 2023,
  calendar: .localizedCurrent,
  fontSize: 18,
  verticalCellPadding: 10,
  weekdayHeaderPadding: 15,
  weekdaySymbolFormat: .short
)
.padding(15)
.calendarTintColor(.orange)
```
