import mysql.connector
import os.path
from subprocess import call
cnx = mysql.connector.connect(user='root',password='bahmscp',host='127.0.0.1',database='naofode')
cursor = cnx.cursor()
cursor.execute("select code,slices,original_url from thrash where image_owner_id is null and image_storage_base='prints/'")

def regen(code,original_url,slices=None):
	print("regen", code, slices)
	if slices == None:
		call(["./capture.sh", original_url + " prints/" + code + ".png"])
	else:
		print(["./slice.sh", "prints/%s.png %d" % (code, slices)]) 
		call(["./slice.sh", "prints/%s.png %d" % (code, slices)])

for (code,slices,original_url) in cursor:
	code = code.encode('ascii', 'ignore')
	if (not os.path.isfile("prints/"+code+".png")):
		regen(code,original_url)
	for i in range(0,slices):
		if not os.path.isfile("prints/%s_%i.png" % (code, i)):
			regen(code,original_url,slices)
			break
cursor.close()
cnx.close()
