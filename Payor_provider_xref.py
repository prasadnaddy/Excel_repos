import pyodbc
import json

try:
    conn = pyodbc.connect('Driver={SQL Server};' 
    'Server=183.83.217.150,35001;' 
    'Database=CLAIMS;'
    'uid=unityAppUser;pwd=Winter@2019')
            
except:
    print("The connection to the DB failed")
    
command1= ("SELECT ExtProviderID, Abbr FROM [CLAIMS].[UNITY].[Provider_Dim];")
command2=("SELECT PayerID,Name FROM [CLAIMS].[UNITY].[Payer_Dim];")

cursor1= conn.cursor().execute(command1)


# df=sql.read_sql('select * from UNITY.CLAIMS_Fact2020',conn)

# df.to_excel('DATA_FROM_DB_TO_EXCEL.xlsx', index=False)

results1 = []
results2= []

columns1 = [column1[0] for column1 in cursor1.description]      #Fetching the column headers

for row1 in cursor1.fetchall():
    results1.append(dict(zip(columns1,row1)))                  #Key -> Col Header and value is the Table row Values

with open("Provider_Xref.json", "w", encoding="utf-8") as writeJsonfile1:
    json.dump(results1, writeJsonfile1, indent=4,default=str)
    
conn.close()

try:
    conn = pyodbc.connect('Driver={SQL Server};' 
    'Server=183.83.217.150,35001;' 
    'Database=CLAIMS;'
    'uid=unityAppUser;pwd=Winter@2019')
            
except:
    print("The connection to the DB failed")


cursor2= conn.cursor().execute(command2)

columns2 = [column2[0] for column2 in cursor2.description]      #Fetching the column headers

 
    
for row2 in cursor2.fetchall():
    results2.append(dict(zip(columns2,row2)))                  #Key -> Col Header and value is the Table row Values

with open("Payer_Xref.json", "w", encoding="utf-8") as writeJsonfile2:
    json.dump(results2, writeJsonfile2, indent=4,default=str) 
    

