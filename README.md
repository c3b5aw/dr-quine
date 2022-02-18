# dr-quine

**Final mark**: ...

|Language|State|
|:---:|:---:|
|**Colleen**|
|**C**|✅|
|**Go**|✅|
|**ASM**|✅|
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

### ASM

![Arguments](https://raw.githubusercontent.com/c3b5aw/dr-quine/main/docs/images/j8hnpC.png)
```
	Arguments like in C.
```