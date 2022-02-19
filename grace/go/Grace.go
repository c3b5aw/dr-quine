package main

import (
	"bufio"
	"fmt"
	"os"
)

/*
	Comment
*/

func main() {
	s := "package main%[2]c%[2]cimport (%[2]c%[3]c%[4]cbufio%[4]c%[2]c%[3]c%[4]cfmt%[4]c%[2]c%[3]c%[4]cos%[4]c%[2]c)%[2]c%[2]c/*%[2]c%[3]cComment%[2]c*/%[2]c%[2]cfunc main() {%[2]c%[3]cs := %[4]c%[1]s%[4]c%[2]c%[2]c%[3]cfptr, err := os.OpenFile(%[4]cGrace_kid.go%[4]c, os.O_RDWR|os.O_CREATE|os.O_TRUNC, 0755)%[2]c%[3]cif err != nil {%[2]c%[3]c%[3]cos.Exit(1)%[2]c%[3]c}%[2]c%[2]c%[3]cw := bufio.NewWriter(fptr)%[2]c%[3]cfmt.Fprintf(w, s, s, 10, 9, 34)%[2]c%[3]cw.Flush()%[2]c%[2]c%[3]cif err := fptr.Close(); err != nil {%[2]c%[3]c%[3]cos.Exit(1)%[2]c%[3]c}%[2]c}%[2]c"

	fptr, err := os.OpenFile("Grace_kid.go", os.O_RDWR|os.O_CREATE|os.O_TRUNC, 0755)
	if err != nil {
		os.Exit(1)
	}

	w := bufio.NewWriter(fptr)
	fmt.Fprintf(w, s, s, 10, 9, 34)
	w.Flush()

	if err := fptr.Close(); err != nil {
		os.Exit(1)
	}
}
