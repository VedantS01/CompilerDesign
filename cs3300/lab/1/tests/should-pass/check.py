import os

files = [f for f in os.listdir('.') if os.path.isfile(f)]
print (files)

for f in files:
	print (f)
	os.system('../A1 <' + f + ' >out/'+f)