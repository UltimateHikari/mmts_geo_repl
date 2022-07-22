
if [ "$#" -ne 2 ]; then
    echo "Usage: <port> <tt_table_id>"
    exit 1
fi

COMMAND="begin; insert into tt_table (id) values ($2); commit;"

psql -U mtmuser -h localhost -a -d dvdrental -p $1 -c "$COMMAND"
