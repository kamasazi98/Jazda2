use kadry;
-- =========================================================================================================ZADANIE 4.1
-- 1. Jakie jest średnie wynagrodzenie i liczba pracowników zatrudnionych w dziale o ID równym 110 ?
SELECT round(avg(pobory),2) as "srednie zarobki",count(imie) as "ilosc osob w dziale 110" FROM pracownicy where dzial_id='110';
-- 2. Jaka jest najwyższa, najniższa, suma i średnia pensja wszystkich pracowników?
Select max(pobory) as "najwyzsza pensja", min(pobory) as "najnizsza pensja",round(avg(pobory),2) as "srednia pensja",sum(pobory) as "suma pensji" from pracownicy;
-- 3. Sporządź zestawienie kodów stanowisk i ilości pracowników zatrudnionych na tych stanowiskach.
select stanowisko_id as "kod stanowiska",count(*) as"Ilosc osob pracujacych na stanowisku" from pracownicy group by stanowisko_id;
-- 4. Jaka jest różnica między najwyższą i najniższą pensją.
Select max(pobory)-min(pobory) as "roznica między najwyższą i najniższą pensją " from pracownicy;
-- 5. Sporządź listę ID szefów, uporządkowaną rosnąco, oraz pobory najniżej opłacanego pracownika dla tego szefa.
select szef_id as "Id szefa",min(pobory) as "pobory najniżej opłacanego pracownika" from pracownicy group by szef_id order by szef_id;
-- 6. Sporządź listę ID działów i łączne pobory w każdym dziale.
select dzial_id as "id działu", sum(pobory) "pobory"from pracownicy group by dzial_id;
-- 7. Oblicz średnie pobory dla każdego ID stanowiska, oprócz programistów (ID: IT_PROG).
Select stanowisko_id as "id stanowiska", round(avg(pobory),2) as "srednie pobory" from pracownicy where stanowisko_id!="IT_PROG" group by stanowisko_id ;
-- 8. Znajdź, tylko dla działu o ID równym 110, sumę poborów, maksimum, minimum oraz średnie pobory pracowników.
Select max(pobory) as "najwyzsza pensja", min(pobory) as "najnizsza pensja",round(avg(pobory),2) as "srednia pensja",sum(pobory) as "suma pensji" from pracownicy where dzial_id="110";
-- 9. Sporządź listę ID stanowisk z maksymalnymi poborami pracowników, dla tych stanowisk, w których maksymalne pobory są większe lub równe 4000.
Select stanowiska.stanowisko_id as "id stanowiska", max(pobory) as "maksymalne pobory" from pracownicy,stanowiska where stanowiska.max_pobory>=4000 group by stanowiska.stanowisko_id;
-- 10. Sporządź listę ID stanowisk z średnimi poborami dla wszystkich działów zatrudniających więcej niż 10 pracowników.
Select stanowisko_id as "id stanowiska",round(avg(pobory),2) as "srednie pobory" from pracownicy group by stanowisko_id having count(pracownicy.imie)>10;

-- =========================================================================================================ZADANIE 4.2
-- 1. Jakie jest średnie wynagrodzenie i liczba pracowników zatrudnionych w dziale 'Administration' ?
Select round(avg(pobory),2) as "srednie wynagrodzenie", count(*) as "liczba pracownikow" from pracownicy,dzialy where dzial_nazwa="Administration" and pracownicy.dzial_id = dzialy.dzial_id;
-- 2. Jaka jest najwyższa, najniższa, suma i średnia pensja wszystkich pracowników w dziale 'Marketing' ?
Select max(pobory) as "najwyzsza pensja", min(pobory) as "najnizsza pensja", sum(pobory) as "suma pensji", round(avg(pobory),2) as "srednia pensji" from pracownicy, dzialy where dzial_nazwa="Marketing" and pracownicy.dzial_id = dzialy.dzial_id; 
-- 3. Sporządź zestawienie stanowisk i ilości pracowników zatrudnionych na tych stanowiskach.
select stanowisko_nazwa as "stanowisko",count(*) as"Ilosc osob pracujacych na stanowisku" from pracownicy,stanowiska where stanowiska.stanowisko_id = pracownicy.stanowisko_id group by pracownicy.stanowisko_id;
-- 4. Jaka jest różnica między najwyższą i najniższą pensją w dziale 'Purchasing'.
Select max(pobory)-min(pobory) as "roznica między najwyższą i najniższą pensją w dziale Purchasing " from pracownicy,dzialy  where dzial_nazwa="Purchasing" and pracownicy.dzial_id = dzialy.dzial_id ;
-- 5. Sporządź listę szefów, uporządkowaną rosnąco, oraz pobory najniżej opłacanego pracownika dla tego szefa.
select szef_id as "Id szefa",min(pobory) as "pobory najniżej opłacanego pracownika" from pracownicy group by szef_id order by szef_id;
-- 6. Sporządź listę działów i łączne pobory w każdym dziale.
select dzial_nazwa as "nazwa działu", sum(pobory) "pobory"from pracownicy,dzialy  where pracownicy.dzial_id = dzialy.dzial_id group by pracownicy.dzial_id;
-- 7. Oblicz średnie pobory dla każdego stanowiska, oprócz programistów (ID: IT_PROG).
Select stanowisko_nazwa as "nazwa stanowiska", round(avg(pobory),2) as "srednie pobory" from pracownicy,stanowiska where pracownicy.stanowisko_id!="IT_PROG" and stanowiska.stanowisko_id = pracownicy.stanowisko_id group by pracownicy.stanowisko_id ;
-- 8. Znajdź, tylko dla działu `Human Resources` (Kadry), sumę poborów, maksimum, minimum oraz średnie pobory pracowników.
Select max(pobory) as "najwyzsza pensja", min(pobory) as "najnizsza pensja", sum(pobory) as "suma pensji", round(avg(pobory),2) as "srednia pensji" from pracownicy, dzialy where dzial_nazwa="Human Resources" and pracownicy.dzial_id = dzialy.dzial_id;
-- 9. Sporządź listę stanowisk z maksymalnymi poborami pracowników, dla tych stanowisk, w których maksymalne pobory są większe lub równe 4 tys.
Select stanowiska.stanowisko_nazwa as "nazwa stanowiska", max(pobory) as "maksymalne pobory" from pracownicy,stanowiska where stanowiska.max_pobory>=4000 group by stanowiska.stanowisko_id;
-- 10. Sporządź listę stanowisk z średnimi poborami dla wszystkich działów zatrudniających więcej niż 10 pracowników.
Select stanowisko_nazwa as "nazwa stanowiska",round(avg(pobory),2) as "srednie pobory" from pracownicy,stanowiska group by pracownicy.stanowisko_id having count(pracownicy.imie)>10;

-- =========================================================================================================ZADANIE 4.2
-- 1. Znajdź imie, nazwisko, stanowisko, identyfikator działu i nazwę działu dla pracowników, którzy pracują w Londynie.
Select imie, nazwisko,stanowisko_nazwa as "stanowisko", dzialy.dzial_id as "identyfikator działu", dzialy.dzial_nazwa as "nazwa dzialu" from pracownicy,dzialy,adresy,stanowiska where miasto = "London" and pracownicy.dzial_id = dzialy.dzial_id and dzialy.adres_id = adresy.adres_id ;
-- 2. Sporządź zestawienie nazwę działów i liczby pracowników w dziale.
Select dzialy.dzial_nazwa as "nazwa dzialu", count(imie) as "liczba pracownikow" from dzialy, pracownicy where pracownicy.dzial_id = dzialy.dzial_id group by pracownicy.dzial_id;
-- 3. Sporządź zestawienie informacje o wszystkich działach w formacie: identyfikator działu z jego nazwą oraz imię i nazwisko szefa działu.

-- 4. Sporządź historię zatrudnienia (kolumny z tabeli historia_zatrudnienia), dla wszystkich pracowników, którzy zarabiają więcej niż 5tys.
Select data_poczatkowa as "data zatrudnienia", data_koncowa as "data zwolnienia", historia_zatrudnienia.stanowisko_id as "Id stanowiska", historia_zatrudnienia.dzial_id as "id dzialu" from historia_zatrudnienia,pracownicy where pobory>5000 and pracownicy.dzial_id = historia_zatrudnienia.dzial_id and pracownicy.stanowisko_id = historia_zatrudnienia.stanowisko_id;
-- 5. Napisz zapytanie, które wyświetli nazwę działu, imię, nazwisko, datę zatrudnienia, pobory dla wszystkich menedżerów, którzy pracują dłużej niż 10 lat (wg daty bieżacej).
