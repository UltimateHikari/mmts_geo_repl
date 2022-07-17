CREATE EXTENSION multimaster;
SELECT mtm.init_cluster('dbname=dvdrental user=mtmuser host=localhost port=5421', '{"dbname=dvdrental user=mtmuser   host=localhost port=5422", "dbname=dvdrental user=mtmuser host=localhost port=5423"}');
