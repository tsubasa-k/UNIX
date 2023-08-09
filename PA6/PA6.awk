# Line 1
BEGIN {
    DE = "Database Entry: "
}

# Line 2
/^End of/ {
    next
}

# Line 3
/^Ship.*Dilithium$/ {
    $0 = DE "Dilithium"
}

# Line 4
/^Deep.*/ || /^Weapons.*/ {
	split($0,A,": ") ;DB[DE A[1] ":"] = A[2] "\n"
}

# Line 5
/Log.*113/ {
    gsub("Log.*113", "Log - Mission Day 113")
}

# Line 6
/, Supplemental/ {
    gsub(", Supplemental", " - Mission Day 113, Supplemental")
}

# Line 7
/^Database/||/^Captain's Log/ {
    K = $0 ":"
    DB[K] = ""
    getline
}

# Line 8
/^User/ {
    K = ""
}

# Line 9
K != "" {
    DB[K] = DB[K] "\n" $0
}

# Line 10
END {
    for (key in DB) {
	print key
        print DB[key]
        print "------------------------"
    }
}


