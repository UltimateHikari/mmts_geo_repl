SQL='./resources/bootstrap.sql'

for i in 5411 5412 5413 5421 5422 5423
do
    psql -U andy -p $i -h localhost -d postgres -a -f $SQL
    pg_restore -U andy -h localhost -p $i -d dvdrental ./dvdrental.tar
done
