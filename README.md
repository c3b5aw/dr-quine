# dr-quine

**Final mark**: ...

|Language|State|
|:---:|:---:|
|**Colleen**|
|**C**|✅|
|**Go**|✅|
|**ASM**|❌|
|**Grace**|
|**C**|❌|
|**Go**|❌|
|**ASM**|❌|
|**Sully**|
|**C**|❌|
|**Go**|❌|
|**ASM**|❌|


## colleen

### C
```
	printf specifications:

	%2$c -> print second argument as a character
	%position$type

	why:
		%s does not escape \t / \n which indents
				const char *source_code
		twice.
```

### Go
```
	(fmt.)Printf is a bit different from C

	%[2]c
	%[argument_index]format
```