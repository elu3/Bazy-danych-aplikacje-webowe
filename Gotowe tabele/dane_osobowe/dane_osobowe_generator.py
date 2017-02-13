import random

imiona = []
nazwiska = []
emaile = []

def wczytaj_dane():
	global imiona, nazwiska, emaile
	imiona = open('MockData/names.txt').read().splitlines()
	nazwiska = open('MockData/surnames.txt').read().splitlines()
	emaile = open('MockData/emails.txt').read().splitlines()

def losowe_imie():
	global imiona
	return random.choice(imiona)

def losowe_nazwisko():
	global nazwiska
	return random.choice(nazwiska)

def losowy_pesel():
	return random.randint(11111111111, 99999999999)

def losowy_adres_id():
	return random.randint(1, 100000)

def losowy_nr_telefonu():
	return random.randint(111111111, 999999999)

def losowy_email():
	global emaile
	return random.choice(emaile)


def losowy_wiersz(nr):
	return [nr, losowe_imie(), losowe_nazwisko(), losowy_pesel(), nr, losowy_nr_telefonu(), losowy_email()]

liczba_kolumn = 100000
wczytaj_dane()
tytul = "osoba_id, imie, nazwisko, PESEL, adres_id, numer_telefonu, email"
print tytul

for i in range(1, liczba_kolumn+1):
	print "(\"{}\", \"{}\", \"{}\", \"{}\", \"{}\", \"{}\", \"{}\"),".format(*losowy_wiersz(i))


