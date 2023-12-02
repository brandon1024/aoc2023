#!/usr/bin/awk -f

BEGIN {
	total = 0
	FS = ";"
}

{
	gid = $0
	sub(":.*", "", gid)
	sub("Game ", "", gid)

	sub("Game .+: ", "")

	gr = 0; gg = 0; gb = 0
	for (i = 1; i <= NF; i++) {
		r = 0; g = 0; b = 0

		split($i, cubes, ",")

		for (j = 1; j <= length(cubes); j++) {
			if (sub("red", "", cubes[j])) { r = cubes[j] }
			else if (sub("green", "", cubes[j])) { g = cubes[j] }
			else if (sub("blue", "", cubes[j])) { b = cubes[j] }
		}

		gsub("[^0-9]", "", r)
		gsub("[^0-9]", "", g)
		gsub("[^0-9]", "", b)

		r += 0; g += 0; b += 0

		if (r > gr) { gr = r }
		if (g > gg) { gg = g }
		if (b > gb) { gb = b }
	}

	total += gr * gg * gb
}

END {
	print total
}
