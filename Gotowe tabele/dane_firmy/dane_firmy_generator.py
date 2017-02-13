import random

firmy = []
emaile = []

def wczytaj_dane():
	global firmy, emaile
	firmy = open('MockData/companies.txt').read().splitlines()
	emaile = open('MockData/emails.txt').read().splitlines()

def losowa_firma():
	global firmy
	return random.choice(firmy)

def losowy_nip():
	return random.randint(1111111111, 9999999999)

def losowy_adres_id():
	return random.randint(1, 100000)

def losowy_nr_telefonu():
	return random.randint(111111111, 999999999)

def losowy_email():
	global emaile
	return random.choice(emaile)


def losowy_wiersz(nr):
	return [nr, losowa_firma(), losowy_nip(), losowy_adres_id(), losowy_nr_telefonu(), losowy_email()]

liczba_kolumn = 50000
wczytaj_dane()
tytul = "firma_id, nazwa, NIP, adres_id, numer_telefonu, email"
print tytul

for i in range(1, liczba_kolumn+1):
	print "(\"{}\", \"{}\", \"{}\", \"{}\", \"{}\", \"{}\"),".format(*losowy_wiersz(i))


