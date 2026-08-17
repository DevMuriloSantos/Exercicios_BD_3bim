CREATE OR ALTER FUNCTION FN_ADD_10_PERCENT (@value int)
RETURNS @tbl TABLE(original_value INT, updated_value INT)
AS
BEGIN
	DECLARE @result INT;
	SET @result = @value + (@value * 0.10);

	INSERT INTO @tbl (original_value, updated_value) VALUES (@value, @result);
	RETURN
END;

SELECT * FROM dbo.FN_ADD_10_PERCENT(10);

CREATE OR ALTER FUNCTION FN_HIGHEST_VALUE (@value1 int, @value2 int)
RETURNS @tbl TABLE(value1 INT, value2 INT, highest_value INT)
AS
BEGIN
	DECLARE @highest INT;
	SET @highest = CASE 
			WHEN @value1 > @value2 THEN @value1
		ELSE @value2
	END;

	INSERT INTO @TBL (value1, value2, highest_value)
	VALUES (@value1, @value2, @highest)
	RETURN;
END;

SELECT * FROM dbo.FN_HIGHEST_VALUE(10, 20);

CREATE OR ALTER FUNCTION FN_AGE (@birthday date)
RETURNS @tbl TABLE (result varchar(30))
AS
BEGIN
	DECLARE @age INT;
	SET @age = DATEDIFF(YEAR, @birthday, GETDATE());

	IF (@age < 18)
	BEGIN
		INSERT INTO @TBL (result) VALUES ('Menor de idade.')
		RETURN;
	END

	INSERT INTO @TBL (result) VALUES ('Maior de idade.');
	RETURN;
END

SELECT * FROM dbo.FN_AGE('2009-06-06');