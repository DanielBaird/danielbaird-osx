#
# Removes the BOM from a file
#

# $1 is the file to remove the BOM from
if [ "$#" -ne 1 ]; then
	echo "remove-bom.sh : remove the byte order mark from text files."
	echo "         Usage: remove-bom.sh <filename>"
	echo "         ..will remove the first three bytes, if they are exactly 0xEF 0xBB 0xBF"
	echo "         If the file is changed, a backup called <filename>.with-bom will be created."
else
	if [ -f "$1" ]; then
		if [ `xxd -l 3 -p "$1"` == 'efbbbf' ]; then
			cp "$1" "$1.with-bom"
			tail -c +4 "$1.with-bom" > "$1"
		else
			echo "File '$1' did not have a BOM."
		fi
	else
		echo "Could not open file '$1'."
	fi
fi
