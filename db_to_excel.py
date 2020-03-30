import pyodbc,json
import pandas.io.sql as sql

try:
    conn = pyodbc.connect('Driver={SQL Server};' 
    'Server=183.83.217.150,35001;' 
    'Database=CLAIMS;'
    'uid=unityAppUser;pwd=Winter@2019')
            
except:
    print("The connection to the DB failed")
    
command= ("SELECT * FROM UNITY.CLAIMS_Fact2020;")

cursor= conn.cursor().execute(command)

# df=sql.read_sql('select * from UNITY.CLAIMS_Fact2020',conn)

# df.to_excel('DATA_FROM_DB_TO_EXCEL.xlsx', index=False)

results = []

columns = [column[0] for column in cursor.description]      #Fetching the column headers

for row in cursor.fetchall():
    results.append(dict(zip(columns,row)))                  #Key -> Col Header and value is the Table row Values

with open("DB_TO_JSON.json", "w", encoding="utf-8") as writeJsonfile:
    json.dump(results, writeJsonfile, indent=4,default=str) 
