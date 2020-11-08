use SiecPrzychodni
go

--Procedura dodaj¹ca lekarza
CREATE or ALTER PROCEDURE DodajLekarza
	@ID_Lekarz varchar(5),
	@Imie varchar(20),
	@Nazwisko varchar(30),
	@ID_Specjalizacja varchar(5),
	@ID_LS varchar(5)
AS
	INSERT INTO SiecPrzychodni..Lekarz(ID_Lekarz,Imie,Nazwisko)
	VALUES (@ID_Lekarz,@Imie,@Nazwisko);
	INSERT INTO SiecPrzychodni..LekarzSpecjalizacja(ID_LS,ID_Lekarz,ID_Specjalizacja)
	VALUES(@ID_LS,@ID_Lekarz,@ID_Specjalizacja)
GO

--wywo³anie procedury DodajLekarza
EXEC DodajLekarza 'LR030','Jan','Kowalski','SP001','LS030'
select * from Lekarz
select * from LekarzSpecjalizacja


-- Procedura dodaj¹ca nowego pacjenta
CREATE or ALTER PROCEDURE DodajPacjenta
	@ID_Pacjent varchar(5),
	@Imie varchar(20),
	@Nazwisko varchar(30),
	@PESEL varchar(11),
	@Ulica varchar(30),
	@Nr_Budynku int,
	@ID_Miasto varchar(5)
AS
	INSERT INTO SiecPrzychodni..Pacjent(ID_Pacjent,Imie,Nazwisko,PESEL,Ulica,Nr_Budynku,ID_Miasto)
	VALUES (@ID_Pacjent,@Imie,@Nazwisko,@PESEL,@Ulica,@Nr_Budynku,@ID_Miasto);
GO

--wywo³anie procedury DodajPacjenta
EXEC DodajPacjenta 'PT101','Jan','Kowalczyk','96031700017','Strzeminskiego',24,'MM004'
select * from Pacjent


--Procedura tworz¹ca now¹ wizytê
CREATE or ALTER PROCEDURE NowaWizyta
	@ID_Wizyta varchar(5),
	@Data_wizyty date,
	@ID_Lekarz varchar(5),
	@ID_Pacjent varchar(5),
	@ID_Przychodnia varchar(5)
AS
	INSERT INTO SiecPrzychodni..Wizyta(ID_Wizyta, Data_wizyty, ID_Lekarz, ID_Pacjent, ID_Przychodnia)
	VALUES (@ID_Wizyta,@Data_wizyty,@ID_Lekarz,@ID_Pacjent,@ID_Przychodnia)
GO

--wywo³anie procedury NowaWizyta
EXEC NowaWizyta 'WT030','2020-08-22','LR001','PT010','PR001'
select * from Wizyta

--Procedura tworz¹ca now¹ receptê
CREATE or ALTER PROCEDURE NowaRecepta
	@ID_Recepta varchar(5),
	@ID_Pacjent varchar(5),
	@ID_Lek varchar(5),
	@ID_Lekarz varchar(5)
AS
	INSERT INTO SiecPrzychodni..Recepta(ID_Recepta,ID_Pacjent,ID_Lek,ID_Lekarz)
	VALUES (@ID_Recepta,@ID_Pacjent,@ID_Lek,@ID_Lekarz)
GO

--wywo³anie procedury NowaRecepta
EXEC NowaRecepta 'RR020','PT001','LK001','LR001'
select * from Recepta

--Procedura tworz¹ca nowe skierowanie
CREATE or ALTER PROCEDURE NoweSkierowanie
	@ID_Skierowanie varchar(5),
	@ID_Pacjent varchar(5),
	@ID_Lekarz varchar(5),
	@ID_SB varchar(5),
	@ID_Badanie varchar(5),
	@Cel_skierowania varchar(200),
	@Data_wyst date
AS
	INSERT INTO SiecPrzychodni..Skierowanie(ID_Skierowanie,ID_Pacjent,ID_Lekarz)
	VALUES (@ID_Skierowanie,@ID_Pacjent,@ID_Lekarz)
	INSERT INTO SiecPrzychodni..SkierowanieBadanie(ID_SB,ID_Skierowanie,ID_Badanie,Cel_skierowania,Data_wyst)
	VALUES (@ID_SB,@ID_Skierowanie,@ID_Badanie,@Cel_skierowania,@Data_wyst)
GO

--Wywo³anie Procedury NoweSkierowanie
EXEC NoweSkierowanie 'SK050','PT001','LR001','SB020','BD001','Rutynowa kontrola pacjenta.','2020-05-31'
select * from Skierowanie
select * from SkierowanieBadanie



--funkcja obliczaj¹ca dawke leku na kg
CREATE FUNCTION DawkaLeku (@waga FLOAT, @dawkowanie FLOAT)
RETURNS FLOAT
AS
BEGIN
	RETURN (@waga*@dawkowanie)
END

--wywo³anie funkcji DawkaLeku
SELECT dbo.DawkaLeku(50,0.5)

