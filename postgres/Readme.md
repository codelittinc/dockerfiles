# Postgres Dockerfile

This dockerfile starts a Postgres service in a container and exposes the
Postgres port for container linking.

Note: For development only. Uses default postgres username & sets
password to postgres.

## Pre-setup

1. Add the database names to create in the databases.txt file, on a separate line.
2. This relies on a data container. You should run the container with
   a -volumes-from command linking to a container that exposes
   `/var/lib/pgsql/data`
