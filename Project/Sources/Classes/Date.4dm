
Class constructor($date : Variant)
	Case of 
		: (Count parameters:C259=0)
			This:C1470.date:=Current date:C33
		: (Value type:C1509($date)=Is date:K8:7)
			This:C1470.date:=$date
		: (Value type:C1509($date)=Is text:K8:3)
			This:C1470.date:=Date:C102($date)
		Else 
			ASSERT:C1129(False:C215; "$date must be of type `Date` or `Text`")
	End case 
	
	// MARK: - getters
	
Function get year->$year : Integer
	$year:=Year of:C25(This:C1470.date)
	
Function get month->$month : Integer
	$month:=Month of:C24(This:C1470.date)
	
Function get day->$day : Integer
	$day:=Day of:C23(This:C1470.date)
	
Function get dayNumber->$dayNumber : Integer
	$dayNumber:=Day number:C114(This:C1470.date)
	
	// MARK: - setters
	
Function set year($year : Integer)
	This:C1470.addYears($year-This:C1470.year)
	
Function set month($month : Integer)
	This:C1470.addMonths($month-This:C1470.month)
	
Function set day($day : Integer)
	This:C1470.addDays($day-This:C1470.day)
	
	
	// MARK: - add
	
Function addYears($number : Integer)
	This:C1470.date:=Add to date:C393(This:C1470.date; $number; 0; 0)
	
Function addMonths($number : Integer)
	This:C1470.date:=Add to date:C393(This:C1470.date; 0; $number; 0)
	
Function addDays($number : Integer)
	This:C1470.date:=Add to date:C393(This:C1470.date; 0; 0; $number)
	
	