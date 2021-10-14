# Wrappers with some getters and setters  

Just to make code more object style, and have fun with [computed class properties](https://blog.4d.com/need-a-magic-wand-here-are-computed-class-properties/)

## cs.Date

```4d
$date:=cs.Date.new()

$value:=$date.year

$date.year:=2021
```

> [class documentation](Documentation/Classes/Date.md)

## cs.File

```4d
$file:=cs.File.new("/path/to/a/file/or/folder")

$name:=$file.fullName

$file.name:="hello"
$file.extension:="foo"

$file.parent:=Folder(...)
```
