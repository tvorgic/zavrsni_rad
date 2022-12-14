# ljestve (hash) je komentar i on se ne izvodi
# Izvođenje naredbi na serveru
# Otvoriti CMD
# Zaljepiti sljedeću naredbu bez prvog hash znaka
# c:\xampp\mysql\bin\mysql -uroot < C:\Users\Tonko\Documents\edunovapp26\SQL\vjezbe\sql_vjezbe\knjiznica.sql
# c:\xampp\mysql\bin\mysql -uroot < C:\Users\Tonko\Documents\edunovapp26\SQL\vjezbe\sql_vjezbe\kuharica.sql

drop database if exists kuharica;
##Klijent pokrenuti s --default-character-set=utf8 
create database kuharica DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci;
use kuharica;

create table recept(
    sifra int not null primary key,
    naziv varchar(50) not null,
    opis varchar(50) not null,
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

create table jedinica_mjere(
    sifra int not null primary key,
    naziv varchar(50)
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

insert into recept(sifra, naziv, opis, vrijeme_izrade, chef)
            values(1,'Carbonara', '1. Skuhati tjesteninu, 2. Narezati slaninu i staviti u posudu sa malo maslinovog ulja i maslaca,
             3. U drugoj posudi pomijesati tri zumanjka i jedno cijelo jaje,
             4. Dodati tjesteninu u posudu sa slaninom i preliti sa jajima, 5. Lagano promjesati', '20 min', null );

insert into recept(sifra, naziv, opis, vrijeme_izrade, chef)
            values(2, 'Cannelini all ucelleto', '1. Rukom zgnjecite cesnjak, narežite chili i ubacite u tavu, zatim dodajte maslinovo ulje i passatu
            . kuhajte 5 min i po potrebii dodajte sol i papar. dodajte i 5 listica kadulje. 2. Dodajte grah u tavi i lagano mjesajte. 3. Na drugoj tavi
         przite slaninu', '15min', null);

insert into recept(sifra, naziv, opis, vrijeme_izrade, chef)
            values(3, 'Hey pesto!', '1. Stavite kuhati tjesteninu. 2. Dok se tjestenina kuha u blender ubacite cesnjak i saku pinjola ili badema. Kada 
            sameljete dodajte rukohvat bosiljka, malo soli i papra te maslinovog ulja po zelji. nakon toga dodajte i parmezan sir 3. Pesto prelijte
             preko tjestenine', '15min', null);


#normativ
#obrnuti redosljed!!!!!
insert into normativ(sifra, recept, sastojak, jedinica_mjere, kolicina)
            values(1, 1, null, null, '0.5');

insert into normativ(sifra, recept, sastojak, jedinica_mjere, kolicina)
            values(2, 2, null, null, '0.5');

insert into normativ(sifra, recept, sastojak, jedinica_mjere, kolicina)
            values(3, 3, null, null, '0.5');


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
                  (17, 'Pesto')
                  ;

#chef

#Zar je zbilja potrebno tri puta unositi istog chefa?

insert into chef(sifra, ime, prezime, razina)
            values(1, 'Gennaro', 'Contaldo', 'Head Chef');

insert into chef(sifra, ime, prezime, razina)
            values(2, 'Gennaro', 'Contaldo', 'Head Chef');

insert into chef(sifra, ime, prezime, razina)
            values(3, 'Gennaro', 'Contaldo', 'Head Chef');




#jedinica_mjere


insert into jedinica_mjere(sifra, naziv)
            values(1, 'kg'),
                  (2, 'l'),
                  (3, 'kom');








