COMMAND=$1

FILE_LIB="NULL"
RAW_CMD="NULL"
AWK_VAR_CMD=""

case $COMMAND in
 "df" | "diffirst")
	FILE_LIB="/Users/Rafael/dev/tools/rgit/commands/command_to_first_line.awk"
	AWK_VAR_CMD="git diff -b"
	;;
 "af" | "addfirst")
	FILE_LIB="/Users/Rafael/dev/tools/rgit/commands/command_to_first_line.awk"
	AWK_VAR_CMD="git add"
	;;
 "cf" | "checkoutfirst")
	FILE_LIB="/Users/Rafael/dev/tools/rgit/commands/command_to_first_line.awk"
	AWK_VAR_CMD="git checkout"
	;;
 "s" | "status")
	RAW_CMD="git status --porcelain"
	;;
esac


if [ "$FILE_LIB" != "NULL" ];
	then
	git status --porcelain | awk -v cmd="$AWK_VAR_CMD" -f $FILE_LIB
fi


case $COMMAND in
 "s" | "status")
	git status
	exit 0;
	;;
esac

