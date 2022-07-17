# takes port of node and suffix of category name

if [ "$#" -ne 2 ]; then
    echo "Usage: <port> <category_name_suffix>"
    exit 1
fi

COMMAND="begin; insert into category (name) values ('sample_category_$2'); commit;"

psql -U mtmuser -h localhost -a -d dvdrental -p $1 -c "$COMMAND"
