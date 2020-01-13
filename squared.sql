SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE square_proc (p_number_to_square IN number, v_answer OUT number) IS

BEGIN
  v_answer := p_number_to_square * p_number_to_square;
END;
/ 

CREATE OR REPLACE FUNCTION square_func (p_number_to_square IN number) RETURN number IS

  v_answer number(10);

BEGIN
  v_answer := p_number_to_square * p_number_to_square;
  RETURN(v_answer);
END;
/ 

CREATE OR REPLACE PROCEDURE square_test IS

  v_num    number(10);
  v_square number(10);

BEGIN
  DBMS_OUTPUT.PUT_LINE('Starting Test');
  v_num    := 2;
  v_square := 0;

  DBMS_OUTPUT.PUT_LINE('Calling Procedure');
  WHILE v_num < 6 LOOP
        square_proc(v_num, v_square);
        DBMS_OUTPUT.PUT_LINE('Number: ' || v_num || '   Square: ' || v_square);
        v_num := v_num + 1; 
  END LOOP;

  v_num    := 2;
  DBMS_OUTPUT.PUT_LINE('Calling Function');
  WHILE v_num < 6 LOOP
        DBMS_OUTPUT.PUT_LINE('Number: ' || v_num || '   Square: ' || square_func(v_num));
        v_num := v_num + 1; 
  END LOOP;
END;
/  

SHOW ERRORS; 

