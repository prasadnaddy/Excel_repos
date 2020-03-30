import xlrd                                     #Module to work on excel files
from collections import OrderedDict             #Module for converting data into an OrderedDict format
import json                                     #Module to convert the data to JSON

book = xlrd.open_workbook("names.xlsx")                                     #Opening the excel file and storing the details in "book"
sheet = book.sheet_by_index(0)                                              #Getting the first worksheet of the excel file

column_headers=[]
rows=[]
json_result=[]                                   #List that contains the JSON format of all rows and columns

def read_excel():
    
    #Fetching the individual Column Headers and Rows into Column_headers and Rows lists
    sheet.cell_value(0, 0) 
                                                             
    for i in range(sheet.ncols): 
        column_headers.append(sheet.cell_value(0, i))                           #Getting the column headers
    
    for i in range(1,sheet.nrows):
        rows.append(sheet.row_values(i))                                        #Getting the rows
        
def convert_to_json():
    
    #Iterate through each row in worksheet and fetch values into dict
    for rownum in range(1, sheet.nrows):
        data = OrderedDict()
        row_values = sheet.row_values(rownum)
        data['EMPID'] = row_values[0]
        data['FirstName'] = row_values[1]
        data['LastName'] = row_values[2]
        data['CTC'] = row_values[3]
        json_result.append(data)                                                #adding the dictionary to JSON_RESULTS

    with open("data1.json", "w", encoding="utf-8") as writeJsonfile:
        json.dump(json_result, writeJsonfile, indent=4,default=str)             #Writing the file as JSON Format
        
        
read_excel()
convert_to_json()
    





