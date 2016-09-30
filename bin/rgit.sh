COMMAND=$1

FILE_LIB="NULL"
RAW_CMD="NULL"
AWK_VAR_CMD=""

case $COMMAND in
 "df" | "diffirst")
	FILE_LIB="/Users/Rafael/dev/tools/rgit/commands/cmd_first_staged_line.awk"
	AWK_VAR_CMD="git diff -b"
	;;
 "af" | "addfirst")
	FILE_LIB="/Users/Rafael/dev/tools/rgit/commands/cmd_first_staged_line.awk"
	AWK_VAR_CMD="git add"
	;;
 "cf" | "checkoutfirst")
	FILE_LIB="/Users/Rafael/dev/tools/rgit/commands/cmd_first_staged_line.awk"
	AWK_VAR_CMD="git checkout"
	;;
 "s" | "status")
	RAW_CMD="git status"
	;;
 "s-p" | "status-porcelain")
	RAW_CMD="git status --porcelain"
	;;
 "cm" | "commit")
	MESSAGE="$2"
	RAW_CMD="git commit -m  "\"$MESSAGE\"
	;;
 "l" | "log")
	RAW_CMD="git log --graph --decorate"
	;;
 "h" | "--help")
	echo ""
	echo "(R)afael (GI)rolineto (T)ool"
	echo ""
	echo "Commands avaliable:"
	echo "  df  | diffirst         Runs a git diff with the first modified file of the status"
	echo "  af  | addfirst         Adds file first file to the stagged files"
	echo "  cf  | checkoutfirst    Returns the first file to the last commited status"
	echo "  s   | status           Shows the current git local status"
	echo "  s-p | status-porcelain Same than status, but with option --porcelain"
	echo "  cm  | commit           Commits local changes - Requires the commit message"
	echo "  l   | log              Shows the git log with graph and decorate commands"
	echo "  h   | --help           Shows this message"
	echo ""
	;;
esac


if [ "$FILE_LIB" != "NULL" ];
  then
	git status --porcelain | awk -v cmd="$AWK_VAR_CMD" -f $FILE_LIB
fi

if [ "$RAW_CMD" != "NULL" ];
  then
  	echo $RAW_CMD
  	echo
  	eval $RAW_CMD
fi

exit 0;

case $COMMAND in
 "s" | "status")
	git status
	exit 0
	;;
esac

