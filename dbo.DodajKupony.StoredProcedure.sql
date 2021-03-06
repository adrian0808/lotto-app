USE [Lotto]
GO
/****** Object:  StoredProcedure [dbo].[DodajKupony]    Script Date: 31.07.2020 16:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DodajKupony](@idlosowania AS INT, @ile AS INT)
AS
BEGIN
DECLARE @currentDate AS DATE
SET @currentDate = CAST(GETDATE() AS DATE)

DECLARE @isActual BIT
SET @isActual = (SELECT czy_odbylo FROM Losowania WHERE idlosowania = @idlosowania)

IF (@isActual = 0)
BEGIN
	DECLARE @licznik INT = 0
	DECLARE @L1 INT
	DECLARE @L2 INT
	DECLARE @L3 INT
	DECLARE @L4 INT
	DECLARE @L5 INT
	DECLARE @L6 INT
		WHILE (@licznik < @ile)
		BEGIN
			DECLARE NumberCursor CURSOR FOR 
				SELECT TOP 6 liczba FROM Integers ORDER BY NEWID()
			OPEN NumberCursor
			FETCH NEXT FROM NumberCursor INTO @L1
			FETCH NEXT FROM NumberCursor INTO @L2
			FETCH NEXT FROM NumberCursor INTO @L3
			FETCH NEXT FROM NumberCursor INTO @L4
			FETCH NEXT FROM NumberCursor INTO @L5
			FETCH NEXT FROM NumberCursor INTO @L6

			INSERT INTO Kupony (idlosowania, L1, L2, L3, L4, L5, L6, data_kupna) VALUES (@idlosowania, @L1, @L2, @L3, @L4, @L5, @L6, @currentDate)
			CLOSE NumberCursor
			DEALLOCATE NumberCursor
			SET @licznik = @licznik + 1
		END
	
END
ELSE
	PRINT 'Nie ma takiego losowania lub juz sie odbylo'

END
GO
