CREATE TABLE [ops-datascience-5026].[WIP Location Summary (MH)] (
    [Job Name] VARCHAR(MAX),
    [Assembly PN] VARCHAR(MAX),
    [Assembly Description] VARCHAR(MAX),
    [Job Description] VARCHAR(MAX),
    [Released Date] DateTime,
    [Start Date] DateTime,
    [Scheduled Comp Date] DateTime,
    [Sequence #] FLOAT,
    [Operation Description] VARCHAR(MAX),
    [Queue] FLOAT,
    [Running] FLOAT,
    [Completed] FLOAT,
    [To Move] FLOAT,
    [Rejected] FLOAT,
    [Remaining] FLOAT,
    [Scrapped] FLOAT,
    [Project Number] VARCHAR(MAX),
    [NMR #] VARCHAR(MAX),
    [NMR Date] VARCHAR(MAX),
    [Number of NMR's] INT,
    [Job Created By] VARCHAR(MAX),
    [Organization Code] VARCHAR(MAX),
    [Task Number] VARCHAR(MAX),
    [Department] VARCHAR(MAX),
    [ORGANIZATION_NAME] VARCHAR(MAX),
    [Conditional Formatting] INT,
    [DateTimeNow] DateTime,
    [Workflow Publishing Data] VARCHAR(MAX)
);
select * from [ops-datascience-5026].[WIP Location Summary (MH)] where [NMR #] = '399479';

CREATE TABLE [ops-datascience-5026].[Upcoming WIP Summary (MH)] (
    [Organization Code] VARCHAR(MAX),
    [Month] DATE,
    [Project Number] VARCHAR(MAX),
    [Average Jobs Open] FLOAT,
    [Average Age] FLOAT,
    [Sum_CountDistinct_Job Name] INT,
    [DateTimeNow] DateTime,
    [Workflow Publishing Data] VARCHAR(MAX)
);

select * from [ops-datascience-5026].[Upcoming WIP Summary (MH)] where [Project Number]= '2603333';

create table [ops-datascience-5026].[Recent WIP Completions (MH)]
(
[Assembly$Sv$Part Number] varchar(max),
[Assembly Description] varchar(max),
[Job Closed Date] DateTime,
[Job Completed Date] DateTime,
[Job Created By] varchar(max),
[Job Name] varchar(max),
[Job Quantity Completed] float(24),
[Job Quantity Scheduled] float(24),
[Job Quantity Scrapped] float(24),
[Job Description] varchar(max),
[Job Type] varchar(max),
[Job Status] varchar(max),
[Job Released Date] DateTime,
[Organization Code] varchar(max),
[Project Number] varchar(max),
[Task Number] varchar(max),
[Job Scheduled Completion Dt] DateTime,
[Job Start Date] DateTime,
[DateTimeNow] DateTime,
[Workflow Publishing Data] Varchar(max)
);
select * from [ops-datascience-5026].[Recent WIP Completions (MH)];