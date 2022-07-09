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
* delete dc\* and logs dirs
* ./scripts/bootstrap.sh
* ./scripts/start_all.sh start
* ./scripts/create_db.sh
...
* ./start_all.sh stop 

## Attach 
* connect with

    psql -U andy -p 5411 -h localhost -a -d postgres

* apply stuff from `./notes/scripts.cheat` - create + either of two selects
* observe logs failing to find `"mtm scheme"`
