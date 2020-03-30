-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

DROP TABLE [UNITY].[Vitals_Fact];
GO


DROP TABLE [UNITY].[UDS_Visual_Dim];
GO


DROP TABLE [UNITY].[UDS_StatYear_Xref];
GO


DROP TABLE [UNITY].[UDS_ResultMaster];
GO


DROP TABLE [UNITY].[UDS_ReasonCode_Dim];
GO


DROP TABLE [UNITY].[UDS_Procedure_Xref];
GO


DROP TABLE [UNITY].[UDS_MeasureYear_Xref];
GO


DROP TABLE [UNITY].[UDS_Measure_Dim];
GO


DROP TABLE [UNITY].[UDS_Index_Dim];
GO


DROP TABLE [UNITY].[UDS_ICD10_Xref];
GO


DROP TABLE [UNITY].[UDS_Dim];
GO


DROP TABLE [UNITY].[UDS_Center_Dim];
GO


DROP TABLE [UNITY].[TELEH_];
GO


DROP TABLE [UNITY].[SexualOrientation_sDim];
GO


DROP TABLE [UNITY].[SCHEDULE_Fact];
GO


DROP TABLE [UNITY].[RemarkCode_Dim];
GO


DROP TABLE [UNITY].[ReasonCode_Dim];
GO


DROP TABLE [UNITY].[Race_sDim];
GO


DROP TABLE [UNITY].[Provider_Dim];
GO


DROP TABLE [UNITY].[Procedures_Fact];
GO


DROP TABLE [UNITY].[PROCCode_Dim];
GO


DROP TABLE [UNITY].[Payer_Dim];
GO


DROP TABLE [UNITY].[PatientMaster_Dim];
GO


DROP TABLE [UNITY].[Medications_Fact];
GO


DROP TABLE [UNITY].[Language_sDim];
GO


DROP TABLE [UNITY].[LabResults_Fact];
GO


DROP TABLE [UNITY].[Immunizations_Fact];
GO


DROP TABLE [UNITY].[ICD910_Xref];
GO


DROP TABLE [UNITY].[ICD9_Dim];
GO


DROP TABLE [UNITY].[ICD10_Dim];
GO


DROP TABLE [UNITY].[History_Fact];
GO


DROP TABLE [UNITY].[HCPCS_Dim];
GO


DROP TABLE [UNITY].[HCPCS_CPT_Xref];
GO


DROP TABLE [UNITY].[GenderIdentity_sDim];
GO


DROP TABLE [UNITY].[Ethnicity_sDim];
GO


DROP TABLE [UNITY].[Encounters_Fact];
GO


DROP TABLE [UNITY].[Diagnosis_Fact];
GO


DROP TABLE [UNITY].[CPT_Dim];
GO


DROP TABLE [UNITY].[CohortPatient_Xref];
GO


DROP TABLE [UNITY].[Cohort_Dim];
GO


DROP TABLE [UNITY].[CLAIMS_Fact];
GO


DROP TABLE [UNITY].[BAM_Questions_Dim];
GO


DROP TABLE [UNITY].[BAM_QAnswers_sDim];
GO


DROP TABLE [UNITY].[BAM_Patient_Answers];
GO


DROP TABLE [UNITY].[AlertPatient_Xref];
GO


DROP TABLE [UNITY].[Alert_Dim];
GO


-- ************************************** [UNITY].[Vitals_Fact]

CREATE TABLE [UNITY].[Vitals_Fact]
(
 [Year]               nvarchar(4) NOT NULL ,
 [CENTERID]           int NOT NULL ,
 [Record]             int IDENTITY (1, 1) NOT NULL ,
 [Date]               date NOT NULL ,
 [MRN]                nvarchar(20) NOT NULL ,
 [EncounterID]        nvarchar(30) NULL ,
 [ProviderID]         nvarchar(10) NULL ,
 [System]             nvarchar(25) NULL ,
 [UserID]             int NULL ,
 [Timestamp]          bigint NULL ,
 [Comments]           nvarchar(max) NULL ,
 [VitalCode]          nvarchar(20) NULL ,
 [Temp]               decimal(18,0) NULL ,
 [TempUnit]           nvarchar(10) NULL ,
 [BPSystolic]         int NULL ,
 [BPDiastolic]        int NULL ,
 [Pulse]              int NULL ,
 [PulsePattern]       nvarchar(100) NULL ,
 [RespirationRate]    int NULL ,
 [RespirationPattern] nvarchar(100) NULL ,
 [Weight]             decimal(18,0) NULL ,
 [WeightUnit]         nvarchar(10) NULL ,
 [Height]             decimal(18,0) NULL ,
 [HeightUnit]         nvarchar(10) NULL ,
 [BMI]                decimal(18,0) NULL ,
 [QualityFlag]        bit NULL ,


 CONSTRAINT [PK_UDS_Encounter_Fact] PRIMARY KEY CLUSTERED ([Year] ASC, [CENTERID] ASC, [Record] ASC, [Date] ASC, [MRN] ASC)
);
GO








-- ************************************** [UNITY].[UDS_Visual_Dim]

CREATE TABLE [UNITY].[UDS_Visual_Dim]
(
 [Year]        narchar(4) NOT NULL ,
 [Visual]      nvarchar(100) NOT NULL ,
 [Title]       nvarchar(100) NULL ,
 [Desc]        nvarchar(max) NULL ,
 [ReportName]  nvarchar(100) NULL ,
 [Bookmark]    nvarchar(100) NULL ,
 [ExternalURL] nvarchar(max) NULL ,
 [InternalURL] nvarchar(max) NULL ,
 [UserID]      int NULL ,
 [Timestamp]   bigint NULL ,


 CONSTRAINT [PK_UDS_Visual_Dim] PRIMARY KEY CLUSTERED ([Year] ASC, [Visual] ASC)
);
GO








-- ************************************** [UNITY].[UDS_StatYear_Xref]

CREATE TABLE [UNITY].[UDS_StatYear_Xref]
(
 [CENTERID]   int NOT NULL ,
 [StatID]     nvarchar(10) NOT NULL ,
 [Year]       nvarchar(4) NOT NULL ,
 [Value]      float NULL ,
 [Number]     int NULL ,
 [Type]       nvarchar(10) NULL ,
 [UserID]     int NULL ,
 [Timestamp]  bigint NULL ,
 [Month]      nvarchar(2) NULL ,
 [Date]       date NULL ,
 [AggLevel]   nvarchar(5) NULL ,
 [YearFilter] nvarchar(4) NULL 

);
GO








-- ************************************** [UNITY].[UDS_ResultMaster]

CREATE TABLE [UNITY].[UDS_ResultMaster]
(
 [CENTERID]        int NOT NULL ,
 [MRN]             nvarchar(20) NOT NULL ,
 [UDSCode]         nvarchar(10) NOT NULL ,
 [Index]           nvarchar(3) NOT NULL ,
 [Year]            nvarchar(4) NOT NULL ,
 [AdjFlag]         nvarchar(1) NOT NULL ,
 [ProviderID]      nvarchar(10) NULL ,
 [MeasureID]       nvarchar(10) NULL ,
 [MRNCounter]      smallint NULL ,
 [ENTCounter]      smallint NULL ,
 [Timestamp]       bigint NULL ,
 [UserID]          int NULL ,
 [IncFlag]         bit NULL ,
 [LastEncounterDt] date NULL ,
 [ReasoncCode]     int NULL ,
 [Comments]        nvarchar(500) NULL ,
 [Status]          bit NULL ,
 [ReviewedBy]      int NULL ,
 [ReviewedOn]      date NULL ,
 [FinalInc]        smallint NULL ,
 [FinalIndex]      nvarchar(2) NULL ,


 CONSTRAINT [PK_UDS_Patient_Xref] PRIMARY KEY CLUSTERED ([CENTERID] ASC, [MRN] ASC, [UDSCode] ASC, [Index] ASC, [Year] ASC, [AdjFlag] ASC)
);
GO








-- ************************************** [UNITY].[UDS_ReasonCode_Dim]

CREATE TABLE [UNITY].[UDS_ReasonCode_Dim]
(
 [CENTERID]   int NOT NULL ,
 [Year]       nvarchar(4) NOT NULL ,
 [ReasonCode] int IDENTITY (100, 1) NOT NULL ,
 [Desc]       nvarchar(200) NOT NULL ,
 [UDSCode]    nvarchar(10) NOT NULL ,


 CONSTRAINT [PK_UDS_ReasonCode_Dim] PRIMARY KEY CLUSTERED ([CENTERID] ASC, [Year] ASC, [ReasonCode] ASC)
);
GO








-- ************************************** [UNITY].[UDS_Procedure_Xref]

CREATE TABLE [UNITY].[UDS_Procedure_Xref]
(
 [PROCCode]  nvarchar(10) NOT NULL ,
 [Year]      nvarchar(4) NOT NULL ,
 [UDSCode]   nvarchar(10) NOT NULL ,
 [Timestamp] bigint NULL ,
 [UserID]    int NULL ,


 CONSTRAINT [PK_CPT_Xref] PRIMARY KEY CLUSTERED ([PROCCode] ASC, [Year] ASC, [UDSCode] ASC)
);
GO








-- ************************************** [UNITY].[UDS_MeasureYear_Xref]

CREATE TABLE [UNITY].[UDS_MeasureYear_Xref]
(
 [MeasureID] nvarchar(10) NOT NULL ,
 [Year]      nvarchar(4) NOT NULL ,
 [Code]      nvarchar(20) NOT NULL ,
 [Index]     nvarchar(3) NOT NULL ,
 [Timestamp] bigint NULL ,
 [UserID]    int NULL ,
 [Source]    nvarchar(20) NULL ,


 CONSTRAINT [PK_UDS_MeasureYear_Xref] PRIMARY KEY CLUSTERED ([MeasureID] ASC, [Year] ASC, [Code] ASC, [Index] ASC)
);
GO








-- ************************************** [UNITY].[UDS_Measure_Dim]

CREATE TABLE [UNITY].[UDS_Measure_Dim]
(
 [MeasureID]  nvarchar(10) NOT NULL ,
 [Year]       nvarchar(4) NOT NULL ,
 [Desc]       nvarchar(100) NULL ,
 [Timestamp]  bigint NULL ,
 [UserID]     int NULL ,
 [UDSCode]    nvarchar(10) NULL ,
 [MeasureURL] nvarchar(max) NULL ,


 CONSTRAINT [PK_UDS_Measure_Dim] PRIMARY KEY CLUSTERED ([MeasureID] ASC, [Year] ASC)
);
GO








-- ************************************** [UNITY].[UDS_Index_Dim]

CREATE TABLE [UNITY].[UDS_Index_Dim]
(
 [Index]     nvarchar(2) NOT NULL ,
 [Year]      nvarchar(4) NOT NULL ,
 [Desc]      nvarchar(100) NULL ,
 [Timestamp] bigint NULL ,
 [UserID]    int NULL ,


 CONSTRAINT [PK_UDS_Index_sDim] PRIMARY KEY CLUSTERED ([Index] ASC, [Year] ASC)
);
GO








-- ************************************** [UNITY].[UDS_ICD10_Xref]

CREATE TABLE [UNITY].[UDS_ICD10_Xref]
(
 [ICD10Code] nvarchar(10) NOT NULL ,
 [Year]      nvarchar(4) NOT NULL ,
 [UDSCode]   nvarchar(10) NOT NULL ,
 [Timestamp] bigint NULL ,
 [UserID]    int NULL ,


 CONSTRAINT [PK_ICD10_Xref] PRIMARY KEY CLUSTERED ([ICD10Code] ASC, [Year] ASC, [UDSCode] ASC)
);
GO








-- ************************************** [UNITY].[UDS_Dim]

CREATE TABLE [UNITY].[UDS_Dim]
(
 [UDSCode]   nvarchar(10) NOT NULL ,
 [Year]      nvarchar(4) NOT NULL ,
 [UDSTable]  nvarchar(4) NULL ,
 [Desc]      nvarchar(500) NULL ,
 [SeqNum]    int NULL ,
 [Section]   nvarchar(100) NULL ,
 [LineNo]    nvarchar(3) NULL ,
 [Timestamp] bigint NULL ,
 [UserID]    int NULL ,
 [CodeList]  nvarchar(max) NULL ,


 CONSTRAINT [PK_UDS_Dim] PRIMARY KEY CLUSTERED ([UDSCode] ASC, [Year] ASC)
);
GO








-- ************************************** [UNITY].[UDS_Center_Dim]

CREATE TABLE [UNITY].[UDS_Center_Dim]
(
 [CENTERID]   int NOT NULL ,
 [Year]       nvarchar(4) NOT NULL ,
 [UDSCode]    nvarchar(10) NOT NULL ,
 [ActiveYear] nvarchar(4) NULL ,


 CONSTRAINT [PK_UDS_Center_Dim] PRIMARY KEY CLUSTERED ([CENTERID] ASC, [Year] ASC, [UDSCode] ASC)
);
GO








-- ************************************** [UNITY].[TELEH_]

CREATE TABLE [UNITY].[TELEH_]
(


);
GO








-- ************************************** [UNITY].[SexualOrientation_sDim]

CREATE TABLE [UNITY].[SexualOrientation_sDim]
(
 [SexualOrientationID]   nvarchar(3) NOT NULL ,
 [SexualOrientationName] nvarchar(100) NULL ,
 [UserID]                int NULL ,
 [Timestamp]             bigint NULL ,


 CONSTRAINT [PK_Sexual_Orientation_sDim] PRIMARY KEY CLUSTERED ([SexualOrientationID] ASC)
);
GO








-- ************************************** [UNITY].[SCHEDULE_Fact]

CREATE TABLE [UNITY].[SCHEDULE_Fact]
(
 [CENTERID]       int NOT NULL ,
 [MRN]            nvarchar(20) NOT NULL ,
 [ApptDatetime]   datetime NOT NULL ,
 [ProviderID]     int NULL ,
 [ApptType]       nvarchar(100) NULL ,
 [ApptStatus]     nvarchar(20) NULL ,
 [TelehealthFlag] bit NULL ,
 [Timestamp]      bigint NULL ,
 [UserID]         int NULL ,
 [ApptComments]   nvarchar(max) NULL ,
 [EncounterID]    nvarchar(30) NULL ,


 CONSTRAINT [PK_SCHEDULE_Fact] PRIMARY KEY CLUSTERED ([CENTERID] ASC, [MRN] ASC, [ApptDatetime] ASC)
);
GO








-- ************************************** [UNITY].[RemarkCode_Dim]

CREATE TABLE [UNITY].[RemarkCode_Dim]
(
 [RemarkCode] nvarchar(10) NOT NULL ,
 [Desc]       nvarchar(500) NULL ,
 [Category]   nvarchar(200) NULL ,
 [Timestamp]  bigint NULL ,
 [UserID]     int NULL ,


 CONSTRAINT [PK_RemarkCode_Dim] PRIMARY KEY CLUSTERED ([RemarkCode] ASC)
);
GO








-- ************************************** [UNITY].[ReasonCode_Dim]

CREATE TABLE [UNITY].[ReasonCode_Dim]
(
 [ReasonCode] nvarchar(10) NOT NULL ,
 [Desc]       nvarchar(500) NULL ,
 [Category]   nvarchar(200) NULL ,
 [Timestamp]  bigint NULL ,
 [UserID]     int NULL ,


 CONSTRAINT [PK_ReasonCode_Dim] PRIMARY KEY CLUSTERED ([ReasonCode] ASC)
);
GO








-- ************************************** [UNITY].[Race_sDim]

CREATE TABLE [UNITY].[Race_sDim]
(
 [RaceID]    nvarchar(3) NOT NULL ,
 [RaceName]  nvarchar(100) NULL ,
 [UserID]    int NULL ,
 [Timestamp] bigint NULL ,


 CONSTRAINT [PK_Race_sDim] PRIMARY KEY CLUSTERED ([RaceID] ASC)
);
GO








-- ************************************** [UNITY].[Provider_Dim]

CREATE TABLE [UNITY].[Provider_Dim]
(
 [CENTERID]      int NOT NULL ,
 [ProviderID]    int IDENTITY (1000, 1) NOT NULL ,
 [NPI]           int NULL ,
 [Categrory]     nvarchar(200) NULL ,
 [Department]    nvarchar(200) NULL ,
 [Timestamp]     bigint NULL ,
 [UserID]        int NULL ,
 [FirstName]     nvarchar(100) NULL ,
 [LastName]      nvarchar(100) NULL ,
 [ExtProviderID] nvarchar(10) NULL ,
 [Abbr]          nvarchar(100) NULL ,
 [Phone]         nvarchar(12) NULL ,
 [Email]         nvarchar(200) NULL ,


 CONSTRAINT [PK_Provider_Dim] PRIMARY KEY CLUSTERED ([CENTERID] ASC, [ProviderID] ASC)
);
GO








-- ************************************** [UNITY].[Procedures_Fact]

CREATE TABLE [UNITY].[Procedures_Fact]
(
 [Year]        nvarchar(4) NOT NULL ,
 [CENTERID]    int NOT NULL ,
 [MRN]         nvarchar(20) NOT NULL ,
 [Date]        date NOT NULL ,
 [Record]      int IDENTITY (1, 1) NOT NULL ,
 [ProviderID]  nvarchar(20) NULL ,
 [PROCDesc]    nvarchar(500) NULL ,
 [EncounterID] nvarchar(30) NULL ,
 [PROCSource]  nvarchar(50) NULL ,
 [System]      nvarchar(25) NULL ,
 [UserID]      int NULL ,
 [Timestamp]   bigint NULL ,
 [PROCCode]    nvarchar(10) NULL ,
 [Comments]    nvarchar(max) NULL ,
 [QualityFlag] bit NULL ,
 [Mod1]        nvarchar(10) NULL ,
 [Mod2]        nvarchar(10) NULL ,
 [Mod3]        nvarchar(10) NULL ,
 [Mod4]        nvarchar(10) NULL ,


 CONSTRAINT [PK_UDS_Procedure_Fact] PRIMARY KEY CLUSTERED ([Year] ASC, [CENTERID] ASC, [MRN] ASC, [Date] ASC, [Record] ASC)
);
GO








-- ************************************** [UNITY].[PROCCode_Dim]

CREATE TABLE [UNITY].[PROCCode_Dim]
(
 [PROCCode]  nvarchar(10) NOT NULL ,
 [Category]  nvarchar(200) NULL ,
 [Desc]      nvarchar(500) NULL ,
 [UserID]    int NULL ,
 [Timestamp] bigint NULL ,


 CONSTRAINT [PK_PROCCode_Dim] PRIMARY KEY CLUSTERED ([PROCCode] ASC)
);
GO








-- ************************************** [UNITY].[Payer_Dim]

CREATE TABLE [UNITY].[Payer_Dim]
(
 [CENTERID]                int NOT NULL ,
 [PayerID]                 int IDENTITY (1000, 1) NOT NULL ,
 [Name]                    nvarchar(200) NULL ,
 [Public_Private]          nvarchar(10) NULL ,
 [Medicare_Medicaid]       nvarchar(20) NULL ,
 [Category]                nvarchar(200) NULL ,
 [ExtPayerID]              nvarchar(10) NULL ,
 [TradingPartnerServcieID] nvarchar(20) NULL ,
 [Abbr]                    nvarchar(100) NULL ,


 CONSTRAINT [PK_Payer_Dim] PRIMARY KEY CLUSTERED ([CENTERID] ASC, [PayerID] ASC)
);
GO








-- ************************************** [UNITY].[PatientMaster_Dim]

CREATE TABLE [UNITY].[PatientMaster_Dim]
(
 [CENTERID]            int NOT NULL ,
 [MRN]                 nvarchar(20) NOT NULL ,
 [Year]                nvarchar(4) NOT NULL ,
 [HomeZipcode]         nvarchar(5) NULL ,
 [DateofBirth]         date NULL ,
 [Gender]              nvarchar(1) NULL ,
 [NonEnglishFlag]      bit NULL ,
 [ServedZipcode]       nvarchar(5) NULL ,
 [VeteranFlag]         bit NULL ,
 [Timestamp]           bigint NULL ,
 [UserID]              int NULL ,
 [LastEncounterDt]     date NULL ,
 [PCP]                 int NULL ,
 [FName]               nvarchar(100) NULL ,
 [LName]               nvarchar(100) NULL ,
 [PrimaryPayerID]      int NULL ,
 [RaceID]              nvarchar(3) NULL ,
 [GenderID]            nvarchar(3) NULL ,
 [SexualOrientationID] nvarchar(3) NULL ,
 [EthnicityID]         nvarchar(3) NULL ,
 [IPID]                nvarchar(20) NULL ,
 [LanguageID]          nvarchar(3) NULL ,
 [SecondaryPayerID]    int NULL ,
 [PrimaryLocation]     nvarchar(100) NULL ,
 [UPID]                int IDENTITY (1000000, 1) NULL ,
 [DeceasedFlag]        bit NULL ,
 [Phone]               nvarchar(12) NULL ,
 [Email]               nvarchar(200) NULL ,


 CONSTRAINT [PK_Patient_Master] PRIMARY KEY CLUSTERED ([CENTERID] ASC, [MRN] ASC, [Year] ASC)
);
GO








-- ************************************** [UNITY].[Medications_Fact]

CREATE TABLE [UNITY].[Medications_Fact]
(
 [CENTERID]    int NOT NULL ,
 [Record]      int IDENTITY (1, 1) NOT NULL ,
 [Date]        date NOT NULL ,
 [MRN]         nvarchar(20) NOT NULL ,
 [Year]        nvarchar(4) NOT NULL ,
 [EncounterID] nvarchar(30) NULL ,
 [ProviderID]  nvarchar(10) NULL ,
 [System]      nvarchar(25) NULL ,
 [UserID]      int NULL ,
 [Timestamp]   bigint NULL ,
 [MEDCode]     nvarchar(20) NULL ,
 [MEDDesc]     nvarchar(500) NULL ,
 [Comments]    nvarchar(max) NULL ,
 [QualityFlag] bit NULL ,
 [Dosage]      nvarchar(20) NULL ,
 [MEDStatus]   nvarchar(20) NULL ,


 CONSTRAINT [PK_UDS_Encounter_Fact] PRIMARY KEY CLUSTERED ([CENTERID] ASC, [Record] ASC, [Date] ASC, [MRN] ASC, [Year] ASC)
);
GO








-- ************************************** [UNITY].[Language_sDim]

CREATE TABLE [UNITY].[Language_sDim]
(
 [LanguageID] nvarchar(3) NOT NULL ,
 [Language]   nvarchar(50) NULL ,
 [UserID]     int NULL ,
 [Timestamp]  bigint NULL ,


 CONSTRAINT [PK_Language_sDim] PRIMARY KEY CLUSTERED ([LanguageID] ASC)
);
GO








-- ************************************** [UNITY].[LabResults_Fact]

CREATE TABLE [UNITY].[LabResults_Fact]
(
 [Year]         nvarchar(4) NOT NULL ,
 [CENTERID]     int NOT NULL ,
 [Record]       int IDENTITY (1, 1) NOT NULL ,
 [Date]         date NOT NULL ,
 [MRN]          nvarchar(20) NOT NULL ,
 [EncounterID]  nvarchar(30) NULL ,
 [ProviderID]   nvarchar(10) NULL ,
 [System]       nvarchar(25) NULL ,
 [UserID]       int NULL ,
 [Timestamp]    bigint NULL ,
 [Comments]     nvarchar(max) NULL ,
 [QualityFlag]  bit NULL ,
 [ResultName]   nvarchar(100) NULL ,
 [ResultValue]  nvarchar(100) NULL ,
 [ResultUnit]   nvarchar(100) NULL ,
 [ResutRange]   nvarchar(100) NULL ,
 [ReviewedFlag] bit NULL ,


 CONSTRAINT [PK_UDS_Encounter_Fact] PRIMARY KEY CLUSTERED ([Year] ASC, [CENTERID] ASC, [Record] ASC, [Date] ASC, [MRN] ASC)
);
GO








-- ************************************** [UNITY].[Immunizations_Fact]

CREATE TABLE [UNITY].[Immunizations_Fact]
(
 [CENTERID]            int NOT NULL ,
 [Record]              int IDENTITY (1, 1) NOT NULL ,
 [Date]                date NOT NULL ,
 [MRN]                 nvarchar(20) NOT NULL ,
 [Year]                nvarchar(4) NOT NULL ,
 [EncounterID]         nvarchar(30) NULL ,
 [ProviderID]          nvarchar(10) NULL ,
 [System]              nvarchar(25) NULL ,
 [UserID]              int NULL ,
 [Timestamp]           bigint NULL ,
 [Comments]            nvarchar(max) NULL ,
 [MVX]                 nvarchar(100) NULL ,
 [NDC]                 nvarchar(100) NULL ,
 [PROCCode]            nvarchar(10) NULL ,
 [HCPCSCode]           nvarchar(20) NULL ,
 [QualityFlag]         bit NULL ,
 [AdverseReactionFlag] bit NULL ,
 [InHouseFlag]         bit NULL ,


 CONSTRAINT [PK_UDS_Encounter_Fact] PRIMARY KEY CLUSTERED ([CENTERID] ASC, [Record] ASC, [Date] ASC, [MRN] ASC, [Year] ASC)
);
GO








-- ************************************** [UNITY].[ICD910_Xref]

CREATE TABLE [UNITY].[ICD910_Xref]
(
 [ICD9Code]  nvarchar(10 NOT NULL ,
 [ICD10Code] nvarchar(10) NOT NULL ,
 [Timestamp] bigint NULL ,
 [UserID]    int NULL ,
 [Category]  nvarchar(10) NULL ,


 CONSTRAINT [PK_UDS_ICD910_Xef] PRIMARY KEY CLUSTERED ([ICD9Code] ASC, [ICD10Code] ASC)
);
GO








-- ************************************** [UNITY].[ICD9_Dim]

CREATE TABLE [UNITY].[ICD9_Dim]
(
 [ICD9Code]  nvarchar(10) NOT NULL ,
 [Desc]      nvarchar(100) NULL ,
 [UserID]    int NULL ,
 [Timestamp] bigint NULL ,


 CONSTRAINT [PK_ICD10_Dim] PRIMARY KEY CLUSTERED ([ICD9Code] ASC)
);
GO








-- ************************************** [UNITY].[ICD10_Dim]

CREATE TABLE [UNITY].[ICD10_Dim]
(
 [ICD10Code] nvarchar(10) NOT NULL ,
 [Category]  nvarchar(200) NULL ,
 [UserID]    int NULL ,
 [Timestamp] bigint NULL ,
 [Desc]      nvarchar(500) NULL ,


 CONSTRAINT [PK_ICD10_Dim] PRIMARY KEY CLUSTERED ([ICD10Code] ASC)
);
GO








-- ************************************** [UNITY].[History_Fact]

CREATE TABLE [UNITY].[History_Fact]
(
 [CENTERID]       int NOT NULL ,
 [Record]         int IDENTITY (1, 1) NOT NULL ,
 [Date]           date NOT NULL ,
 [MRN]            nvarchar(20) NOT NULL ,
 [EncounterID]    nvarchar(30) NULL ,
 [ProviderID]     nvarchar(10) NULL ,
 [System]         nvarchar(25) NULL ,
 [UserID]         int NULL ,
 [Timestamp]      bigint NULL ,
 [Comments]       nvarchar(max) NULL ,
 [QualityFlag]    bit NULL ,
 [AttributeTitle] nvarchar(100) NULL ,
 [AttributeValue] nvarchar(100) NULL ,
 [Title]          nvarchar(500) NULL ,
 [Category]       nvarchar(100) NULL ,
 [Element]        nvarchar(100) NULL ,


 CONSTRAINT [PK_UDS_Encounter_Fact] PRIMARY KEY CLUSTERED ([CENTERID] ASC, [Record] ASC, [Date] ASC, [MRN] ASC)
);
GO








-- ************************************** [UNITY].[HCPCS_Dim]

CREATE TABLE [UNITY].[HCPCS_Dim]
(
 [HCPCSCode] nvarchar(20) NOT NULL ,
 [Desc]      nvarchar(100) NOT NULL ,


 CONSTRAINT [PK_HCPCS_Dim] PRIMARY KEY CLUSTERED ([HCPCSCode] ASC)
);
GO








-- ************************************** [UNITY].[HCPCS_CPT_Xref]

CREATE TABLE [UNITY].[HCPCS_CPT_Xref]
(
 [HCPCSCode] nvarchar(20) NOT NULL ,
 [CPTCode]   nvarchar(20) NOT NULL ,


 CONSTRAINT [PK_HCPCS_Procedure_Xref] PRIMARY KEY CLUSTERED ([HCPCSCode] ASC, [CPTCode] ASC)
);
GO








-- ************************************** [UNITY].[GenderIdentity_sDim]

CREATE TABLE [UNITY].[GenderIdentity_sDim]
(
 [GenderID]   nvarchar(3) NOT NULL ,
 [GenderName] nvarchar(15) NULL ,
 [UserID]     int NULL ,
 [Timestamp]  bigint NULL ,


 CONSTRAINT [PK_Gender_Identity_sDim] PRIMARY KEY CLUSTERED ([GenderID] ASC)
);
GO








-- ************************************** [UNITY].[Ethnicity_sDim]

CREATE TABLE [UNITY].[Ethnicity_sDim]
(
 [EthnicityID]   nvarchar(3) NOT NULL ,
 [EthnicityName] nvarchar(100) NULL ,
 [UserID]        int NULL ,
 [Timestamp]     bigint NULL ,


 CONSTRAINT [PK_Ethnicity_sDim] PRIMARY KEY CLUSTERED ([EthnicityID] ASC)
);
GO








-- ************************************** [UNITY].[Encounters_Fact]

CREATE TABLE [UNITY].[Encounters_Fact]
(
 [Year]        nvarchar(4) NOT NULL ,
 [CENTERID]    int NOT NULL ,
 [EncounterID] nvarchar(30) NOT NULL ,
 [Date]        date NOT NULL ,
 [ProviderID]  nvarchar(20) NULL ,
 [System]      nvarchar(25) NULL ,
 [UserID]      int NULL ,
 [Timestamp]   bigint NULL ,
 [MRN]         nvarchar(20) NULL ,
 [Comments]    nvarchar(max) NULL ,
 [Location]    nvarchar(100) NULL ,


 CONSTRAINT [PK_UDS_Procedure_Fact] PRIMARY KEY CLUSTERED ([Year] ASC, [CENTERID] ASC, [EncounterID] ASC, [Date] ASC)
);
GO








-- ************************************** [UNITY].[Diagnosis_Fact]

CREATE TABLE [UNITY].[Diagnosis_Fact]
(
 [Year]        nvarchar(4) NOT NULL ,
 [CENTERID]    int NOT NULL ,
 [Record]      int IDENTITY (1, 1) NOT NULL ,
 [Date]        date NOT NULL ,
 [MRN]         nvarchar(20) NOT NULL ,
 [ICDVersion]  int NOT NULL ,
 [EncounterID] nvarchar(30) NULL ,
 [ProviderID]  nvarchar(10) NULL ,
 [ICDDesc]     nvarchar(500) NULL ,
 [System]      nvarchar(25) NULL ,
 [UserID]      int NULL ,
 [Timestamp]   bigint NULL ,
 [ICDCode]     nvarchar(10) NULL ,
 [Comments]    nvarchar(max) NULL ,
 [QualityFlag] bit NULL ,


 CONSTRAINT [PK_UDS_Encounter_Fact] PRIMARY KEY CLUSTERED ([Year] ASC, [CENTERID] ASC, [Record] ASC, [Date] ASC, [MRN] ASC, [ICDVersion] ASC)
);
GO








-- ************************************** [UNITY].[CPT_Dim]

CREATE TABLE [UNITY].[CPT_Dim]
(
 [CPTCode] nvarchar(20) NOT NULL ,
 [Desc]    nvarchar(100) NULL ,
 [Type]    nvarchar(10) NULL ,


 CONSTRAINT [PK_CPT_Dim] PRIMARY KEY CLUSTERED ([CPTCode] ASC)
);
GO








-- ************************************** [UNITY].[CohortPatient_Xref]

CREATE TABLE [UNITY].[CohortPatient_Xref]
(
 [CohortID]  int NOT NULL ,
 [CENTERID]  int NOT NULL ,
 [MRN]       nvarchar(20) NOT NULL ,
 [Timestamp] bigint NULL ,
 [UserID]    int NULL ,
 [AdjFlag]   nvarchar(1) NULL ,


 CONSTRAINT [PK_CohortPatient_Xref] PRIMARY KEY CLUSTERED ([CohortID] ASC, [CENTERID] ASC, [MRN] ASC)
);
GO








-- ************************************** [UNITY].[Cohort_Dim]

CREATE TABLE [UNITY].[Cohort_Dim]
(
 [CohortID]      int NOT NULL ,
 [CENTERID]      int NOT NULL ,
 [Timestamp]     bigint NULL ,
 [UserID]        int NULL ,
 [ActiveFlag]    bit NULL ,
 [Name]          nvarchar(200) NULL ,
 [Desc]          nvarchar(max) NULL ,
 [Procedures]    nvarchar(max) NULL ,
 [Demographics]  nvarchar(max) NULL ,
 [Immunizations] nvarchar(max) NULL ,
 [Vital]         nvarchar(max) NULL ,
 [Diagnosis]     nvarchar(max) NULL ,
 [Medications]   nvarchar(max) NULL ,
 [LabResults]    nvarchar(max) NULL ,
 [History]       nvarchar(max) NULL ,
 [SQL]           nvarchar(max) NULL ,


 CONSTRAINT [PK_UDS_MeasureYear_Xref] PRIMARY KEY CLUSTERED ([CohortID] ASC, [CENTERID] ASC)
);
GO








-- ************************************** [UNITY].[CLAIMS_Fact]

CREATE TABLE [UNITY].[CLAIMS_Fact]
(
 [BatchID]                  nvarchar(100) NOT NULL ,
 [CENTERID]                 int NOT NULL ,
 [Record]                   int IDENTITY (1, 1) NOT NULL ,
 [Timestamp]                bigint NULL ,
 [UserID]                   int NULL ,
 [ClaimID]                  nvarchar(100) NULL ,
 [MRN]                      nvarchar(20) NULL ,
 [PredictionFlag]           bit NULL ,
 [PayerID]                  int NULL ,
 [ServiceDate]              date NULL ,
 [PROCode]                  nvarchar(10) NULL ,
 [Modifiers]                nvarchar(100) NULL ,
 [ICDCodes]                 nvarchar(200) NULL ,
 [ServiceFee]               decimal(18,0) NULL ,
 [ServiceUnits]             int NULL ,
 [ServicePlaceID]           int NULL ,
 [ClaimLine]                int NULL ,
 [DOB]                      date NULL ,
 [Gender]                   nvarchar(1) NULL ,
 [RelationshipToSubscriber] int NULL ,
 [PrimaryICD]               nvarchar(10) NULL ,
 [ProviderID]               int NULL ,
 [ReasonCode]               nvarchar(10) NULL ,
 [ProcessedFlag]            bit NULL ,
 [PriorAuthFlag]            bit NULL ,
 [CredentialingFlag]        bit NULL ,
 [PolicyFlag]               bit NULL ,
 [RulesFlag]                bit NULL ,
 [PolicyList]               nvarchar(100) NULL ,
 [RulesList]                nvarchar(100) NULL ,
 [PredictionStatus]         nvarchar(100) NULL ,
 [PredictionReason]         nvarchar(200) NULL ,
 [PredictionCode]           nvarchar(10) NULL ,
 [Comments]                 nvarchar(max) NULL ,
 [RemarkCode]               nvarchar(10) NULL ,


 CONSTRAINT [PK_CohortPatient_Xref] PRIMARY KEY CLUSTERED ([BatchID] ASC, [CENTERID] ASC, [Record] ASC)
);
GO








-- ************************************** [UNITY].[BAM_Questions_Dim]

CREATE TABLE [UNITY].[BAM_Questions_Dim]
(
 [QNo]            int NOT NULL ,
 [CENTERID]       int NOT NULL ,
 [QNoDescription] nvarchar(200) NULL ,


 CONSTRAINT [PK_BAM_RESULTS] PRIMARY KEY CLUSTERED ([QNo] ASC, [CENTERID] ASC)
);
GO








-- ************************************** [UNITY].[BAM_QAnswers_sDim]

CREATE TABLE [UNITY].[BAM_QAnswers_sDim]
(
 [QNo]             int NOT NULL ,
 [QANo]            int NOT NULL ,
 [CENTERID]        int NOT NULL ,
 [QANoDescription] nvarchar(200) NULL ,


 CONSTRAINT [PK_BAM_RESULTS] PRIMARY KEY CLUSTERED ([QNo] ASC, [QANo] ASC, [CENTERID] ASC)
);
GO








-- ************************************** [UNITY].[BAM_Patient_Answers]

CREATE TABLE [UNITY].[BAM_Patient_Answers]
(
 [CENTERID]  int NOT NULL ,
 [MRN]       nvarchar(20) NOT NULL ,
 [QNo]       int NOT NULL ,
 [QNoResult] int NOT NULL ,


 CONSTRAINT [PK_BAM_RESULTS] PRIMARY KEY CLUSTERED ([CENTERID] ASC, [MRN] ASC, [QNo] ASC)
);
GO








-- ************************************** [UNITY].[AlertPatient_Xref]

CREATE TABLE [UNITY].[AlertPatient_Xref]
(
 [AlertID]   int NOT NULL ,
 [CENTERID]  int NOT NULL ,
 [MRN]       nvarchar(20) NOT NULL ,
 [Timestamp] bigint NULL ,
 [UserID]    int NULL ,
 [AdjFlag]   nvarchar(1) NULL ,


 CONSTRAINT [PK_CohortPatient_Xref] PRIMARY KEY CLUSTERED ([AlertID] ASC, [CENTERID] ASC, [MRN] ASC)
);
GO








-- ************************************** [UNITY].[Alert_Dim]

CREATE TABLE [UNITY].[Alert_Dim]
(
 [AlertID]         int IDENTITY (10000, 1) NOT NULL ,
 [CENTERID]        int NOT NULL ,
 [Timestamp]       bigint NULL ,
 [UserID]          int NULL ,
 [ActiveFlag]      bit NULL ,
 [AlertName]       nvarchar(200) NULL ,
 [AlertCompliance] nvarchar(max) NULL ,
 [SQLProcedure]    nvarchar(200) NULL ,
 [Category]        nvarchar(200) NULL ,
 [NotifyPhone]     nvarchar(12) NULL ,
 [NotifyEmail]     nvarchar(200) NULL ,
 [NotifyType]      nvarchar(10) NULL ,


 CONSTRAINT [PK_UDS_MeasureYear_Xref] PRIMARY KEY CLUSTERED ([AlertID] ASC, [CENTERID] ASC)
);
GO








