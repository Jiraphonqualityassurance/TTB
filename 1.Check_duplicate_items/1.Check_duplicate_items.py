list_A = [1, 2, 3, 5, 6, 8, 9]
list_B = [3, 2, 1, 5, 6, 0]

duplicate_list = list(set(list_A) & set(list_B))

print(duplicate_list)
