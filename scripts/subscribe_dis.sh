# takes port of node and suffix of category name

if [ "$#" -ne 2 ]; then
    echo "Usage: <publisher port> <subscriber port>"
    exit 1
fi

PCREATEP="CREATE PUBLICATION testpub;"
PCREATES="SELECT pg_create_logical_replication_slot('testpubslot', 'pgoutput');"
PALTERP="ALTER PUBLICATION testpub ADD TABLE category;"
SCREATES="CREATE subscription testsub CONNECTION 'dbname=dvdrental host=localhost port=5411 user=mtmuser' PuBLICATION testpub with(create_slot=false, slot_name=testpubslot, copy_data=false, enabled=false);"

psql -U mtmuser -h localhost -a -d dvdrental -p $1 -c "$PCREATEP"
psql -U mtmuser -h localhost -a -d dvdrental -p $1 -c "$PCREATES"
psql -U mtmuser -h localhost -a -d dvdrental -p $1 -c "$PALTERP"
psql -U mtmuser -h localhost -a -d dvdrental -p $2 -c "$SCREATES"
