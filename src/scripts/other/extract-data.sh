# Description: Extract data from the database

# Extract data from tables
pg_dump -U developer -d smart_shell -t smart_shell.TBL_DOCUMENT_HEADER --inserts --data-only --column-inserts > data_inserts.sql
pg_dump -U developer -d smart_shell -t smart_shell.TBL_DOCUMENT_DETAIL --inserts --data-only --column-inserts > data_inserts.sql
