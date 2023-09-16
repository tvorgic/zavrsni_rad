# ljestve (hash) je komentar i on se ne izvodi
# Izvođenje naredbi na serveru
# Otvoriti CMD
# Zaljepiti sljedeću naredbu bez prvog hash znaka
# c:\xampp\mysql\bin\mysql -uroot < C:\Users\Tonko\Documents\edunovapp26\zavrsni_rad\SQL\kuharica.sql
# c:\xampp\mysql\bin\mysql -uroot < C:\Users\Tonko\Documents\kuharica\kuharica.hr\SQL\kuharica.sql

drop database if exists kuharica;
##Klijent pokrenuti s --default-character-set=utf8 
create database kuharica DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci;

use kuharica;


create table jedinica_mjere(
    sifra int not null primary key AUTO_INCREMENT,
    naziv varchar(50)
);


create table sastojak(
    sifra int not null primary key,
    naziv varchar(50)
    
);


create table chef(
    sifra int not null primary key,
    ime varchar(50),
    prezime varchar(50),
    razina varchar(50)
);

create table recept(
    sifra int not null primary key,
    naziv varchar(50)  not null,
    opis varchar(5000) not null,
    vrijeme_izrade varchar(50),
    chef int
);

create table normativ(
    sifra int not null primary key,
    recept int,
    sastojak int,
    jedinica_mjere int,
    kolicina decimal(4,2)
    
);


create table korisnik(
sifra int not null primary key auto_increment=1,
email varchar(50),
pass varchar(50)
);






#veze između tablica
#alter table  add foreign key () references (sifra);


alter table normativ add foreign key (recept) references recept(sifra);
alter table normativ add foreign key (sastojak) references sastojak(sifra);

alter table recept add foreign key (chef) references chef(sifra);
alter table normativ add foreign key (jedinica_mjere) references jedinica_mjere(sifra);






#slijedi alter table niz naredbi radi novog unosa tablica sa vrijednostima.
#slijedi drop table niz naredbi radi brisanja tablica i novog unosa tablica sa vrijednostima. inače se unos radi za vrijeme kreiranja tablice

#odabrati atribut za jedinica_mjere

#alter table ***** change sifra sifra int not null;

#drop table recept;
#drop table normativ;
#drop table sastojak;
#drop table jedinica_mjere;
#drop table chef;

#recept
#pokušati staviti vrijeme izrade na varchar
#što napraviti sa atributom chef?!
#kako napraviti escape sign


#jedinica_mjere


insert into jedinica_mjere(naziv)
            values('kg'),
                  ('l'),
                  ('kom');




# sastojak

insert into sastojak(sifra, naziv)
            values(1, 'Tjestenina'),
                  (2, 'Jaja'),
                  (3, 'Maslac'),
                  (4,'Slanina'),
                  (5, 'Cesnjak'),
                  (6, 'Chili'),
                  (7, 'Maslinovo ulje'),
                  (8, 'Passata'),
                  (9, 'Sol'),
                  (10, 'Papar'),
                  (11, 'Kadulja'),
                  (12, 'Grah'),
                  (13, 'Pinjoli'),
                  (14, 'Bademi'),
                  (15, 'Bosiljak'),
                  (16, 'Parmezan'),
                  (17, 'Pesto'),
                  (18, 'Tijesto'),
                  (19, 'Svinjska mast'),
                  (20, 'Rajcica'),
                  (21, 'Brasno'),
                  (22, 'Mozzarella'),
                  (23, 'Ulje'),
                  (24, 'Mljeveno meso'),
                  (25, 'Luk'),
                  (26, 'Gouda sir'),
                  (27, 'Pecivo'),
                  (28, 'Senf'),
                  (29, 'Krastavac'),
                  (30, 'Rukola'),
                  (31, 'Tunjevina'),
                  (32, 'Limun'),
                  (33, 'Krumpir'),
                  (34, 'Ruzmarin')
                  ;

#chef

#Zar je zbilja potrebno tri puta unositi istog chefa?

insert into chef(sifra, ime, prezime, razina)
            values(1, 'Gennaro', 'Contaldo', 'Head Chef');

insert into chef(sifra, ime, prezime, razina)
            values(2, 'Gordon', 'Ramsay', 'Executive Chef');
    
insert into chef(sifra, ime, prezime, razina)
            values(3, 'Heston', 'Blumenthal', 'Head Chef');






#recept

#1.Carbonara
insert into recept(sifra, naziv, opis, vrijeme_izrade, chef)
            values(1,'Carbonara', '1. Skuhati tjesteninu, 2. Narezati slaninu i staviti u posudu sa malo maslinovog ulja i maslaca,
             3. U drugoj posudi pomijesati tri zumanjka i jedno cijelo jaje,
             4. Dodati tjesteninu u posudu sa slaninom i preliti sa jajima, 5. Lagano promjesati', '20 min', 1 );
#2.Cannelini
insert into recept(sifra, naziv, opis, vrijeme_izrade, chef)
            values(2, 'Cannelini all ucelleto', '1. Rukom zgnjecite cesnjak, narezite chili i ubacite u tavu, zatim dodajte maslinovo ulje i passatu
            . kuhajte 5 min i po potrebii dodajte sol i papar. dodajte i 5 listica kadulje. 2. Dodajte grah u tavi i lagano mjesajte. 3. Na drugoj tavi
         przite slaninu', '15min', 1);
#3.Pesto
insert into recept(sifra, naziv, opis, vrijeme_izrade, chef)
            values(3, 'Hey pesto!', '1. Stavite kuhati tjesteninu. 2. Dok se tjestenina kuha u blender ubacite cesnjak i saku pinjola ili badema. Kada 
            sameljete dodajte rukohvat bosiljka, malo soli i papra te maslinovog ulja po zelji. nakon toga dodajte i parmezan sir 3. Pesto prelijte
             preko tjestenine', '15min', 1);
#4.Pizza Margherita
insert into recept(sifra, naziv, opis, vrijeme_izrade, chef)
            values(4, 'Pizza Margherita', '1. Uzmite saku brasna i rasporedite po stolu. Dodajte svjeze tijesto za pizzu i razvucite ga. 2. Stavite malo maslinovog ulja na sredinu tijesta i dodajte passatu. Ravnomjerno rasporedite. 4. Dodajte parmezan i rasporedite po cijeloj površini, zatim natrgajte listiće bosiljka i mozzarellu. 5. Na kraju dodajte rajcicu i maslinovo ulje. 6. pecite na 220 stupnjeva u prethodno zagrijanoj pecnici na 10min', '20min', 1);


#5.All American Burger
insert into recept(sifra, naziv, opis, vrijeme_izrade, chef)
            values(5, 'All American Burger', '1. U tavu dodajte malo ulja i zagrijte. Zatim dodajte mljeveno govede meso i zacinite sa malo soli i papra. 2. Dodajte maslac radi boljeg okusa i luk narezan na ploske. Burger pecite po 2 min na svakoj strani. samo jednom okrenite. 3. Ugasite vatru na stednjaku i dodajte dva listica sira. Ponovo zacinite sa soli i paprom. 4. Na kvalitetno pecivo stavite malo senfa, racicu i krastavac narezan na ploskice. Zatim dodajte meso sir i luk', '15min', 2);

#6. Tuna Sphagetti
insert into recept(sifra, naziv, opis, vrijeme_izrade, chef)
            values(6, 'Tuna Sphagetti', '1. Skuhati sphagette. 2. U tavu dodati nasjeckani cenjak i cetvrtinu chillija. Zagrijati na maslinovom ulju i dodati malo tune. 3. Izvadite dio skuhane tjestenine na tavu i mjesajte da se stopi sa svim drugim sastojcima. 4. Ugasite vatru i dodajte jednu nasjeckanu rajcicu, malo rukole i parmezana. 5. Iscjedite malo limuna' , '20min', 1);

#7. Blumenthals Roast Potatoes
insert into recept(sifra, naziv, opis, vrijeme_izrade, chef)
            values(7, 'Blumenthals Roast Potatoes', '1. Ogulite krumpir i narezite ga na kriske, dobro isperite da se makne skrob. 2. Stavite kuhati u vodu bez soli dok se krumpir ne pocne raspadati. 3. Oprezno izvadite krimpir na resetku da se ne raspadne i pricekajte dok se ne rashladi i otvrdne. 4. U tacnu dodajte obilnu kolicinu maslinovog ulja i svinjske masti. Zagrijte tacnu da se otopoi mast i dodajte krumpire. Lagano promjesajte da se krumpiri ne raspadnu te zatim stavite u pecnicu. Ovisno o vrsti krumpira pecite na 50 min ili cak do 90 min. Kada mislite da su krumpiri dobili zadovoljavajucu boju izvadite iz pecnice i dodajte ruzmarin i nekoliko komada csenjaka. OPet stavite u pecnicu na 20 min', '120min', 3 );


#normativ
#obrnuti redosljed!!!!!
insert into normativ(sifra, recept, sastojak, jedinica_mjere, kolicina)
            values(1, 1, null, null, '0.5');

insert into normativ(sifra, recept, sastojak, jedinica_mjere, kolicina)
            values(2, 2, null, null, '0.5');

insert into normativ(sifra, recept, sastojak, jedinica_mjere, kolicina)
            values(3, 3, null, null, '0.5');

insert into normativ(sifra, recept, sastojak, jedinica_mjere, kolicina)
            values(4, 4, null, null, '0.5');

insert into normativ(sifra, recept, sastojak, jedinica_mjere, kolicina)
            values(5, 5, null, null, '0.5');

insert into normativ(sifra, recept, sastojak, jedinica_mjere, kolicina)
            values(6, 6, null, null, '0.5');

insert into normativ(sifra, recept, sastojak, jedinica_mjere, kolicina)
            values(7, 7, null, null, '0.5');

















