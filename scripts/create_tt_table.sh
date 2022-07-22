# create table w/out autoincr
if [ "$#" -ne 1 ]; then
    echo "Usage: <port>"
    exit 1
fi

COMMAND="create table tt_table(id integer primary key);"

psql -U mtmuser -h localhost -a -d dvdrental -p $1 -c "$COMMAND"
