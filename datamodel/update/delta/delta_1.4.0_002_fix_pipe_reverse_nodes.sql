DROP TRIGGER tr_pipe_geom_update ON qwat_od.pipe;

CREATE TRIGGER tr_pipe_geom_update
    BEFORE UPDATE OF geometry
    ON qwat_od.pipe
    FOR EACH ROW
    WHEN (ST_OrderingEquals(st_force2d(new.geometry), st_force2d(old.geometry)) IS FALSE)
    EXECUTE PROCEDURE qwat_od.ft_pipe_geom();

COMMENT ON TRIGGER tr_pipe_geom_update ON qwat_od.pipe
    IS 'Trigger: updates auto fields of the pipe after geom update.';
