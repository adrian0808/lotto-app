USE [Lotto]
GO
/****** Object:  StoredProcedure [dbo].[WyliczTrafienia]    Script Date: 31.07.2020 16:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[WyliczTrafienia](@idlosowania AS INT)
AS
BEGIN
DECLARE @czy_wyliczone AS INT
SET @czy_wyliczone = (SELECT TOP 1 liczba_trafien FROM Kupony WHERE idlosowania = @idlosowania)
DECLARE @czy_odbyte AS BIT
SET @czy_odbyte = (SELECT czy_odbylo FROM Losowania WHERE idlosowania = @idlosowania)
IF(@czy_wyliczone = -1 AND @czy_odbyte = 1)
	BEGIN
		DECLARE @liczba_kuponow INT = (SELECT COUNT(*) FROM Kupony WHERE idlosowania = @idlosowania)
		DECLARE @L1 INT
		DECLARE @L2 INT
		DECLARE @L3 INT
		DECLARE @L4 INT
		DECLARE @L5 INT
		DECLARE @L6 INT
		DECLARE @LW1 INT
		DECLARE @LW2 INT
		DECLARE @LW3 INT
		DECLARE @LW4 INT
		DECLARE @LW5 INT
		DECLARE @LW6 INT
		DECLARE @licznik1 INT = 0
		SELECT TOP 1 @LW1 = L_1, @LW2 = L_2, @LW3 = L_3, @LW4 = L_4, @LW5 = L_5, @LW6 = L_6 FROM Losowania WHERE idlosowania = @idlosowania
		WHILE (@licznik1 < @liczba_kuponow)
			BEGIN
				DECLARE @liczba_trafien INT = 0
				DECLARE @id_kupon INT
				SELECT TOP 1 @id_kupon = idkupon, @L1 = L1, @L2 = L2, @L3 = L3, @L4 = L4, @L5 = L5, @L6 = L6 FROM Kupony WHERE idlosowania = @idlosowania AND liczba_trafien = -1

				IF(@L1 = @LW1 OR @L1 = @LW2 OR @L1 = @LW3 OR @L1 = @LW4 OR @L1 = @LW5 OR @L1 = @LW6)
					SET @liczba_trafien = @liczba_trafien + 1
				IF(@L2 = @LW1 OR @L2 = @LW2 OR @L2 = @LW3 OR @L2 = @LW4 OR @L2 = @LW5 OR @L2 = @LW6)
					SET @liczba_trafien = @liczba_trafien + 1
				IF(@L3 = @LW1 OR @L3 = @LW2 OR @L3 = @LW3 OR @L3 = @LW4 OR @L3 = @LW5 OR @L3 = @LW6)
					SET @liczba_trafien = @liczba_trafien + 1
				IF(@L4 = @LW1 OR @L4 = @LW2 OR @L4 = @LW3 OR @L4 = @LW4 OR @L4 = @LW5 OR @L4 = @LW6)
					SET @liczba_trafien = @liczba_trafien + 1
				IF(@L5 = @LW1 OR @L5 = @LW2 OR @L5 = @LW3 OR @L5 = @LW4 OR @L5 = @LW5 OR @L5 = @LW6)
					SET @liczba_trafien = @liczba_trafien + 1
				IF(@L6 = @LW1 OR @L6 = @LW2 OR @L6 = @LW3 OR @L6 = @LW4 OR @L6 = @LW5 OR @L6 = @LW6)
					SET @liczba_trafien = @liczba_trafien + 1

				UPDATE Kupony SET liczba_trafien = @liczba_trafien WHERE idkupon = @id_kupon
				SET @licznik1 = @licznik1 + 1
			END
			
	END

END
GO
