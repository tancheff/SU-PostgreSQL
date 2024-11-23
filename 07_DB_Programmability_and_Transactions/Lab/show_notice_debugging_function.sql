CREATE OR REPLACE FUNCTION fn_show_notice(msg varchar(40))
RETURNS BOOL AS
$$
    BEGIN
        RAISE NOTICE 'The notice is: %', msg;
        RETURN TRUE;
    END;
$$
LANGUAGE plpgsql;

SELECT fn_show_notice('Hello there');   -- отива се в output и се гледа къде е излязло
                                        -- с цел дебъгване на query.