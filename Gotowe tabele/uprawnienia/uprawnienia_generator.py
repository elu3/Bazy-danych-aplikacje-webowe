liczba_osob = 100000

# recepcjonista	70
# kierownik	10
# wlasciciel	2
# administrator	1
# klient 100000 - 70 - 10 - 2 - 1

for i in range(1, 1+70):
	print "({}, 1, 1, 0, 0, 0),".format(i)

for i in range(71, 71+10+1):
	print "({}, 1, 0, 1, 0, 0),".format(i)

print "(82, 1, 0, 0, 1, 0),"
print "(83, 1, 0, 0, 1, 0),"
print "(84, 1, 0, 0, 0, 1),"

for i in range(85, liczba_osob+1):
	print "({}, 1, 0, 0, 0, 0),".format(i)