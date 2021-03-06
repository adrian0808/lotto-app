USE [Lotto]
GO
/****** Object:  StoredProcedure [dbo].[WyliczWygrana]    Script Date: 31.07.2020 16:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[WyliczWygrana](@idlosowania AS INT)
AS
BEGIN
DECLARE @ile_kuponow INT = (SELECT COUNT(*) FROM Kupony WHERE idlosowania = @idlosowania AND wygrana = -1)
DECLARE @ile_trojek INT = (SELECT COUNT(*) FROM Kupony WHERE idlosowania = @idlosowania AND liczba_trafien = 3)
DECLARE @ile_czworek INT = (SELECT COUNT(*) FROM Kupony WHERE idlosowania = @idlosowania AND liczba_trafien = 4)
DECLARE @ile_piatek INT = (SELECT COUNT(*) FROM Kupony WHERE idlosowania = @idlosowania AND liczba_trafien = 5)
DECLARE @ile_szostek INT = (SELECT COUNT(*) FROM Kupony WHERE idlosowania = @idlosowania AND liczba_trafien = 6)


DECLARE @przelicznik DECIMAL = (@ile_kuponow*3)/(@ile_trojek + 5*@ile_czworek + 5000*@ile_piatek + 100000*@ile_szostek)
DECLARE @wygrana_za_trojke DECIMAL = @przelicznik
DECLARE @wygrana_za_czworke DECIMAL = @przelicznik * 5
DECLARE @wygrana_za_piatke DECIMAL = @przelicznik * 5000
DECLARE @wygrana_za_szostke DECIMAL = @przelicznik * 100000

UPDATE Kupony
SET wygrana = CASE  
	WHEN liczba_trafien = 3 THEN @wygrana_za_trojke
    WHEN liczba_trafien = 4 THEN @wygrana_za_czworke
	WHEN liczba_trafien = 5 THEN @wygrana_za_piatke
	WHEN liczba_trafien = 6 THEN @wygrana_za_szostke
	ELSE 0
    END 
WHERE idlosowania = @idlosowania AND wygrana = -1

END
GO
