# expects start or stop as $1

PG_CTL=/usr/local/pgsql/bin/pg_ctl

mkdir -p logs

$PG_CTL -D ./dc1/node11 -o "-p 5411" -l ./logs/node11 $1
$PG_CTL -D ./dc1/node12 -o "-p 5412" -l ./logs/node12 $1
$PG_CTL -D ./dc1/node13 -o "-p 5413" -l ./logs/node13 $1
$PG_CTL -D ./dc2/node21 -o "-p 5421" -l ./logs/node21 $1
$PG_CTL -D ./dc2/node22 -o "-p 5422" -l ./logs/node22 $1
$PG_CTL -D ./dc2/node23 -o "-p 5423" -l ./logs/node23 $1
