import requests,json

f= open("ClaimsApiResponse.json","w") 
f.close()                                       #Truncating the contents of the file before appending the new JSON values

def generate_api():
    
    with open("DB_TO_JSON.json", "r", encoding="utf-8") as readJsonfile:
        responseJson=json.load(readJsonfile)
        
    for i in responseJson:
        BatchID=str(i['BatchID'])
        CENTERID=str(i['CENTERID'])
        Record=i['Record']
        TimeStamp=i['Timestamp']
        UserID=i['UserID']
        ClaimID=i['ClaimID']
        MRN=i['MRN']
        PredictionFlag="0"
        PayerID=i['Payer']
        ServiceDate=i['ServiceDate']
        PROCode=i['PROCode']
        Modifiers=i['Modifiers']
        ICDCodes=i['ICDCodes']
        ServiceFee=i['ServiceFee']
        ServiceUnits=i['ServiceUnits']
        ServicePlaceID=i['ServicePlaceID']
        ClaimLine="NULL"
        DOB="NULL"
        Gender="NULL"
        RelationshipToSubscriber="0"
        PrimaryICD=i['PrimaryICD']
        ProviderID=i['ProviderID']
        ReasonCode="NULL"
        
        # url = "https://ussouthcentral.services.azureml.net/workspaces/434433848c634f59a857c8281d9f0886/services/9f4fdf9fd3384d399d5ad4c78d438123/execute?api-version=2.0&details=true"
        url="https://ussouthcentral.services.azureml.net/workspaces/434433848c634f59a857c8281d9f0886/services/ea16602e8d0642aa87698682e65b12f5/execute?api-version=2.0&details=true"
        data={
     "Inputs": {
        "input1": {
        "ColumnNames": [
            "BatchID",
            "CENTERID",
            "Record",
            "Timestamp",
            "UserID",
            "ClaimID",
            "MRN",
            "PredictionFlag",
            "PayerID",
            "ServiceDate",
            "PROCode",
            "Modifiers",
            "ICDCodes",
            "ServiceFee",
            "ServiceUnits",
            "ServicePlaceID",
            "ClaimLine",
            "DOB",
            "Gender",
            "RelationshipToSubscriber",
            "PrimaryICD",
            "ProviderID",
            "ReasonCode",
            "ProcessedFlag",
            "PriorAuthFlag",
            "CredentialingFlag",
            "PolicyFlag",
            "RulesFlag",
            "PolicyList",
            "RulesList",
            "PredictionReason",
            "PredictionCode",
            "Comments",
            "RemarkCode"
        ],
        "Values": [
            [
            BatchID,
            CENTERID,
            "1",
            "20200000000000",
            "1",
            "3401710",
            "25000",
            "0",
            PayerID,
            "02-01-2019",
            "99213",
            "NULL",
            "E66.01,I10",
            "141",
            "1",
            "50",
            "142823",
            "NULL",
            "M",
            "0",
            "E66.01",
            ProviderID,
            "NULL",
            "0",
            "NULL",
            "NULL",
            "NULL",
            "NULL",
            "NULL",
            "NULL",
            "NULL",
            "NULL",
            "NULL",
            "NULL"
            ]
            
        ]
        }
    },
    "GlobalParameters": {}
    }
       
        
        headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer pi0N2rSVBzT/s8Fj8fcaVehUn6LQVs2woInCsQlt5UkjUbnb+dAuU4gXb+CThkzhhtd6Y8rRJHoLvXquZtWGuQ=='
        }

        response = requests.request("POST", url, headers=headers, json=data)

        response = json.loads(response.text)

        with open("ClaimsApiResponse.json", "a", encoding="utf-8") as writeJsonfile:
            json.dump(response, writeJsonfile, indent=4)
generate_api()


