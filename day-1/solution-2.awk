#!/usr/bin/awk -f

BEGIN {
	FS = ""
	total = 0
}

{
	s = ""
	for (i = 1; i <= NF; i++) {
		ss = substr($0, i)

		if (match(ss, "^[0-9]")) { s = s substr(ss, 0, 1) }
		else if (match(ss, "^one")) { s = s "1" }
		else if (match(ss, "^two")) { s = s "2" }
		else if (match(ss, "^three")) { s = s "3" }
		else if (match(ss, "^four")) { s = s "4" }
		else if (match(ss, "^five")) { s = s "5" }
		else if (match(ss, "^six")) { s = s "6" }
		else if (match(ss, "^seven")) { s = s "7" }
		else if (match(ss, "^eight")) { s = s "8" }
		else if (match(ss, "^nine")) { s = s "9" }
		else if (match(ss, "^zero")) { s = s "0" }
	}

	$0 = s
	gsub("[^0-9]", "")
	gsub("^[0-9]$", "&&")
	gsub("^$", "0")
	total += $1 $NF
}

END {
	print total
}
