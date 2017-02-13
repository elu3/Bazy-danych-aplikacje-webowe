#Route Between Nodes
graph = {
'adres' : [],
'czarna_lista' : ['klient'],
'dane_firmy' : [],
'dane_osobowe' : ['adres'],
'klient' : ['dane_firmy', 'dane_osobowe'],
'platnosc': [],
'pokoj': ['typ_pokoju'],
'pracownik': ['uprawnienia','dane_osobowe'],
'rezerwacja': ['klient','platnosc','pokoj','pracownik','status_rezerwacji','usluga'],
'stali_klienci': ['klient'],
'status_rezerwacji': [],
'typ_pokoju' : [],
'uprawnienia' : [],
'usluga' : []
}

# 'A': ['B', 'C', 'E'], 'D': ['E'], 'E': ['F'], 'F': ['C','D']

visited = set()

def dfs_visited(key):
	global graph, visited
	#set black
	visited.add(key)
	#not necessay to have a base case
	#but need to check the key exist or not
	if key not in graph:
		print key
		return

	for adjacent in graph[key]:
		if adjacent not in visited:
			dfs_visited(adjacent)
	print key




def DFS():
	global graph, visited
	#iterate through all the elements
	for key in graph:
		if key not in visited:
			dfs_visited(key)

DFS()
