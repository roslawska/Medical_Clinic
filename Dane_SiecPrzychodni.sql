use SiecPrzychodni
go

insert into Miasto values ('MM001','Lodz');
insert into Miasto values ('MM002','Pabianice');
insert into Miasto values ('MM003','Zgierz');
insert into Miasto values ('MM004','Brzeziny');
select * from Miasto

insert into Przychodnia values('PR001','KardMed','Paderewskiego',5,'MM001','+486846725');
insert into Przychodnia values('PR002','DentMed','Pabianicka',60,'MM001','+486846754');
insert into Przychodnia values('PR003','OkoMed','Tuszyńska',22,'MM001','+486846778');
select * from Przychodnia

insert into Specjalizacja values ('SP001','Rodzinny');
insert into Specjalizacja values ('SP002','Okulista');
insert into Specjalizacja values ('SP003','Dentysta');
insert into Specjalizacja values ('SP004','Kardiolog');
select * from Specjalizacja

insert into Lekarz values ('LR001','Beata','Krajewska');
insert into Lekarz values ('LR002','Urszula','Grejf');
insert into Lekarz values ('LR003','Piotr','Frykas');
insert into Lekarz values ('LR004','Zygmunt','Frojd');
insert into Lekarz values ('LR005','Katarzyna','Sekielska');
insert into Lekarz values ('LR006','Bartosz','Morozowski');
insert into Lekarz values ('LR007','Elzbieta','Pela');
insert into Lekarz values ('LR008','Kacper','Pikos');
insert into Lekarz values ('LR009','Arleta','Witt');
insert into Lekarz values ('LR010','Tomasz','Kostrzewa');
select * from Lekarz

insert into LekarzPrzychodnia values('LP001','LR001','PR001');
insert into LekarzPrzychodnia values('LP002','LR002','PR002');
insert into LekarzPrzychodnia values('LP003','LR003','PR001');
insert into LekarzPrzychodnia values('LP004','LR004','PR003');
insert into LekarzPrzychodnia values('LP005','LR005','PR002');
insert into LekarzPrzychodnia values('LP006','LR006','PR002');
insert into LekarzPrzychodnia values('LP007','LR007','PR003');
insert into LekarzPrzychodnia values('LP008','LR008','PR002');
insert into LekarzPrzychodnia values('LP009','LR009','PR003');
insert into LekarzPrzychodnia values('LP010','LR010','PR001');

insert into LekarzSpecjalizacja values ('LS001','LR001','SP001');
insert into LekarzSpecjalizacja values ('LS002','LR002','SP003');
insert into LekarzSpecjalizacja values ('LS003','LR003','SP004');
insert into LekarzSpecjalizacja values ('LS004','LR004','SP002');
insert into LekarzSpecjalizacja values ('LS005','LR005','SP001');
insert into LekarzSpecjalizacja values ('LS006','LR006','SP001');
insert into LekarzSpecjalizacja values ('LS007','LR007','SP002');
insert into LekarzSpecjalizacja values ('LS008','LR008','SP003');
insert into LekarzSpecjalizacja values ('LS009','LR009','SP001');
insert into LekarzSpecjalizacja values ('LS010','LR010','SP004');

insert into Badanie values('BD001','Morfologia krwi');
insert into Badanie values('BD002','RTG');
insert into Badanie values('BD003','USG');
insert into Badanie values('BD004','EKG');
insert into Badanie values('BD005','EEG');
insert into Badanie values('BD006','Rezonans magnetyczny');
insert into Badanie values('BD007','Tomografia komputerowa');
insert into Badanie values('BD008','Szczepienie');
insert into Badanie values('BD009','Badanie okulistyczne');
insert into Badanie values('BD010','Leczenie kanałowe zęba');
insert into Badanie values('BD011','Rutynowa kontrola stanu uzębienia');
select * from Badanie


insert into Pacjent values('PT001','Anna','Lebioda',91021507883,'Wiwulskiego',82,'MM003');
insert into Pacjent values('PT002','Piotr','Lebioda',91092712896,'Wiwulskiego',82,'MM003');
insert into Pacjent values('PT003','Stanisław','Frytka',37013112331,'Ciasna',67,'MM002');
insert into Pacjent values('PT004','Karolina','Pomaska',98120147823,'Astonautów',34,'MM001');
insert into Pacjent values('PT005','Sylwia','Pomaska',74042807821,'Astronautów',34,'MM001');
insert into Pacjent values('PT006','Bolesław','Hajda',60010907874,'Wiwulskiego',80,'MM003');
insert into Pacjent values('PT007','Hieronim','Gufi',44021507813,'Ceramiczna',2,'MM004');
insert into Pacjent values('PT008','Hanna','Pająk',90063007809,'Warszawska',10,'MM004');
insert into Pacjent values('PT009','Izabela','Kurczak',82102607841,'Karpacka',9,'MM003');
insert into Pacjent values('PT010','Jan','Strzegomski',67032307813,'Kosmonautów',37,'MM002');
insert into Pacjent values('PT011','Euzebiusz','Freja',53110107833,'Wiosenna',16,'MM001');
insert into Pacjent values('PT012','Alicja','Strzegomska',79081507823,'Kosmonautów',89,'MM002');
insert into Pacjent values('PT013','Stanislawa','Labedz',39040907801,'Tuszyńska',5,'MM004');
insert into Pacjent values('PT014','Karol','Fistaszek',96021507817,'Zaolziańska',32,'MM003');
insert into Pacjent values('PT015','Piotr','Matajko',77061907833,'Ciołkowskiego',2,'MM004');
select * from Pacjent


insert into Lek values('LK001','Relanium','2.0','mg/kg','1.0','mg/kg');
insert into Lek values('LK002','Diclac','3.0','mg/kg','2.0','mg/kg');
insert into Lek values('LK003','NoSpa','5.0','mg/kg','3.0','mg/kg');
insert into Lek values('LK004','Ibuprom','1.0','mg/kg','0.5','mg/kg');
select * from Lek

insert into Wizyta values('WT001','2020-07-10','LR001','PT001','PR001');
select * from Wizyta

insert into Skierowanie values('SK001','PT001','LR001');
select * from Skierowanie

insert into SkierowanieBadanie values('SB001','SK001','BD001','Kontrola stanu zdrowia pacjenta','2020-05-28');
select * from SkierowanieBadanie

insert into Recepta values('RR001','PT001','LK001','LR001');
select * from Recepta

insert into KartaPacjenta values('KP001','PT001','SK001','RR001','2020-06-01','Pacjent zglosil sie ze zlym samopoczuciem. Zlecona morfologia krwi. Kontrola za 2 tygodnie');
select * from KartaPacjenta