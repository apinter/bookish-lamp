#!/bin/bash

st0=stats.sqlite
st1=stats.dump.sqlite
st3=stats.fixed.sqlite

##Looking for the stats.sqlite integrity,
##if malformed fixing it and leaving a log entry.

sqlite3 $st0 "pragma integrity_check" | grep 'Error: database disk image is malformed
' &> /dev/null
if [ $? == 0 ]; then
        echo "ok"
else sqlite3 $st0 ".mode insert" ".output $st1" ".dump"
        sqlite3 $st3 ".read $st1" && cp $st3 $st0 && rm $st1 $st3 && echo "`date` Encountered a malformed db and tried to fix it."
fi

