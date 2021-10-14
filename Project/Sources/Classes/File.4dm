Class constructor($fileOrFolder : Variant)
	
	Case of 
		: (Value type:C1509($fileOrFolder)=Is object:K8:27)
			If (OB Instance of:C1731($fileOrFolder; 4D:C1709.File) | OB Instance of:C1731($fileOrFolder; 4D:C1709.Folder))
				This:C1470.file:=$fileOrFolder
			Else 
				ASSERT:C1129(False:C215; "$fileOrFolder must be of type `4D.File` or `4D.Folder`")
			End if 
		: (Value type:C1509($fileOrFolder)=Is text:K8:3)
			If (Path to object:C1547($fileOrFolder; Path is POSIX:K24:26).isFolder)
				This:C1470.file:=Folder:C1567($fileOrFolder)
			Else 
				This:C1470.file:=File:C1566($fileOrFolder)
			End if 
		Else 
			ASSERT:C1129(False:C215; "$fileOrFolder must be of type `Object` or `Text`")
	End case 
	
	// MARK: - getters
	
Function get isFolder->$is : Boolean
	$is:=This:C1470.file.isFolder
	
Function get isFile->$is : Boolean
	$is:=This:C1470.file.isFile
	
Function get isAlias->$is : Boolean
	$is:=This:C1470.file.isAlias
	
Function get exists->$is : Boolean
	$is:=This:C1470.file.exists
	
Function get isHidden->$is : Boolean
	$is:=This:C1470.file.hidden
	
Function get isPackage->$is : Boolean
	If (This:C1470.isFolder)
		$is:=This:C1470.file.isPackage
	Else 
		$is:=False:C215
	End if 
	
Function get name->$name : Text
	$name:=This:C1470.file.name
	
Function get fullName->$fullName : Text
	$fullName:=This:C1470.file.fullName
	
Function get extension->$extension : Text
	$extension:=This:C1470.file.extension
	
Function get path->$path : Text
	$path:=This:C1470.file.path
	
Function get platformPath->$path : Text
	$path:=This:C1470.file.platformPath
	
Function get creationTime->$time : Time
	$time:=This:C1470.file.creationTime
	
Function get creationDate->$date : Date
	$date:=This:C1470.file.creationDate
	
Function get parent->$parent : cs:C1710.File
	If (This:C1470.file.parent=Null:C1517)
		$parent:=Null:C1517
	Else 
		$parent:=cs:C1710.File.new(This:C1470.file.parent)
	End if 
	
	
	// MARK: - setters
	
Function set fullName($fullName : Text)
	This:C1470.file:=This:C1470.file.rename($fullName)
	
Function set extension($extension : Text)
	If (Position:C15("."; $extension)=1)
		This:C1470.file:=This:C1470.file.rename(This:C1470.name+$extension)
	Else 
		This:C1470.file:=This:C1470.file.rename(This:C1470.name+"."+$extension)
	End if 
	
Function set name($name : Text)
	This:C1470.file:=This:C1470.file.rename($name+This:C1470.extension)
	
Function set parent($parent : Object)
	Case of 
		: (OB Instance of:C1731($parent; 4D:C1709.Folder))
			This:C1470.file:=This:C1470.file.moveTo($parent)
		: (OB Instance of:C1731($parent; cs:C1710.File))
			If ($parent.isFolder)
				This:C1470.file:=This:C1470.file.moveTo($parent.file)
			End if 
	End case 
	
	// MARK: - functions
	
Function create()
	This:C1470.file.create()
	
Function delete()
	This:C1470.file.delete()
	
Function getIcon()->$icon : Picture
	$icon:=This:C1470.file.getIcon()
	
	// TODO: create others functions
	