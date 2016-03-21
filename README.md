# 2015 Lahman Baseball Database Docker

A docker container for the lahman database (postgres)

## Methods and Modifications

I followed the methods in this [blog post](http://www.olschimke.eu/2012/08/07/importing-microsoft-access-mdb-into-postgresql-on-linux-postgres/) to convert the [Microsoft Access](http://seanlahman.com/files/database/lahman-mdb_2016-03-02.zip) version of the database to postgres compatible SQL. Then I put the data in a postgres based Docker container.

Here is the exact process I followed. It assumes that the access database is located in the current directory with a filename of `lahman2015.mdb`

Generate schema:
```
mdb-schema lahman2015.mdb postgres > lahman-schema.sql
```

Export database:
```
for table in `mdb-tables lahman2015.mdb`; do mdb-export -I postgres -q\' lahman2015.mdb $table > lahman-$table-data.sql; done
```

The tools mentioned above worked great, but there were some problems with the indices. For example, the export tool autocreated some indices that were directly contradicted by the data itself.

I made the following modifications to the exported SQL:

- Removed indices that were contradicted by the data
- Added some indices that are relevant to the project I'm working on.
- Lower cased table names and added underscores to name/field names to make them play nice with `psql`.

The data remain untouched.

## Licence

This database is copyright 1996-2015 by Sean Lahman.

This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License. For details see: http://creativecommons.org/licenses/by-sa/3.0/

For licensing information or further information, contact Sean Lahman
at: seanlahman@gmail.com
