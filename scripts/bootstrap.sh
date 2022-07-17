#!/bin/bash
INITDB=/usr/local/pgsql/bin/initdb
CONF=./resources/postgresql.conf
RECV=./resources/postgresql-recv.conf

mkdir -p dc1
cd dc1
mkdir -p node11
mkdir -p node12
mkdir -p node13

cd ..

mkdir -p dc2
cd dc2
mkdir -p node21
mkdir -p node22
mkdir -p node23

cd ..

$INITDB -D ./dc1/node11 
$INITDB -D ./dc1/node12 
$INITDB -D ./dc1/node13 

$INITDB -D ./dc2/node21 
$INITDB -D ./dc2/node22 
$INITDB -D ./dc2/node23 

cp $CONF ./dc1/node11/
cp $CONF ./dc1/node12/
cp $CONF ./dc1/node13/
#cp $CONF ./dc2/node21/
cp $RECV ./dc2/node21/postgresql.conf
cp $CONF ./dc2/node22/
cp $CONF ./dc2/node23/
