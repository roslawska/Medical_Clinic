create database SiecPrzychodni

use SiecPrzychodni
go

-- tabela przechowujaca dane przychodni
create table Przychodnia(
ID_Przychodnia varchar(5) constraint ID_Przychodnia_PR_NN not null,
Nazwa varchar(20),
Ulica varchar(30),
Nr_Budynku int,
ID_Miasto varchar(5),
Telefon varchar(10),
constraint ID_Przychodnia_PR_check check (ID_Przychodnia like 'PR[0-9][0-9][0-9]'),
constraint Nazwa_PR_check check (Nazwa not like '%[^A-Z]%'),
constraint Ulica_PR_check check (Ulica not like '%[^A-Z]%'),
constraint Nr_Budynku_PR_check check (Nr_Budynku>0 and Nr_Budynku<90),
constraint Telefon_PR_check check (Telefon like '+48[1-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)
alter table Przychodnia
add constraint ID_Przychodnia_PK primary key(ID_Przychodnia)

--tabela przechowujaca miasta
create table Miasto(
ID_Miasto varchar(5) constraint ID_Miasto_MM_NN not null,
Nazwa varchar(20),
constraint ID_Miasto_MM_check check (ID_Miasto like 'MM[0-9][0-9][0-9]'),
constraint Nazwa_MM_check check (Nazwa not like '%[^A-Z]%')
)
alter table Miasto
add constraint ID_Miasto_PK primary key(ID_Miasto)

--tabela zawierająca lekarzy
create table Lekarz(
ID_Lekarz varchar(5) constraint ID_Lekarz_LR_NN not null,
Imie varchar(20),
Nazwisko varchar(30),
constraint ID_Lekarz_LR_check check (ID_Lekarz like 'LR[0-9][0-9][0-9]'),
constraint Imie_LR_check check (Imie not like '%[^A-Z]%'),
constraint Nazwisko_LR_check check (Nazwisko not like '%[^A-Z]%')
)
alter table Lekarz
add constraint ID_Lekarz_PK primary key(ID_Lekarz)

--tabela posrednia, jeden lekarz moze pracowac w wielu przchodniach, a w jednej przychodni moze byc wielu lekarzy
create table LekarzPrzychodnia(
ID_LP varchar(5) constraint ID_LP_NN not null,
ID_Lekarz varchar(5),
ID_Przychodnia varchar(5),
constraint ID_LP_check check (ID_LP like 'LP[0-9][0-9][0-9]')
)
alter table LekarzPrzychodnia
add constraint ID_LP_PK primary key(ID_LP)

--tabela przechowująca wszystkie specjalizacje lekarzy w przychodni
create table Specjalizacja(
ID_Specjalizacja varchar(5) constraint ID_Specjalizacja_SP_NN not null,
Nazwa varchar(20),
constraint ID_Specjalizacja_SP_check check (ID_Specjalizacja like 'SP[0-9][0-9][0-9]'),
constraint Nazwa_SP_check check (Nazwa not like '%[^A-Z]%')
)
alter table Specjalizacja
add constraint ID_Specjalizacja_PK primary key(ID_Specjalizacja)

--tabela pośrednia lekarz-specjalizacja
create table LekarzSpecjalizacja(
ID_LS varchar(5) constraint ID_LS_NN not null,
ID_Lekarz varchar(5),
ID_Specjalizacja varchar(5),
constraint ID_LS_check check (ID_LS like 'LS[0-9][0-9][0-9]')
)
alter table LekarzSpecjalizacja
add constraint ID_LS_PK primary key(ID_LS)

--tabela przechowujaca pacjentow
create table Pacjent(
ID_Pacjent varchar(5) constraint ID_Pacjent_PT_NN not null,
Imie varchar(20),
Nazwisko varchar(30),
PESEL varchar(11),
Ulica varchar(30),
Nr_Budynku int,
ID_Miasto varchar(5),
constraint ID_Pacjent_PT_check check (ID_Pacjent like 'PT[0-9][0-9][0-9]'),
constraint Imie_PT_check check (Imie not like '%[^A-Z]%'),
constraint Nazwisko_PT_check check (Nazwisko not like '%[^A-Z]%'),
constraint PESEL_PT_check check (PESEL like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
constraint Ulica_PT_check check (Ulica not like '%[^A-Z]%'),
constraint Nr_Budynku_PT_check check (Nr_Budynku>0 and Nr_Budynku<90)
)
alter table Pacjent
add constraint ID_Pacjent_PK primary key(ID_Pacjent)


--tabela przechowujaca wizyty, jesdt to tabela posrednia miedzy pacjentem a lekarzem, jednoczesnie informujaca o daci wizyty
create table Wizyta(
ID_Wizyta varchar(5) constraint ID_Wizyta_WT_NN not null,
Data_wizyty date,
ID_Lekarz varchar(5),
ID_Pacjent varchar(5),
ID_Przychodnia varchar(5),
constraint ID_Wizyta_WT_check check (ID_Wizyta like 'WT[0-9][0-9][0-9]'),
constraint Data_wizyty_WT_check check (Data_wizyty > '2010/01/01')
)
alter table Wizyta
add constraint ID_Wizyta_PK primary key(ID_Wizyta)


--tabela zawierajaca skierowania pacjentow
create table Skierowanie(
ID_Skierowanie varchar(5) constraint ID_Skierowanie_SK_NN not null,
ID_Pacjent varchar(5),
ID_Lekarz varchar(5),
constraint ID_Skierowanie_SK_check check (ID_Skierowanie like 'SK[0-9][0-9][0-9]')
)
alter table Skierowanie
add constraint ID_Skierowanie_PK primary key(ID_Skierowanie)

--tabela zawierajaca rozne badania
create table Badanie(
ID_Badanie varchar(5) constraint ID_Badanie_BD_NN not null,
Nazwa varchar(40),
constraint ID_Badanie_BD_check check (ID_Badanie like 'BD[0-9][0-9][0-9]')
)
alter table Badanie
add constraint ID_Badanie_PK primary key(ID_Badanie)


--tabela posrednia, skierowanie jednego pacjenta moze dotyczyc wielu badan, a jedno badanie moze występowac na wielu skierowaniach
create table SkierowanieBadanie(
ID_SB varchar(5) constraint ID_SB_NN not null,
ID_Skierowanie varchar(5),
ID_Badanie varchar(5),
Cel_skierowania varchar(200),
Data_wyst date,
constraint ID_SB_check check (ID_SB like 'SB[0-9][0-9][0-9]'),
constraint Data_wyst_SB_check check (Data_wyst > '2010/01/01')
)
alter table SkierowanieBadanie
add constraint ID_SB_PK primary key(ID_SB)

--tabela zawierajaca leki
create table Lek(
ID_Lek varchar(5) constraint ID_Lek_LK_NN not null,
Nazwa varchar(20),
Dawkowanie_dorosly float,
Dawk_dorosly_opis varchar(10),
Dawkowanie_dziecko float,
Dawk_dziecko_opis varchar(10),
constraint ID_Lek_LK_check check (ID_Lek like 'LK[0-9][0-9][0-9]'),
constraint Nazwa_LK_check check (Nazwa not like '%[^A-Z]%'),
constraint Dawkowanie_dorosly_LK_check check (Dawkowanie_dorosly>0.0 and Dawkowanie_dorosly<9.9),
constraint Dawkowanie_dziecko_LK_check check (Dawkowanie_dziecko>0.0 and Dawkowanie_dziecko<9.9)
)
alter table Lek
add constraint ID_Lek_PK primary key(ID_Lek)


--tabela posrednia lek-pacjent, na jednej recepcie dla jednego pacjenta moze byc wiele lekow, ale te same leki mogą byc na receptach dla innych pacjentow
create table Recepta(
ID_Recepta varchar(5) constraint ID_Recepta_RR_NN not null,
ID_Pacjent varchar(5),
ID_Lek varchar(5),
ID_Lekarz varchar(5),
constraint ID_Recepta_RR_check check (ID_Recepta like 'RR[0-9][0-9][0-9]'),
)
alter table Recepta
add constraint ID_Recepta_PK primary key(ID_Recepta)

-- tabela przechowujaca karty pacjentow
create table KartaPacjenta(
ID_KartaPacjenta varchar(5) constraint ID_KartaPacjenta_KP_NN not null,
ID_Pacjent varchar(5),
ID_Skierowanie varchar(5),
ID_Recepta varchar(5),
Data_wpisu date,
Opis varchar(500),
--ID_Choroba varchar(5),
constraint ID_KartaPacjenta_KP_check check (ID_KartaPacjenta like 'KP[0-9][0-9][0-9]'),
constraint Data_wpisu_KP_check check (Data_wpisu > '2010/01/01')
)
alter table KartaPacjenta
add constraint ID_KartaPacjenta_PK primary key(ID_KartaPacjenta)



alter table LekarzSpecjalizacja
add foreign key (ID_Specjalizacja) references  Specjalizacja(ID_Specjalizacja)

alter table LekarzSpecjalizacja
add foreign key (ID_Lekarz) references  Lekarz(ID_Lekarz)
 
alter table LekarzPrzychodnia
add foreign key (ID_Przychodnia) references  Przychodnia(ID_Przychodnia)

alter table LekarzPrzychodnia
add foreign key (ID_Lekarz) references  Lekarz(ID_Lekarz)

alter table Przychodnia
add foreign key (ID_Miasto) references  Miasto(ID_Miasto)

alter table Recepta
add foreign key (ID_Lek) references  Lek(ID_Lek)

alter table Recepta
add foreign key (ID_Pacjent) references  Pacjent(ID_Pacjent)

alter table Recepta
add foreign key (ID_Lekarz) references  Lekarz(ID_Lekarz)

alter table Pacjent
add foreign key (ID_Miasto) references  Miasto(ID_Miasto)

alter table KartaPacjenta
add foreign key (ID_Skierowanie) references  Skierowanie(ID_Skierowanie)

alter table KartaPacjenta
add foreign key (ID_Recepta) references  Recepta(ID_Recepta)

alter table KartaPacjenta
add foreign key (ID_Pacjent) references  Pacjent(ID_Pacjent)

alter table Wizyta
add foreign key (ID_Lekarz) references  Lekarz(ID_Lekarz)

alter table Wizyta
add foreign key (ID_Pacjent) references  Pacjent(ID_Pacjent)

alter table Wizyta
add foreign key (ID_Przychodnia) references  Przychodnia(ID_Przychodnia)

alter table SkierowanieBadanie
add foreign key (ID_Badanie) references Badanie(ID_Badanie)

alter table SkierowanieBadanie
add foreign key (ID_Skierowanie) references Skierowanie(ID_Skierowanie)

alter table Skierowanie
add foreign key (ID_Pacjent) references Pacjent(ID_Pacjent)

alter table Skierowanie
add foreign key (ID_Lekarz) references Lekarz(ID_Lekarz)