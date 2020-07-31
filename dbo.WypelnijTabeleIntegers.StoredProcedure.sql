USE [Lotto]
GO
/****** Object:  StoredProcedure [dbo].[WypelnijTabeleIntegers]    Script Date: 31.07.2020 16:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[WypelnijTabeleIntegers](@ile INT)
AS
BEGIN
DECLARE @licznik INT = 0
WHILE @licznik < @ile
	BEGIN
	SET @licznik = @licznik + 1
	INSERT INTO Integers (liczba) VALUES (@licznik)
	END
END
GO
