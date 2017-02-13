import random
import datetime


dane_osobowe = []

def wczytaj_dane():
	global dane_osobowe
	dane_osobowe = open('dane_osobowe.csv').read().splitlines()

def losowe_dane_klienta():
	global dane_osobowe
	return random.choice(dane_osobowe)

def losowa_usluga():
	return random.randint(1,9)

def losowy_pracownik_id():
	return random.randint(1,84)

def losowe_daty():
	startdate=datetime.date(2012,01,01)
	od = startdate+datetime.timedelta(random.randint(1,365*5))
	do = od + datetime.timedelta(random.randint(1,3))
	return [od,do]

def losowy_status_id():
	return random.randint(1, 100000)

def losowa_kwota_zaliczki():
	return random.randint(1,200)

def losowy_platnosc():
	return random.randint(1, 1000000)

def losowy_pokoj():
	return random.randint(1,100)


liczba_kolumn = 180000
wczytaj_dane()
tytul = "INSERT INTO `rezerwacja` (`rezerwacja_id`, `imie`, `nazwisko`, `klient_id`, `pokoj_id`, `platnosc_id`, `kwota_zaliczki`, `status_id`, `data_rezerwacji`, `rezerwacja_od`, `rezerwacja_do`, `usluga_id`, `pracownik_id`, `rezerwacja_grupowa_id`, `imie_rezerwujacego`, `nazwisko_rezerwujacego`) VALUES"
print tytul

for i in range(1, liczba_kolumn+1):
	data = losowe_daty()
	klient = losowe_dane_klienta().split(",")
	print "({}, {}, {}, {}, \"{}\", \"{}\", \"{}\", \"{}\", \"{}\", \"{}\", \"{}\", {}, {}, null, null, null),".format(i, klient[1], klient[2], klient[0], losowy_pokoj(), losowy_platnosc(), losowa_kwota_zaliczki(), losowy_status_id(), data[0], data[0], data[1], losowa_usluga(), losowy_pracownik_id())



