liczba_osob = 100000

# recepcjonista	70
# kierownik	10
# wlasciciel	2
# administrator	1
# klient 100000 - 70 - 10 - 2 - 1

# (`pracownik_id`, `osoba_id`, `aktywne`, `uprawnienia_id`)

for i in range(1, 85):
	print "({}, {}, 0, {})".format(i,i,i)