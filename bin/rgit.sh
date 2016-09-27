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

