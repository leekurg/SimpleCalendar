# SimpleCalendar
SwiftUI simple calendar view for displaying specified month's days. Supports **iOS v14**.

<p align="center">
<img width="361" alt="SimpleCalendar samples" src="https://github.com/leekurg/SimpleCalendar/assets/105886145/e08ec461-435f-434d-89e0-5d8fc1d74ad9">
</p>



### Overview
Simple, easy-to-use or change calendar view. Feel free to take and change on your behalf.

### Details
Repository includes a package **SimpleCalendar** for install and project **SimpleCalendarExample** with example of usage.

### Features
1. Ease-to-use API: give to **SimpleCalendar** month and year numbers, or just a `Date`
2. Configure font size
3. Choose built-in styles of calendar's header - localized short, full or completely off day titles
4. Configure header padding or cell spacing
5. Use built-in modifier `.calendarTintColor()` to change **SimpleCalendar** tint color appearence

### Install
`SPM` installation: in **Xcode** tap «**File → Add packages…**», paste is search field the URL of this page and press «**Add package**».

### Usage
Annotate `SwiftUI` file with «**import SimpleCalendar**». Then pass to **SimpleCalendarView** desired parameters.

```
SimpleCalendarView(
  month: 9,
  year: 2023,
  fontSize: 18,
  verticalCellPadding: 10,
  weekdayHeaderPadding: 15,
  weekdaySymbolFormat: .short
)
.padding(15)
.calendarTintColor(.orange)
```
