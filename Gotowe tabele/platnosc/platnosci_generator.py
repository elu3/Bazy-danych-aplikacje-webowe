import random

nazwiska = []

def wczytaj_dane():
	global nazwiska
	nazwiska = open('MockData/surnames.txt').read().splitlines()

def losowe_nazwisko():
	global nazwiska
	return random.choice(nazwiska)

def losowy_tytul():
	return losowe_nazwisko() + "_" + str(random.randint(10,421)) + "_pay"

wczytaj_dane()
liczba_kolumn = 1000000

for i in range(1, liczba_kolumn+1):
	print "({}, \"{}\", \"{}\"),".format(i, losowy_tytul(), random.randint(50,400))