//%attributes = {}
var $date : cs:C1710.Date
$date:=cs:C1710.Date.new()

// MARK:- year
$currentYear:=Year of:C25(Current date:C33)
ASSERT:C1129($date.year=$currentYear)  // this test do not work at midnight when year change!

$inc:=2
$date.addYears($inc)
ASSERT:C1129($date.year=($currentYear+$inc))

$date.year:=$currentYear
ASSERT:C1129($date.year=$currentYear)

// MARK:- month
$currentMonth:=Month of:C24(Current date:C33)
ASSERT:C1129($date.month=$currentMonth)

$inc:=Choose:C955(($currentMonth<6); 2; -2)

$date.addMonths($inc)
ASSERT:C1129($date.month=($currentMonth+$inc))

$date.month:=$currentMonth
ASSERT:C1129($date.month=$currentMonth)

// MARK:- day
$currentDay:=Day of:C23(Current date:C33)
ASSERT:C1129($date.day=$currentDay)

$inc:=Choose:C955(($currentDay<15); 2; -2)

$date.addDays($inc)
ASSERT:C1129($date.day=($currentDay+$inc))

$date.day:=$currentDay
ASSERT:C1129($date.day=$currentDay)
