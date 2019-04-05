#!/bin/bash
echo "host all all 0.0.0.0/0 md5" >> "$PGDATA/pg_hba.conf"
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname postgres <<-EOSQL
CREATE ROLE $PG_REP_USER WITH REPLICATION LOGIN PASSWORD '$PG_REP_PASSWORD';
EOSQL
cat >> ${PGDATA}/postgresql.conf <<EOF
wal_level = logical
EOF
