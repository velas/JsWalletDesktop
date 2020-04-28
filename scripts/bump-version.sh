TARGET="./package.json"
if [ ! -f "$TARGET" ]; then
   echo "missing file $TARGET"
   exit 1;
fi

LINE=$(grep -o ${TARGET} -e '\"version\": \"[0-9\.]*\"');
declare -a LINE;


LINE=(`echo $LINE | tr ":" " "`);

VERSION=(${LINE[1]});
JSSCRIPT="console.log($VERSION.split('.').map((v,i)=>i===2?(v|0)+1:v).join('.'))"
JSSCRIPT=${JSSCRIPT//"'"/$'"'}
INCREMENTED=`echo $JSSCRIPT | node`
# echo $INCREMENTED
sed "s/\"version\": \"[0-9\.]*\"/\"version\": \"${INCREMENTED}\"/" $TARGET > $TARGET.tmp && mv $TARGET.tmp $TARGET
git tag -a ${INCREMENTED} -m "Autocreated tag from version ${INCREMENTED}"
