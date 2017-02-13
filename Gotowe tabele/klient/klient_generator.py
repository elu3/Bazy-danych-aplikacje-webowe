import random

def losowe_osoba_id():
	return random.randint(1, 100000)

def losowe_id_firmy():
	return random.randint(1, 50000)


liczba_kolumn = 100000
#tytul = "klient_id, osoba_id, firma_id, staly_klient, czarna_lista,"

nr_pracownikow = random.sample(range(1, 10000), 1000)

for i in range(1, liczba_kolumn+1):
	if not i in nr_pracownikow:
		print "(\"{}\", \"{}\", null, \"false\", \"false\"),".format(i,i) 
	else: 
		print "(\"{}\", \"{}\", \"{}\", \"false\", \"false\"),".format(i,i, losowe_id_firmy())