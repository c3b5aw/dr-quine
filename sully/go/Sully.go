package main

import (
	"bufio"
	"fmt"
	"os"
	"os/exec"
	"strconv"
)

func main() {
	i := 5

	if _, err := os.Stat("Sully_5.go"); err == nil {
		i -= 1
	}

	if i >= 0 {
		file_name := "Sully_" + strconv.Itoa(i)
		file_path := file_name + ".go"

		fptr, err := os.OpenFile(file_path, os.O_RDWR|os.O_CREATE|os.O_TRUNC, 0755)
		if err != nil {
			os.Exit(1)
		}

		s := "package main%[3]c%[3]cimport (%[3]c%[4]c%[5]cbufio%[5]c%[3]c%[4]c%[5]cfmt%[5]c%[3]c%[4]c%[5]cos%[5]c%[3]c%[4]c%[5]cos/exec%[5]c%[3]c%[4]c%[5]cstrconv%[5]c%[3]c)%[3]c%[3]cfunc main() {%[3]c%[4]ci := %[2]d%[3]c%[3]c%[4]cif _, err := os.Stat(%[5]cSully_5.go%[5]c); err == nil {%[3]c%[4]c%[4]ci -= 1%[3]c%[4]c}%[3]c%[3]c%[4]cif i >= 0 {%[3]c%[4]c%[4]cfile_name := %[5]cSully_%[5]c + strconv.Itoa(i)%[3]c%[4]c%[4]cfile_path := file_name + %[5]c.go%[5]c%[3]c%[3]c%[4]c%[4]cfptr, err := os.OpenFile(file_path, os.O_RDWR|os.O_CREATE|os.O_TRUNC, 0755)%[3]c%[4]c%[4]cif err != nil {%[3]c%[4]c%[4]c%[4]cos.Exit(1)%[3]c%[4]c%[4]c}%[3]c%[3]c%[4]c%[4]cs := %[5]c%[1]s%[5]c%[3]c%[4]c%[4]cw := bufio.NewWriter(fptr)%[3]c%[4]c%[4]cfmt.Fprintf(w, s, s, i, 10, 9, 34)%[3]c%[4]c%[4]cw.Flush()%[3]c%[3]c%[4]c%[4]cif err := fptr.Close(); err != nil {%[3]c%[4]c%[4]c%[4]cos.Exit(1)%[3]c%[4]c%[4]c}%[3]c%[3]c%[4]c%[4]ccompile_cmd := exec.Command(%[5]c/bin/sh%[5]c, %[5]c-c%[5]c, %[5]cgo build -o %[5]c+file_name+%[5]c %[5]c+file_path)%[3]c%[4]c%[4]ccompile_cmd.Start()%[3]c%[4]c%[4]ccompile_cmd.Wait()%[3]c%[3]c%[4]c%[4]cif i > 0 {%[3]c%[4]c%[4]c%[4]cexec_cmd := exec.Command(%[5]c./%[5]c + file_name)%[3]c%[4]c%[4]c%[4]cexec_cmd.Start()%[3]c%[4]c%[4]c%[4]cexec_cmd.Wait()%[3]c%[4]c%[4]c}%[3]c%[4]c}%[3]c}%[3]c"
		w := bufio.NewWriter(fptr)
		fmt.Fprintf(w, s, s, i, 10, 9, 34)
		w.Flush()

		if err := fptr.Close(); err != nil {
			os.Exit(1)
		}

		compile_cmd := exec.Command("/bin/sh", "-c", "go build -o "+file_name+" "+file_path)
		compile_cmd.Start()
		compile_cmd.Wait()

		if i > 0 {
			exec_cmd := exec.Command("./" + file_name)
			exec_cmd.Start()
			exec_cmd.Wait()
		}
	}
}
