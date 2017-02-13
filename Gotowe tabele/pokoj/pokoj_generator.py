import random

def losowy_typ_pokoju():
	return random.randint(1, 10)


liczba_kolumn = 100

for i in range(1, liczba_kolumn+1):
	print "({}, {}),".format(i, losowy_typ_pokoju())