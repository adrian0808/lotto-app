USE [Lotto]
GO
/****** Object:  StoredProcedure [dbo].[WykonajLosowanie]    Script Date: 31.07.2020 16:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[WykonajLosowanie]
AS
BEGIN

DECLARE @ID INT

SET @ID = (SELECT TOP 1 idlosowania FROM Losowania WHERE czy_odbylo = 0 ORDER BY data_losowania ASC) --id losowania


IF(@ID != 0)
	BEGIN
		DECLARE NumberCursor CURSOR FOR
			SELECT TOP 6 liczba FROM Integers ORDER BY NEWID()
		OPEN NumberCursor
		DECLARE @L1 INT
		DECLARE @L2 INT
		DECLARE @L3 INT
		DECLARE @L4 INT
		DECLARE @L5 INT
		DECLARE @L6 INT
		FETCH NEXT FROM NumberCursor INTO @L1
		FETCH NEXT FROM NumberCursor INTO @L2
		FETCH NEXT FROM NumberCursor INTO @L3
		FETCH NEXT FROM NumberCursor INTO @L4
		FETCH NEXT FROM NumberCursor INTO @L5
		FETCH NEXT FROM NumberCursor INTO @L6
		UPDATE Losowania SET czy_odbylo = 1, L_1 = @L1, L_2 = @L2, L_3 = @L3, L_4 = @L4, L_5 = @L5, L_6 = @L6 WHERE idlosowania = @ID
		EXEC WyliczTrafienia @ID
		EXEC WyliczWygrana @ID
	END
ELSE
	PRINT 'Nie ma obecnie zadnych losowan'

CLOSE NumberCursor
DEALLOCATE NumberCursor

END
GO
