#!/bin/bash
echo "host all all 0.0.0.0/0 md5" >> "$PGDATA/pg_hba.conf"
set -e
cat >> ${PGDATA}/postgresql.conf <<EOF
wal_level = logical
EOF
