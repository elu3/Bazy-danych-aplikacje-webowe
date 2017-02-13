import random

def losowy_wiersz(nr):
	wiersz = [nr,0,0,0,0,0,0]
	losowa_pozycja = random.randint(1, 6)
	wiersz[losowa_pozycja] = 1
	return wiersz


liczba_kolumn = 100000
tytul = "status_id,wstepna,potwiedzona,zaliczka,oplacona,zameldowany,wymeldowany"
print tytul

for i in range(1, liczba_kolumn+1):
	print "({},\"{}\",\"{}\",\"{}\",\"{}\",\"{}\",\"{}\"),".format(*losowy_wiersz(i))