CREATE OR REPLACE FUNCTION tn_create_set_owner()
 RETURNS event_trigger
 LANGUAGE plpgsql
AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_ddl_commands() WHERE command_tag='CREATE TABLE' LOOP
    EXECUTE format('ALTER TABLE %s OWNER TO nrgs', obj.object_identity);
  END LOOP;
END;
$$;

CREATE EVENT TRIGGER tn_set_owner
 ON ddl_command_end
 WHEN tag IN ('CREATE TABLE')
 EXECUTE PROCEDURE tn_create_set_owner();

