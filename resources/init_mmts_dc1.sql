CREATE EXTENSION multimaster;
SELECT mtm.init_cluster('dbname=dvdrental user=mtmuser host=localhost port=5411', '{"dbname=dvdrental user=mtmuser   host=localhost port=5412", "dbname=dvdrental user=mtmuser host=localhost port=5413"}');
