USE [Lotto]
GO
/****** Object:  StoredProcedure [dbo].[DodajLosowanie]    Script Date: 31.07.2020 16:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DodajLosowanie](@ileLosowan AS INT = 1)
AS
BEGIN
DECLARE @licznik AS INT
SET @licznik = 0
WHILE (@licznik < @ileLosowan)
BEGIN
	DECLARE @data DATE = GETDATE() 
	DECLARE @czy_puste INT
	SET @czy_puste = (SELECT COUNT(*) FROM Losowania)

	IF (@czy_puste != 0)
		BEGIN
			SET @data = (SELECT MAX(data_losowania) FROM Losowania)
			SET @data = DATEADD(d, 7, @data)
		END
	
	INSERT INTO Losowania (L_1, L_2, L_3, L_4, L_5, L_6, data_losowania, czy_odbylo) VALUES (0,0,0,0,0,0,@data,0)
	SET @licznik = @licznik + 1
END
END
GO
