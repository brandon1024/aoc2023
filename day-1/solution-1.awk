#!/usr/bin/awk -f

BEGIN {
	FS = ""
	total = 0
}

{
	gsub("[^0-9]", "")
	gsub("^[0-9]$", "&&")
	gsub("^$", "0")
	total += $1 $NF
}

END {
	print total
}
