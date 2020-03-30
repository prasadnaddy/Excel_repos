import pyodbc                                   #Module to work with databases
import pandas                                   #Module for working with excel
import json                                     #Writing or reading json

import collections



ctr=0                   
def read_excel_pandas():                                                    #Function to read excel file using pandas
    converters = {col: str for col in (0,1,2,3,4,5,6,7,8,9,10,11)}       #Converting every column to a string
    # excel_data_df = pandas.read_excel('SheetNew.xlsx', sheet_name='Sheet1', converters=converters)  #Reading excel and then adding converters
    excel_data_df = pandas.read_excel('03262020.xlsx', sheet_name='03262020', converters=converters) 
    json_str = excel_data_df.to_json()
    json_str = excel_data_df.to_json(orient='records')                          #Converting the Data in excel to a JSON format
    
    with open("dbJSON.json", "w", encoding="utf-8") as writeJsonfile:            #Writing the JSON Data into the file
        writeJsonfile.write(json_str)  
    
    df = pandas.read_json (r'dbJSON.json')
    # with open("dbJSON.json", "r", encoding="utf-8") as readJsonfile:
    #     readJsonfile.read(json_str)
    json_str=json.loads(json_str)
    df = pandas.DataFrame(json_str)
    lenjson_str=len(json_str)
    
    records=json_str[0:lenjson_str]
    # print(records[0])
    fICDCode=claimID=""
    total=[]
    numbers=[]
    primarycodeslist=[]
    res_dict=[]
    for i in records:
        claimID=claimID+(str(i['ClaimID'])+',')
        claimIDList=list(claimID.split(','))
        
        fICDCode=(str(i['ICDCodes(s)']).strip())
        fICDCodeList=list(fICDCode.split(','))                  #Reading individual ICD Codes and then adding them to a separate List
        total.append(fICDCodeList)
            
        
        PrimaryCode=fICDCodeList[-1]
        primarycodeslist.append(PrimaryCode)                        #Primary Codes ICD List
        # print(PrimaryCode)
        
    for i in range(1,len(total)+1):
        numbers.append(str(i))
        
    df['PrimaryICD']=primarycodeslist
    print(df)
        
    export_csv = df.to_excel (r'testExcel.xlsx', index = None, header=True)             #Appending an extra column in excel
    
# read_excel_pandas()

def final_conversion_to_csv():
    converters = {col: str for col in (0,1,2,3,4,5,6,7,8,9,10,11)} 
    excel_data_df = pandas.read_excel('testExcel.xlsx', sheet_name='Sheet1', converters=converters) 
    json_str1 = excel_data_df.to_json()
    json_str1 = excel_data_df.to_json(orient='records')                          #Converting the Data in excel to a JSON format
    
    with open("dbJSON.json", "w", encoding="utf-8") as writeJsonfile:            #Writing the JSON Data into the file
        writeJsonfile.write(json_str1)  

# final_conversion_to_csv()

def insert_into_db():                                                           #Function to work on DB operations
    centerID="1000"
    userID="1"                                                                  #Hard coding the static values for CENTERID and USERID
    try:
        conn = pyodbc.connect('Driver={SQL Server};'                            #Connecting to DB
        'Server=183.83.217.150,35001;' 
        'Database=CLAIMS;'
        'uid=unityAppUser;pwd=Winter@2019')
            
    except:
        print("The connection to the DB failed")
        
    cursor=conn.cursor()
    
    with open("dbJSON.json", "r", encoding="utf-8") as readJsonfile:
        responseJson=json.load(readJsonfile)                                    #Reading the file containing the JSON Data
    
    for i in responseJson:
        jsonData=json.dumps(i)                                                  #Fetching the individual Dictionary values with "i"
        cursor.execute("EXEC spAddUnityClaimsFactCSV2020 @centerid=?, @userid=?, @json=?",(centerID, userID,jsonData))
        conn.commit()
        
    print("Written data to the database successfully!!")


# insert_into_db()
