# mmts bootstrap sequence

6 clusters in 2 "datacenters" on one machine, using same binaries.  
`pg_hba.conf` left as default, security is not a concern in this test case and it's premissive to `all`.

## Compile:
* clone postrespro/postgres_cluster
* checkout rel13_mm_2
* cd postgres_cluster && .configure
* make
* cd contrib && clone mmts 
* checkout 524f9151d39f478adf5039190f851f655674f950 as looking as stable version
* make install
* cd ../../ && make install

## Run
* `./scripts/bootstrap.sh`
* `./scripts/poke_all.sh start`
* `./scripts/create_db.sh`
* `./scripts/init_mmts.sh`

* or just `./full_bootstrap.sh`

## Stop & cleanup
* `./poke_all.sh stop` 
* delete dc\* and logs dirs

## Attach 
* connect with

    $ psql -U andy -h localhost -a -d postgres -p 5411
    $ psql -U mtmuser -h localhost -a -d dvdrental -p 5411

or run batch selects with p.e.
    $ ./scripts/run_on_all.sh "select * from mtm.status();"

## Give load

*yes i know about sql injections, please leave*
use `scripts/update_cat.sh <port> <category_name_suffix>` 

## Configure replication
* ./scripts/subscribe.sh <publisher port> <subscriber port>
