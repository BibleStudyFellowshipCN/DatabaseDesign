/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Model1.DM1
 *
 * Date Created : Monday, April 03, 2017 15:23:07
 * Target DBMS : Microsoft SQL Server 2016
 */

IF OBJECT_ID('Area') IS NOT NULL
BEGIN
    DROP TABLE Area
    PRINT '<<< DROPPED TABLE Area >>>'
END
go
IF OBJECT_ID('AreaStaff') IS NOT NULL
BEGIN
    DROP TABLE AreaStaff
    PRINT '<<< DROPPED TABLE AreaStaff >>>'
END
go
IF OBJECT_ID('Attendance') IS NOT NULL
BEGIN
    DROP TABLE Attendance
    PRINT '<<< DROPPED TABLE Attendance >>>'
END
go
IF OBJECT_ID('BSFGlossary') IS NOT NULL
BEGIN
    DROP TABLE BSFGlossary
    PRINT '<<< DROPPED TABLE BSFGlossary >>>'
END
go
IF OBJECT_ID('Church') IS NOT NULL
BEGIN
    DROP TABLE Church
    PRINT '<<< DROPPED TABLE Church >>>'
END
go
IF OBJECT_ID('Class') IS NOT NULL
BEGIN
    DROP TABLE Class
    PRINT '<<< DROPPED TABLE Class >>>'
END
go
IF OBJECT_ID('ClassStaff') IS NOT NULL
BEGIN
    DROP TABLE ClassStaff
    PRINT '<<< DROPPED TABLE ClassStaff >>>'
END
go
IF OBJECT_ID('Groups') IS NOT NULL
BEGIN
    DROP TABLE Groups
    PRINT '<<< DROPPED TABLE Groups >>>'
END
go
IF OBJECT_ID('Lesson') IS NOT NULL
BEGIN
    DROP TABLE Lesson
    PRINT '<<< DROPPED TABLE Lesson >>>'
END
go
IF OBJECT_ID('LessonTracker') IS NOT NULL
BEGIN
    DROP TABLE LessonTracker
    PRINT '<<< DROPPED TABLE LessonTracker >>>'
END
go
IF OBJECT_ID('Member') IS NOT NULL
BEGIN
    DROP TABLE Member
    PRINT '<<< DROPPED TABLE Member >>>'
END
go
IF OBJECT_ID('MemberChild') IS NOT NULL
BEGIN
    DROP TABLE MemberChild
    PRINT '<<< DROPPED TABLE MemberChild >>>'
END
go
IF OBJECT_ID('Question') IS NOT NULL
BEGIN
    DROP TABLE Question
    PRINT '<<< DROPPED TABLE Question >>>'
END
go
IF OBJECT_ID('Study') IS NOT NULL
BEGIN
    DROP TABLE Study
    PRINT '<<< DROPPED TABLE Study >>>'
END
go
/* 
 * TABLE: Area 
 */

CREATE TABLE Area(
    AreaId         int             IDENTITY(1,1),
    Name           nvarchar(50)    NULL,
    Description    nvarchar(50)    NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (AreaId)
)
go



IF OBJECT_ID('Area') IS NOT NULL
    PRINT '<<< CREATED TABLE Area >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Area >>>'
go

/* 
 * TABLE: AreaStaff 
 */

CREATE TABLE AreaStaff(
    AreaId       int     NOT NULL,
    Position     int     NOT NULL,
    MemberId     int     NOT NULL,
    StartDate    date    NULL,
    ClassId      int     NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (AreaId, Position)
)
go



IF OBJECT_ID('AreaStaff') IS NOT NULL
    PRINT '<<< CREATED TABLE AreaStaff >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE AreaStaff >>>'
go

/* 
 * TABLE: Attendance 
 */

CREATE TABLE Attendance(
    MemberId                    int         NOT NULL,
    LessonTrackerId             int         NOT NULL,
    ClassId                     int         NOT NULL,
    IsAttended                  bit         NULL,
    AttendanceRecordDateTime    datetime    NULL,
    CONSTRAINT PK13 PRIMARY KEY NONCLUSTERED (MemberId, LessonTrackerId, ClassId)
)
go



IF OBJECT_ID('Attendance') IS NOT NULL
    PRINT '<<< CREATED TABLE Attendance >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Attendance >>>'
go

/* 
 * TABLE: BSFGlossary 
 */

CREATE TABLE BSFGlossary(
    GlossaryId        int             IDENTITY(1,1),
    Category          nvarchar(20)    NULL,
    EnglishTerm       nvarchar(50)    NULL,
    SimChineseTerm    nvarchar(50)    NULL,
    ComChineseTerm    nvarchar(50)    NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (GlossaryId)
)
go



IF OBJECT_ID('BSFGlossary') IS NOT NULL
    PRINT '<<< CREATED TABLE BSFGlossary >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE BSFGlossary >>>'
go

/* 
 * TABLE: Church 
 */

CREATE TABLE Church(
    ChurchId         int             IDENTITY(1,1),
    Name             nvarchar(50)    NULL,
    Denomination     nvarchar(20)    NULL,
    City             nvarchar(20)    NULL,
    StateProvince    nvarchar(20)    NULL,
    Country          nvarchar(20)    NULL,
    CONSTRAINT PK15 PRIMARY KEY NONCLUSTERED (ChurchId)
)
go



IF OBJECT_ID('Church') IS NOT NULL
    PRINT '<<< CREATED TABLE Church >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Church >>>'
go

/* 
 * TABLE: Class 
 */

CREATE TABLE Class(
    ClassId                    int             IDENTITY(1,1),
    Name                       nvarchar(50)    NOT NULL,
    ClassType                  int             NULL,
    AreaId                     int             NULL,
    MainMeetingDay             nvarchar(10)    NULL,
    MainMeetingTime            nvarchar(10)    NULL,
    MainLocAddr1               nvarchar(50)    NULL,
    MainLocAddr2               nvarchar(50)    NULL,
    MainLocCity                nvarchar(50)    NULL,
    MainLocStateProvince       nvarchar(50)    NULL,
    MainLocPostalCode          nvarchar(20)    NULL,
    MainLocCountry             nvarchar(20)    NULL,
    LeadersMeetingDay          nvarchar(10)    NULL,
    LeadersMeetingTime         nvarchar(10)    NULL,
    LeadersLocAddr1            nvarchar(50)    NULL,
    LeadersLocAddr2            nvarchar(50)    NULL,
    LeadersLocCity             nvarchar(50)    NULL,
    LeadersLocStateProvince    nvarchar(50)    NULL,
    LeadersLocPostalCode       nvarchar(20)    NULL,
    LeadersLocCountry          nvarchar(20)    NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (ClassId)
)
go



IF OBJECT_ID('Class') IS NOT NULL
    PRINT '<<< CREATED TABLE Class >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Class >>>'
go

/* 
 * TABLE: ClassStaff 
 */

CREATE TABLE ClassStaff(
    ClassId      int     NOT NULL,
    Position     int     NOT NULL,
    MemberId     int     NULL,
    StartDate    date    NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (ClassId, Position)
)
go



IF OBJECT_ID('ClassStaff') IS NOT NULL
    PRINT '<<< CREATED TABLE ClassStaff >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ClassStaff >>>'
go

/* 
 * TABLE: Groups 
 */

CREATE TABLE Groups(
    GroupId                 int             IDENTITY(1,1),
    ClassId                 int             NOT NULL,
    GroupLeader             int             NOT NULL,
    GroupStartDate          date            NULL,
    Room                    nvarchar(20)    NULL,
    IsSDG                   bit             NULL,
    SatelliteAddr1          nvarchar(50)    NULL,
    SatelliteAddr2          nvarchar(50)    NULL,
    SatelliteCity           nvarchar(50)    NULL,
    StateProvince           nvarchar(50)    NULL,
    SatellitePostalCode     nvarchar(20)    NULL,
    SatelliteCountry        nvarchar(20)    NULL,
    SatelliteMeetingDay     nvarchar(10)    NULL,
    SatelliteMeetingTime    nvarchar(10)    NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (GroupId, ClassId)
)
go



IF OBJECT_ID('Groups') IS NOT NULL
    PRINT '<<< CREATED TABLE Groups >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Groups >>>'
go

/* 
 * TABLE: Lesson 
 */

CREATE TABLE Lesson(
    LessonNum                smallint        NOT NULL,
    StudyId                  int             NOT NULL,
    TitleInEnglish           nvarchar(50)    NULL,
    VersesInEnglish          nvarchar(50)    NULL,
    TitleInSimChinese        nvarchar(50)    NULL,
    VersesInSimChinese       nvarchar(50)    NULL,
    TitleInComChinese        nvarchar(50)    NULL,
    VersesInComChinese       nvarchar(50)    NULL,
    NotesInEnglishLink       nvarchar(50)    NULL,
    NotesInSimChineseLink    nvarchar(50)    NULL,
    NotesInComChineseLink    nvarchar(50)    NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (LessonNum, StudyId)
)
go



IF OBJECT_ID('Lesson') IS NOT NULL
    PRINT '<<< CREATED TABLE Lesson >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Lesson >>>'
go

/* 
 * TABLE: LessonTracker 
 */

CREATE TABLE LessonTracker(
    LessonTrackerId       int              IDENTITY(1,1),
    LessonNum             smallint         NULL,
    StudyId               int              NULL,
    ClassId               int              NULL,
    PlannedStartDate      date             NULL,
    RecordingDate         date             NULL,
    IsSkipped             bit              NOT NULL,
    SkippedReason         nvarchar(50)     NULL,
    AudioRecordingLink    nvarchar(100)    NULL,
    VideoRecordingLink    nvarchar(10)     NULL,
    CONSTRAINT PK12 PRIMARY KEY NONCLUSTERED (LessonTrackerId)
)
go



IF OBJECT_ID('LessonTracker') IS NOT NULL
    PRINT '<<< CREATED TABLE LessonTracker >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE LessonTracker >>>'
go

/* 
 * TABLE: Member 
 */

CREATE TABLE Member(
    MemberId                     int             IDENTITY(1,1),
    ClassId                      int             NOT NULL,
    Marriage                     int             NULL,
    GroupId                      int             NULL,
    FirstName                    nvarchar(50)    NULL,
    MiddleName                   nvarchar(50)    NULL,
    LastName                     nvarchar(10)    NULL,
    NickName                     nvarchar(20)    NULL,
    WeChatId                     nvarchar(50)    NULL,
    Age                          smallint        NOT NULL,
    Occupation                   nvarchar(20)    NULL,
    Spouse                       nvarchar(50)    NULL,
    EmergencyContact             nvarchar(50)    NULL,
    EmergencyPhoneNumber         nvarchar(50)    NULL,
    EmergencyContactRelation     nvarchar(20)    NULL,
    HealthIssue                  nvarchar(50)    NULL,
    MedicalTrainingIsDoctor      bit             NULL,
    MedicalTrainingIsNurse       bit             NULL,
    MedicalTrainingCPR           bit             NULL,
    MedicalTrainingOther         nvarchar(20)    NULL,
    Email                        nvarchar(50)    NULL,
    Password                     nvarchar(50)    NULL,
    Mobile                       nvarchar(20)    NULL,
    HomePhone                    nvarchar(20)    NULL,
    Addr1                        nvarchar(20)    NULL,
    Addr2                        nvarchar(20)    NULL,
    City                         nvarchar(20)    NULL,
    StateProvince                nvarchar(20)    NULL,
    PostalCode                   nvarchar(20)    NULL,
    Country                      nvarchar(20)    NULL,
    JoinOnlyWChild               bit             NULL,
    AttendingChurch              int             NULL,
    IsRegisteredChurchMemeber    bit             NULL,
    PreferredLanguage            int             NULL,
    RegistrationDate             date            NULL,
    GroupAssignedDate            date            NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (MemberId, ClassId)
)
go



IF OBJECT_ID('Member') IS NOT NULL
    PRINT '<<< CREATED TABLE Member >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Member >>>'
go

/* 
 * TABLE: MemberChild 
 */

CREATE TABLE MemberChild(
    MemberId    int             NOT NULL,
    Name        nvarchar(50)    NOT NULL,
    Grade       int             NULL,
    ClassId     int             NULL,
    CONSTRAINT PK14 PRIMARY KEY NONCLUSTERED (MemberId, Name)
)
go



IF OBJECT_ID('MemberChild') IS NOT NULL
    PRINT '<<< CREATED TABLE MemberChild >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE MemberChild >>>'
go

/* 
 * TABLE: Question 
 */

CREATE TABLE Question(
    LessonNum               smallint         NOT NULL,
    StudyId                 int              NOT NULL,
    QuestionNum             smallint         NOT NULL,
    WeekDayNum              smallint         NOT NULL,
    VerseRefInEnglish       nvarchar(100)    NULL,
    VerseRefInSimChinese    nvarchar(100)    NULL,
    VerseRefInComChinese    nvarchar(100)    NULL,
    QuestionInEnglish       nvarchar(200)    NULL,
    QuestionInSimChinese    nvarchar(200)    NULL,
    QuestionInComChinese    nvarchar(200)    NULL,
    CONSTRAINT PK11 PRIMARY KEY NONCLUSTERED (LessonNum, StudyId, QuestionNum)
)
go



IF OBJECT_ID('Question') IS NOT NULL
    PRINT '<<< CREATED TABLE Question >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Question >>>'
go

/* 
 * TABLE: Study 
 */

CREATE TABLE Study(
    StudyId      int             IDENTITY(1,1),
    ClassYear    nvarchar(20)    NULL,
    StudyName    int             NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (StudyId)
)
go



IF OBJECT_ID('Study') IS NOT NULL
    PRINT '<<< CREATED TABLE Study >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Study >>>'
go

/* 
 * TABLE: AreaStaff 
 */

ALTER TABLE AreaStaff ADD CONSTRAINT RefArea4 
    FOREIGN KEY (AreaId)
    REFERENCES Area(AreaId)
go

ALTER TABLE AreaStaff ADD CONSTRAINT RefMember5 
    FOREIGN KEY (MemberId, ClassId)
    REFERENCES Member(MemberId, ClassId)
go

ALTER TABLE AreaStaff ADD CONSTRAINT RefBSFGlossary13 
    FOREIGN KEY (Position)
    REFERENCES BSFGlossary(GlossaryId)
go


/* 
 * TABLE: Attendance 
 */

ALTER TABLE Attendance ADD CONSTRAINT RefMember23 
    FOREIGN KEY (MemberId, ClassId)
    REFERENCES Member(MemberId, ClassId)
go

ALTER TABLE Attendance ADD CONSTRAINT RefLessonTracker25 
    FOREIGN KEY (LessonTrackerId)
    REFERENCES LessonTracker(LessonTrackerId)
go


/* 
 * TABLE: Class 
 */

ALTER TABLE Class ADD CONSTRAINT RefArea6 
    FOREIGN KEY (AreaId)
    REFERENCES Area(AreaId)
go

ALTER TABLE Class ADD CONSTRAINT RefBSFGlossary10 
    FOREIGN KEY (ClassType)
    REFERENCES BSFGlossary(GlossaryId)
go


/* 
 * TABLE: ClassStaff 
 */

ALTER TABLE ClassStaff ADD CONSTRAINT RefClass14 
    FOREIGN KEY (ClassId)
    REFERENCES Class(ClassId)
go

ALTER TABLE ClassStaff ADD CONSTRAINT RefMember15 
    FOREIGN KEY (MemberId, ClassId)
    REFERENCES Member(MemberId, ClassId)
go

ALTER TABLE ClassStaff ADD CONSTRAINT RefBSFGlossary16 
    FOREIGN KEY (Position)
    REFERENCES BSFGlossary(GlossaryId)
go


/* 
 * TABLE: Groups 
 */

ALTER TABLE Groups ADD CONSTRAINT RefMember17 
    FOREIGN KEY (GroupLeader, ClassId)
    REFERENCES Member(MemberId, ClassId)
go

ALTER TABLE Groups ADD CONSTRAINT RefClass31 
    FOREIGN KEY (ClassId)
    REFERENCES Class(ClassId)
go


/* 
 * TABLE: Lesson 
 */

ALTER TABLE Lesson ADD CONSTRAINT RefStudy19 
    FOREIGN KEY (StudyId)
    REFERENCES Study(StudyId)
go


/* 
 * TABLE: LessonTracker 
 */

ALTER TABLE LessonTracker ADD CONSTRAINT RefClass21 
    FOREIGN KEY (ClassId)
    REFERENCES Class(ClassId)
go

ALTER TABLE LessonTracker ADD CONSTRAINT RefLesson22 
    FOREIGN KEY (LessonNum, StudyId)
    REFERENCES Lesson(LessonNum, StudyId)
go


/* 
 * TABLE: Member 
 */

ALTER TABLE Member ADD CONSTRAINT RefGroups8 
    FOREIGN KEY (GroupId, ClassId)
    REFERENCES Groups(GroupId, ClassId)
go

ALTER TABLE Member ADD CONSTRAINT RefBSFGlossary28 
    FOREIGN KEY (Marriage)
    REFERENCES BSFGlossary(GlossaryId)
go

ALTER TABLE Member ADD CONSTRAINT RefChurch29 
    FOREIGN KEY (AttendingChurch)
    REFERENCES Church(ChurchId)
go

ALTER TABLE Member ADD CONSTRAINT RefBSFGlossary30 
    FOREIGN KEY (PreferredLanguage)
    REFERENCES BSFGlossary(GlossaryId)
go

ALTER TABLE Member ADD CONSTRAINT RefClass32 
    FOREIGN KEY (ClassId)
    REFERENCES Class(ClassId)
go


/* 
 * TABLE: MemberChild 
 */

ALTER TABLE MemberChild ADD CONSTRAINT RefMember26 
    FOREIGN KEY (MemberId, ClassId)
    REFERENCES Member(MemberId, ClassId)
go

ALTER TABLE MemberChild ADD CONSTRAINT RefBSFGlossary27 
    FOREIGN KEY (Grade)
    REFERENCES BSFGlossary(GlossaryId)
go


/* 
 * TABLE: Question 
 */

ALTER TABLE Question ADD CONSTRAINT RefLesson20 
    FOREIGN KEY (LessonNum, StudyId)
    REFERENCES Lesson(LessonNum, StudyId)
go


/* 
 * TABLE: Study 
 */

ALTER TABLE Study ADD CONSTRAINT RefBSFGlossary12 
    FOREIGN KEY (StudyName)
    REFERENCES BSFGlossary(GlossaryId)
go


