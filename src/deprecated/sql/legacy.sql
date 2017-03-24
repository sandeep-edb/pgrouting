-------------------------------------------------------------------------------
-- Legacy FUNCTIONs that were ment to be used by 
-- Temporarly while the rewrite of 2.0
-- These FUNCTIONs wer used on the plpgsql functions


-- FILE intended to be used on 3.0
-------------------------------------------------------------------------------


-- Deprecated signature on 2.1.0
CREATE OR REPLACE FUNCTION pgr_dijkstra(
    edges_sql TEXT,
    start_vid INTEGER,
    end_vid INTEGER,
    directed BOOLEAN,
    has_rcost BOOLEAN)
RETURNS SETOF pgr_costresult AS
$BODY$
    SELECT seq-1 , node::integer, edge::integer, cost
    FROM pgr_dijkstra($1, ARRAY[$2]::BIGINT[], ARRAY[$3]::BIGINT[], directed);
$BODY$
LANGUAGE sql VOLATILE
COST 100
ROWS 1000;

