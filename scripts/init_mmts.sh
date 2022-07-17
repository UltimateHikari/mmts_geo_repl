SQL1='./resources/init_mmts_dc1.sql'
SQL2='./resources/init_mmts_dc2.sql'
MASTERPORT1=5411
MASTERPORT2=5421

psql -U mtmuser -p $MASTERPORT1 -h localhost -d dvdrental -a -f $SQL1
psql -U mtmuser -p $MASTERPORT2 -h localhost -d dvdrental -a -f $SQL2

echo "mmts clusters started, use mtm.status() to check"
