import random

ulice = []
miasta = []
kraje = []

def wczytaj_dane():
	global ulice, miasta, kraje
	ulice = open('MockData/streets.txt').read().splitlines()
	miasta = open('MockData/cities.txt').read().splitlines()
	kraje = open('MockData/countries.txt').read().splitlines()

def losowa_ulica():
	global ulice
	return random.choice(ulice)

def losowy_nr_mieszkania():
	return random.randint(1,50)

def losowy_nr_domu():
	return random.randint(1,10)

def losowa_miejscowosc():
	global miasta
	return random.choice(miasta)

def losowy_kraj():
	global kraje
	return random.choice(kraje)

def losowy_wiersz(nr):
	wiersz = [nr,losowa_ulica(),losowy_nr_domu(),losowy_nr_mieszkania(),losowa_miejscowosc(), losowy_kraj()]
	return wiersz


liczba_kolumn = 100000
wczytaj_dane()
tytul = "INSERT INTO `adres` (`adres_id`,`ulica`,`nr_domu`,`nr_mieszkania`,`miejscowosc`,`kraj`) VALUES"
print tytul

for i in range(1, liczba_kolumn+1):
	print "(\"{}\",\"{}\",\"{}\",\"{}\",\"{}\",\"{}\"),".format(*losowy_wiersz(i))


