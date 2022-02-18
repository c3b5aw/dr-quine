package main

import "fmt"

/*
	Second comment out of main()
*/

func colleen() {
	s := "package main%[2]c%[2]cimport %[4]cfmt%[4]c%[2]c%[2]c/*%[2]c%[3]cSecond comment out of main()%[2]c*/%[2]c%[2]cfunc colleen() {%[2]c%[3]cs := %[4]c%[1]s%[4]c%[2]c%[3]cfmt.Printf(s, s, 10, 9, 34)%[2]c}%[2]c%[2]cfunc main() {%[2]c%[3]c/*%[2]c%[3]c%[3]cFirst comment in main()%[2]c%[3]c*/%[2]c%[2]c%[3]ccolleen()%[2]c}%[2]c"
	fmt.Printf(s, s, 10, 9, 34)
}

func main() {
	/*
		First comment in main()
	*/

	colleen()
}
