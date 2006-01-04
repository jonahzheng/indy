{
  $Project$
  $Workfile$
  $Revision$
  $DateUTC$
  $Id$

  This file is part of the Indy (Internet Direct) project, and is offered
  under the dual-licensing agreement described on the Indy website.
  (http://www.indyproject.org/)

  Copyright:
   (c) 1993-2005, Chad Z. Hower and the Indy Pit Crew. All rights reserved.
}
{
  $Log$


    Rev 1.3    2004.02.03 5:45:04 PM  czhower
  Name changes


    Rev 1.2    1/21/2004 1:57:38 PM  JPMugaas
  InitComponent


    Rev 1.1    10/12/2003 2:01:46 PM  BGooijen
  Compiles in DotNet


    Rev 1.0    11/14/2002 02:16:44 PM  JPMugaas
}
unit IdDateTimeStamp;

{
ToDo: Allow localisation date / time strings generated (i.e., to zone name).
ToDo: Rework SetFromRFC822 as it is (marginally) limited by it's   
  conversion to TDateTime.
ToDo: Conversion between Time Zones.
}

{
2002-Feb-07 Pete Mee
 - Modified interface: GetAsRFC882 is now GetAsRFC822. ;-)
 - Fixed GetAsTTimeStamp (was way out).
2001-Nov-10 Pete Mee
 - Added SetFromDOSDateTime.
2001-Mar-29 Pete Mee
 - Fixed bug in SetFromRFC822.  As luck would have it, my PC has changed
  to BST from GMT, so I caught the error.  Change use of GMTToLocalDateTime
  to StrInternetToDateTime.
2001-Mar-27 Pete Mee
 - Added GetTimeZoneHour, GetTimeZoneMinutes, GetTimeZoneAsString and
   corresponding properties, TimeZoneHour, TimeZoneMinutes and TimeZoneAsString.
 - Added SetFromRFC822 and SetFromISO8601.
2001-Mar-26 Pete Mee
 - Fixed bug in AddDays.  Was adding an extra day in the wrong centuary.
 - Fixed bug in AddDays.  Was not altering the year with large additions.
2001-Mar-23 Pete Mee
 - Fixed bug in SubtractMilliseconds.
 - GetBeatOfDay is more accurate (based on milliseconds instead of seconds).
2001-Mar-21 Pete Mee
 - Altered Day, Seond and Millisecond properties to use their respective
   Set methods.
 - Added SetTimeZone, Zero, ZeroTime and ZeroDate.
 - Altered SetYear and SetDay to cope with the value 0.
2000-Sep-16 Pete Mee
 - SetYear no longer accepts zero but instead simply exits.
2000-Aug-01 Pete Mee
 - Fix bugs in AddDays & SubtractDays.  Depending on the day of the year, the
   calculations could have been incorrect.  Now 'rounds off' to the nearest year   
   before any other calculation.
2000-Jul-28 Pete Mee
 - Fix bugs in AddDays & SubtractDays.  3 days in 400 years lost, 1 day in 100
   years lost.
2000-May-11 Pete Mee
 - Added GetAsRFC822, GetAsISO8601
2000-May-03 Pete Mee
 - Added detection of Day, Week and Month (various formats).
2000-May-02 Pete Mee
 - Started TIdDateTimeStamp
}

{
Development notes:

The Calendar used is the Gregorian Calendar (modern western society).  This
Calendar's use started somtime in the 1500s but wasn't adopted by some countries
until the early 1900s.  No attempt is made to cope with any other Calendars.

No attempt is made to cope with any Atomic time quantity less than a leap
year (i.e., an exact number of seconds per day and an exact number of days
per year / leap year - no leap seconds, no 1/4 days, etc).

The implementation revolves around the Milliseconds, Seconds, Days and Years.
The heirarchy is as follows:
Milliseconds modify seconds.  (0-999 Milliseconds)
Seconds modify days.  (0-59 Seconds)
Days modify years.  (1-365/366 Days)
Years modify years. (..., -2, -1, 1, ...)

All other time units are translated into necessary component parts.  I.e.,
a week is 7 days, and hour is 3600 seconds, a minute is 60 seconds, etc...

The implementation could be easily expanded to represent decades, centuries,
nanoseconds, and beyond in both directions.  Milliseconds are included to
provide easy conversion from TTimeStamp and back (and hence TDateTime).  The
current component is designed to give good functionality for the majority (if
not all) of Internet component requirements (including Swatch's Internet Time).
It is also not limited to the 2038 bug of many of today's OSs (32-bit signed
number of seconds from 1st Jan 1970 = 19th Jan 2038 03:14:07, or there abouts).

NB: This implementation is factors slower than those of the TDateTime and
TTimeStamp components of standard Delphi.  It's main use lies in the conversion
to / from ISO 8601 and RFC 822 formats as well as dates ranging beyond 2037 and
before 1970 (though TTimeStamp is capable here).  It's also the only date component
I'm aware of that complies with RFC 2550 "Y10K and Beyond"... one of those RFCs in   
the same category as RFC 1149, IP over Avian Carriers. ;-)

Pete Mee
}

interface
{$i IdCompilerDefines.inc}

uses
  IdBaseComponent,
  IdSys;

const
  // Some basic constants
  IdMilliSecondsInSecond = 1000;
  IdSecondsInMinute = 60;
  IdMinutesInHour = 60;
  IdHoursInDay = 24;

  IdDaysInWeek = 7;
  IdDaysInYear = 365;
  IdDaysInLeapYear = 366;
  IdYearsInShortLeapYearCycle = 4;
  IdDaysInShortLeapYearCycle = IdDaysInLeapYear + (IdDaysInYear * 3);
  IdDaysInShortNonLeapYearCycle = IdDaysInYear * IdYearsInShortLeapYearCycle;
  IdDaysInFourYears = IdDaysInShortLeapYearCycle;
  IdYearsInCentury = 100;
  IdDaysInCentury = (25 * IdDaysInFourYears) - 1;
  IdDaysInLeapCentury = IdDaysInCentury + 1;
  IdYearsInLeapYearCycle = 400;
  IdDaysInLeapYearCycle = IdDaysInCentury * 4 + 1;

  IdMonthsInYear = 12;

  // Beat time is Swatch's "Internet Time" http://www.swatch.com/    {Do not Localize}
  IdBeatsInDay = 1000;

  // Some compound constants
  IdHoursInHalfDay = IdHoursInDay div 2;

  IdSecondsInHour = IdSecondsInMinute * IdMinutesInHour;
  IdSecondsInDay = IdSecondsInHour * IdHoursInDay;
  IdSecondsInHalfDay = IdSecondsInHour * IdHoursInHalfDay;
  IdSecondsInWeek = IdDaysInWeek * IdSecondsInDay;
  IdSecondsInYear = IdSecondsInDay * IdDaysInYear;
  IdSecondsInLeapYear = IdSecondsInDay * IdDaysInLeapYear;

  IdMillisecondsInMinute = IdSecondsInMinute * IdMillisecondsInSecond;
  IdMillisecondsInHour = IdSecondsInHour * IdMillisecondsInSecond;
  IdMillisecondsInDay = IdSecondsInDay * IdMillisecondsInSecond;
  IdMillisecondsInWeek = IdSecondsInWeek * IdMillisecondsInSecond;

  SShortMonthNameJan = 'Jan';
  SShortMonthNameFeb = 'Feb';
  SShortMonthNameMar = 'Mar';
  SShortMonthNameApr = 'Apr';
  SShortMonthNameMay = 'May';
  SShortMonthNameJun = 'Jun';
  SShortMonthNameJul = 'Jul';
  SShortMonthNameAug = 'Aug';
  SShortMonthNameSep = 'Sep';
  SShortMonthNameOct = 'Oct';
  SShortMonthNameNov = 'Nov';
  SShortMonthNameDec = 'Dec';

  SLongMonthNameJan = 'January';
  SLongMonthNameFeb = 'February';
  SLongMonthNameMar = 'March';
  SLongMonthNameApr = 'April';
  SLongMonthNameMay = 'May';
  SLongMonthNameJun = 'June';
  SLongMonthNameJul = 'July';
  SLongMonthNameAug = 'August';
  SLongMonthNameSep = 'September';
  SLongMonthNameOct = 'October';
  SLongMonthNameNov = 'November';
  SLongMonthNameDec = 'December';

  SShortDayNameSun = 'Sun';
  SShortDayNameMon = 'Mon';
  SShortDayNameTue = 'Tue';
  SShortDayNameWed = 'Wed';
  SShortDayNameThu = 'Thu';
  SShortDayNameFri = 'Fri';
  SShortDayNameSat = 'Sat';

  SLongDayNameSun = 'Sunday';
  SLongDayNameMon = 'Monday';
  SLongDayNameTue = 'Tuesday';
  SLongDayNameWed = 'Wednesday';
  SLongDayNameThu = 'Thursday';
  SLongDayNameFri = 'Friday';
  SLongDayNameSat = 'Saturday';

  IdDaysInMonth : array[1..IdMonthsInYear] of byte =
    (
      31, 28, 31, 30, 31, 30,
      31, 31, 30, 31, 30, 31
    );

  IdMonthNames : array[0..IdMonthsInYear] of string =
    ( '',    {Do not Localize} 
      SLongMonthNameJan, SLongMonthNameFeb, SLongMonthNameMar,
      SLongMonthNameApr, SLongMonthNameMay, SLongMonthNameJun,
      SLongMonthNameJul, SLongMonthNameAug, SLongMonthNameSep,
      SLongMonthNameOct, SLongMonthNameNov, SLongMonthNameDec );


  IdMonthShortNames : array[0..IdMonthsInYear] of string =
    ( '', // Used for GetMonth    {Do not Localize}
      SShortMonthNameJan, SShortMonthNameFeb, SShortMonthNameMar,
      SShortMonthNameApr, SShortMonthNameMay, SShortMonthNameJun,
      SShortMonthNameJul, SShortMonthNameAug, SShortMonthNameSep,
      SShortMonthNameOct, SShortMonthNameNov, SShortMonthNameDec );

  IdDayNames : array[0..IdDaysInWeek] of string =
    ( '', SLongDayNameSun, SLongDayNameMon, SLongDayNameTue,    {Do not Localize}
      SLongDayNameWed, SLongDayNameThu, SLongDayNameFri,
      SLongDayNameSat );

  IdDayShortNames : array[0..IdDaysInWeek] of string =
    ( '', SShortDayNameSun, SShortDayNameMon, SShortDayNameTue,    {Do not Localize}
      SShortDayNameWed, SShortDayNameThu, SShortDayNameFri,
      SShortDayNameSat );

  // Area Time Zones
  TZ_NZDT = 13;     // New Zealand Daylight Time
  TZ_IDLE = 12;     // International Date Line East
  TZ_NZST = TZ_IDLE;// New Zealand Standard Time
  TZ_NZT = TZ_IDLE; // New Zealand Time
  TZ_EADT = 11;     // Eastern Australian Daylight Time
  TZ_GST = 10;      // Guam Standard Time / Russia Zone 9
  TZ_JST = 9;       // Japan Standard Time / Russia Zone 8
  TZ_CCT = 8;       // China Coast Time / Russia Zone 7
  TZ_WADT = TZ_CCT; // West Australian Daylight Time
  TZ_WAST = 7;      // West Australian Standard Time / Russia Zone 6
  TZ_ZP6 = 6;       // Chesapeake Bay / Russia Zone 5
  TZ_ZP5 = 5;       // Chesapeake Bay / Russia Zone 4
  TZ_ZP4 = 4;       // Russia Zone 3
  TZ_BT = 3;        // Baghdad Time / Russia Zone 2
  TZ_EET = 2;       // Eastern European Time / Russia Zone 1
  TZ_MEST = TZ_EET; // Middle European Summer Time
  TZ_MESZ = TZ_EET; // Middle European Summer Zone
  TZ_SST = TZ_EET;  // Swedish Summer Time
  TZ_FST = TZ_EET;  // French Summer Time
  TZ_CET = 1;       // Central European Time
  TZ_FWT = TZ_CET;  // French Winter Time
  TZ_MET = TZ_CET;  // Middle European Time
  TZ_MEWT = TZ_CET; // Middle European Winter Time
  TZ_SWT = TZ_CET;  // Swedish Winter Time
  TZ_GMT = 0;       // Greenwich Meanttime
  TZ_UT = TZ_GMT;   // Universla Time
  TZ_UTC = TZ_GMT;  // Universal Time Co-ordinated
  TZ_WET = TZ_GMT;  // Western European Time
  TZ_WAT = -1;      // West Africa Time
  TZ_BST = TZ_WAT;  // British Summer Time
  TZ_AT = -2;       // Azores Time
  TZ_ADT = -3;      // Atlantic Daylight Time
  TZ_AST = -4;      // Atlantic Standard Time
  TZ_EDT = TZ_AST;  // Eastern Daylight Time
  TZ_EST = -5;      // Eastern Standard Time
  TZ_CDT = TZ_EST;  // Central Daylight Time
  TZ_CST = -6;      // Central Standard Time
  TZ_MDT = TZ_CST;  // Mountain Daylight Time
  TZ_MST = -7;      // Mountain Standard Time
  TZ_PDT = TZ_MST; // Pacific Daylight Time
  TZ_PST = -8;      // Pacific Standard Time
  TZ_YDT = TZ_PST;  // Yukon Daylight Time
  TZ_YST = -9;      // Yukon Standard Time
  TZ_HDT = TZ_YST;  // Hawaii Daylight Time
  TZ_AHST = -10;    // Alaska-Hawaii Standard Time
  TZ_CAT  = TZ_AHST;// Central Alaska Time
  TZ_HST = TZ_AHST; // Hawaii Standard Time
  TZ_EAST = TZ_AHST;// East Australian Standard Time
  TZ_NT = -11;      // -None-
  TZ_IDLW = -12;    // International Date Line West

  // Military Time Zones
  TZM_A = TZ_WAT;
  TZM_Alpha = TZM_A;
  TZM_B = TZ_AT;
  TZM_Bravo = TZM_B;
  TZM_C = TZ_ADT;
  TZM_Charlie = TZM_C;
  TZM_D = TZ_AST;
  TZM_Delta = TZM_D;
  TZM_E = TZ_EST;
  TZM_Echo = TZM_E;
  TZM_F = TZ_CST;
  TZM_Foxtrot = TZM_F;
  TZM_G = TZ_MST;
  TZM_Golf = TZM_G;
  TZM_H = TZ_PST;
  TZM_Hotel = TZM_H;
  TZM_J = TZ_YST;
  TZM_Juliet = TZM_J;
  TZM_K = TZ_AHST;
  TZM_Kilo = TZM_K;
  TZM_L = TZ_NT;
  TZM_Lima = TZM_L;
  TZM_M = TZ_IDLW;
  TZM_Mike = TZM_M;
  TZM_N = TZ_CET;
  TZM_November = TZM_N;
  TZM_O = TZ_EET;
  TZM_Oscar = TZM_O;
  TZM_P = TZ_BT;
  TZM_Papa = TZM_P;
  TZM_Q = TZ_ZP4;
  TZM_Quebec = TZM_Q;
  TZM_R = TZ_ZP5;
  TZM_Romeo = TZM_R;
  TZM_S = TZ_ZP6;
  TZM_Sierra = TZM_S;
  TZM_T = TZ_WAST;
  TZM_Tango = TZM_T;
  TZM_U = TZ_CCT;
  TZM_Uniform = TZM_U;
  TZM_V = TZ_JST;
  TZM_Victor = TZM_V;
  TZM_W = TZ_GST;
  TZM_Whiskey = TZM_W;
  TZM_X = TZ_NT;
  TZM_XRay = TZM_X;
  TZM_Y = TZ_IDLE;
  TZM_Yankee = TZM_Y;
  TZM_Z = TZ_GMT;
  TZM_Zulu = TZM_Z;

type
  { TODO: I'm sure these are stored in a unit elsewhere... need to find out }    {Do not Localize}
  TDays = (TDaySun, TDayMon, TDayTue, TDayWed, TDayThu, TDayFri, TDaySat);
  TMonths = (TMthJan, TMthFeb, TMthMar, TMthApr, TMthMay, TMthJun,
             TMthJul, TMthAug, TMthSep, TMthOct, TMthNov, TMthDec);

  TIdDateTimeStamp = class(TIdBaseComponent)
  protected
    FDay : Integer;
    FIsLeapYear : Boolean;
    FMillisecond : Integer;
    FSecond : Integer;
    FTimeZone : Integer;  // Number of minutes + / - from GMT / UTC
    FYear : Integer;

    procedure CheckLeapYear;
    procedure SetDateFromISO8601(AString : String);
    procedure SetTimeFromISO8601(AString : String);
    procedure InitComponent; override;
  public
    destructor Destroy; override;

    procedure AddDays(ANumber : Cardinal);
    procedure AddHours(ANumber : Cardinal);
    procedure AddMilliseconds(ANumber : Cardinal);
    procedure AddMinutes(ANumber : Cardinal);
    procedure AddMonths(ANumber : Cardinal);
    procedure AddSeconds(ANumber : Cardinal);
    procedure AddTDateTime(ADateTime : TIdDateTime);
    procedure AddTIdDateTimeStamp(AIdDateTime : TIdDateTimeStamp);
    procedure AddTTimeStamp(ATimeStamp : TIdDateTimeStamp);
    procedure AddWeeks(ANumber : Cardinal);
    procedure AddYears(ANumber : Cardinal);

    function GetAsISO8601Calendar : String;
    function GetAsISO8601Ordinal : String;
    function GetAsISO8601Week : String;
    function GetAsRFC822 : String;
{TODO :    function GetAsRFC977DateTime : String;}
    function GetAsTDateTime : TIdDateTime;
    function GetAsTTimeStamp : TIdDateTimeStamp;
    function GetAsTimeOfDay : String; // HH:MM:SS

    function GetBeatOfDay : Integer;
    function GetDaysInYear : Integer;
    function GetDayOfMonth : Integer;
    function GetDayOfWeek : Integer;
    function GetDayOfWeekName : String;
    function GetDayOfWeekShortName : String;
    function GetHourOf12Day : Integer;
    function GetHourOf24Day : Integer;
    function GetIsMorning : Boolean;
    function GetMinuteOfDay : Integer;
    function GetMinuteOfHour : Integer;
    function GetMonthOfYear : Integer;
    function GetMonthName : String;
    function GetMonthShortName : String;
    function GetSecondsInYear : Integer;
    function GetSecondOfMinute : Integer;
    function GetTimeZoneAsString: String;
    function GetTimeZoneHour: Integer;
    function GetTimeZoneMinutes: Integer;
    function GetWeekOfYear : Integer;

    procedure SetFromDOSDateTime(ADate, ATime : Word);
    procedure SetFromISO8601(AString : String);
    procedure SetFromRFC822(AString : String);
    procedure SetFromTDateTime(ADateTime : TIdDateTime);
    procedure SetFromTTimeStamp(ATimeStamp : TIdDateTimeStamp);

    procedure SetDay(ANumber : Integer);
    procedure SetMillisecond(ANumber : Integer);
    procedure SetSecond(ANumber : Integer);
    procedure SetTimeZone(const Value: Integer);
    procedure SetYear(ANumber : Integer);

    procedure SubtractDays(ANumber : Cardinal);
    procedure SubtractHours(ANumber : Cardinal);
    procedure SubtractMilliseconds(ANumber : Cardinal);
    procedure SubtractMinutes(ANumber : Cardinal);
    procedure SubtractMonths(ANumber : Cardinal);
    procedure SubtractSeconds(ANumber : Cardinal);
    procedure SubtractTDateTime(ADateTime : TIdDateTime);
    procedure SubtractTIdDateTimeStamp(AIdDateTime : TIdDateTimeStamp);
    procedure SubtractTTimeStamp(ATimeStamp : TIdDateTimeStamp);
    procedure SubtractWeeks(ANumber : Cardinal);
    procedure SubtractYears(ANumber : Cardinal);

    procedure Zero;
    procedure ZeroDate;
    procedure ZeroTime;

    property AsISO8601Calendar : String read GetAsISO8601Calendar;
    property AsISO8601Ordinal : String read GetAsISO8601Ordinal;
    property AsISO8601Week : String read GetAsISO8601Week;
    property AsRFC822 : String read GetAsRFC822;
    property AsTDateTime : TIdDateTime read GetAsTDateTime;
    property AsTTimeStamp : TIdDateTimeStamp read GetAsTTimeStamp;
    property AsTimeOfDay : String read GetAsTimeOfDay;
    property BeatOfDay : Integer read GetBeatOfDay;
    property Day : Integer read FDay write SetDay;
    property DaysInYear : Integer read GetDaysInYear;
    property DayOfMonth : Integer read GetDayOfMonth;
    property DayOfWeek : Integer read GetDayOfWeek;
    property DayOfWeekName : String read GetDayOfWeekName;
    property DayOfWeekShortName : String read GetDayOfWeekShortName;
    property HourOf12Day : Integer read GetHourOf12Day;
    property HourOf24Day : Integer read GetHourOf24Day;
    property IsLeapYear : Boolean read FIsLeapYear;
    property IsMorning : Boolean read GetIsMorning;
    property Millisecond : Integer read FMillisecond write SetMillisecond;
    property MinuteOfDay : Integer read GetMinuteOfDay;
    property MinuteOfHour : Integer read GetMinuteOfHour;
    property MonthOfYear : Integer read GetMonthOfYear;
    property MonthName : String read GetMonthName;
    property MonthShortName : String read GetMonthShortName;
    property Second : Integer read FSecond write SetSecond;
    property SecondsInYear : Integer read GetSecondsInYear;
    property SecondOfMinute : Integer read GetSecondOfMinute;
    property TimeZone : Integer read FTimeZone write SetTimeZone;
    property TimeZoneHour : Integer read GetTimeZoneHour;
    property TimeZoneMinutes : Integer read GetTimeZoneMinutes;
    property TimeZoneAsString : String read GetTimeZoneAsString;
    property Year : Integer read FYear write SetYear;
    property WeekOfYear : Integer read GetWeekOfYear;
  end;

implementation

uses
  IdGlobal,
  IdGlobalProtocols,
  IdStrings;

const
  MaxWeekAdd : Cardinal = $FFFFFFFF div IdDaysInWeek;
  MaxMinutesAdd : Cardinal = $FFFFFFFF div IdSecondsInMinute;
  DIGITS : String = '0123456789'; {Do not Localize}


function DateTimeToTimeStamp(ADateTime: TIdDateTime): TIdDateTimeStamp;
var
  Year,
  Month,
  Day,
  Hour,
  Minute,
  Second,
  MSec: Word;
begin
  Sys.DecodeDate(ADateTime, Year, Month, Day);
  Sys.DecodeTime(ADateTime, Hour, Minute, Second, MSec);
  Result := TIdDateTimeStamp.Create;
  Result.Zero;
  Result.AddYears(Year);
  Result.AddMonths(Month);
  Result.AddDays(Day);
  Result.AddHours(Hour);
  Result.AddMinutes(Minute);
  Result.AddSeconds(Second);
  Result.AddMilliseconds(MSec);
end;

procedure ValidateTimeStamp(const ATimeStamp: TIdDateTimeStamp);
begin
  IdGlobal.ToDo;
//  if (ATimeStamp.Time < 0) or (ATimeStamp.Date <= 0) then
//    EIdExceptionBase.CreateFmt('''%d.%d'' is not a valid timestamp', [ATimeStamp.Date, ATimeStamp.Time]);
end;

function TimeStampToDateTime(const ATimeStamp: TIdDateTimeStamp): TIdDateTime;
begin
  ValidateTimeStamp(ATimeStamp);
  Result := Sys.EncodeDate(ATimeStamp.Year, ATimeStamp.MonthOfYear, ATimeStamp.Day) +
            Sys.EncodeTime(ATimeStamp.HourOf24Day, ATimeStamp.MinuteOfHour, ATimeStamp.SecondOfMinute, ATimeStamp.Millisecond);
end;

/////////////
// IdDateTime
/////////////

procedure TIdDateTimeStamp.InitComponent;
begin
  inherited InitComponent;
  Zero;
  FTimeZone := 0;
end;

destructor TIdDateTimeStamp.Destroy;
begin
  inherited Destroy;
end;

procedure TIdDateTimeStamp.AddDays;
var
  i : Integer;
begin
  // First 'round off' the current day of the year.  This is done to prevent    {Do not Localize}
  // miscalculations in leap years and also as an optimisation for small
  // increments.
  if (ANumber > Cardinal(DaysInYear - FDay)) and (not (FDay = 1)) then begin
    ANumber := ANumber - Cardinal(DaysInYear - FDay);
    FDay := 0;
    AddYears(1);
  end else begin
    // The number of days added is contained within this year.
    FDay := FDay + Integer(ANumber);
    if (FDay > DaysInYear) then
    begin
      ANumber := FDay;
      FDay := 0;
      AddDays(ANumber);
    end;
    Exit;
  end;

  if ANumber >= IdDaysInLeapYearCycle then begin
    i := ANumber div IdDaysInLeapYearCycle;
    AddYears(i * IdYearsInLeapYearCycle);
    ANumber := ANumber - Cardinal(i * IdDaysInLeapYearCycle);
  end;

  if ANumber >= IdDaysInLeapCentury then begin
    while ANumber >= IDDaysInLeapCentury do begin
      i := FYear div 100;

      if i mod 4 = 3 then begin
        // Going forward through a 'leap' century    {Do not Localize}
        AddYears(IdYearsInCentury);
        ANumber := ANumber - Cardinal(IdDaysInLeapCentury);
      end else begin
        AddYears(IdYearsInCentury);
        ANumber := ANumber - Cardinal(IdDaysInCentury);
      end;
    end;
  end;

  if ANumber >= IdDaysInShortLeapYearCycle then begin
    i := ANumber div IdDaysInShortLeapYearCycle;
    AddYears(i * IdYearsInShortLeapYearCycle);
    ANumber := ANumber - Cardinal(i * IdDaysInShortLeapYearCycle);
  end;

  i := GetDaysInYear;
  while Integer(ANumber) > i do begin
    AddYears(1);
    Dec(ANumber, i);
    i := GetDaysInYear;
  end;

  if FDay + Integer(ANumber) > i then begin
    AddYears(1);
    Dec(ANumber, i - FDay);
    FDay := ANumber;
  end else begin
    Inc(FDay, ANumber);
  end;
end;

procedure TIdDateTimeStamp.AddHours;
var
  i : Cardinal;
begin
  i := ANumber div IdHoursInDay;
  AddDays(i);
  Dec(ANumber, i * IdHoursInDay);
  AddSeconds(ANumber * IdSecondsInHour);
end;

procedure TIdDateTimeStamp.AddMilliseconds;
var
  i : Cardinal;
begin
    i := ANumber div IdMillisecondsInDay;
    if i > 0 then begin
      AddDays(i);
      Dec(ANumber, i * IdMillisecondsInDay);
    end;

    i := ANumber div IdMillisecondsInSecond;
    if i > 0 then begin
      AddSeconds(i);
      Dec(ANumber, i * IdMillisecondsInSecond);
    end;

    Inc(FMillisecond, ANumber);
    while FMillisecond > IdMillisecondsInSecond do begin
      // Should only happen once...
      AddSeconds(1);
      Dec(FMillisecond, IdMillisecondsInSecond);
    end;
end;

procedure TIdDateTimeStamp.AddMinutes;
begin
  // Convert down to seconds
  while ANumber > MaxMinutesAdd do begin
    AddSeconds(MaxMinutesAdd);
    Dec(ANumber, MaxMinutesAdd);
  end;

  AddSeconds(ANumber * IdSecondsInMinute);
end;

procedure TIdDateTimeStamp.AddMonths;
var
  i : Integer;
begin
  i := ANumber div IdMonthsInYear;
  AddYears(i);
  Dec(ANumber, i * IdMonthsInYear);

  while ANumber > 0 do begin
    i := MonthOfYear;
    if i = 12 then begin
      i := 1;
    end;
    if (i = 2) and (IsLeapYear) then begin
      AddDays(IdDaysInMonth[i] + 1);
    end else begin
      AddDays(IdDaysInMonth[i]);
    end;

    Dec(ANumber);
  end;
end;

procedure TIdDateTimeStamp.AddSeconds;
var
  i : Cardinal;
begin
  i := ANumber Div IdSecondsInDay;
  if i > 0 then begin
    AddDays(i);
    ANumber := ANumber - (i * IdSecondsInDay);
  end;

  Inc(FSecond, ANumber);
  while FSecond > IdSecondsInDay do begin
    // Should only ever happen once...
    AddDays(1);
    Dec(FSecond, IdSecondsInDay);
  end;
end;

procedure TIdDateTimeStamp.AddTDateTime;
begin
// todo:
//  AddTTimeStamp(DateTimeToTimeStamp(ADateTime));
end;

procedure TIdDateTimeStamp.AddTIdDateTimeStamp;
begin
  { TODO : Check for accuracy }
  AddYears(AIdDateTime.Year);
  AddDays(AIdDateTime.Day);
  AddSeconds(AIdDateTime.Second);
  AddMilliseconds(AIdDateTime.Millisecond);
end;

procedure TIdDateTimeStamp.AddTTimeStamp;
begin
  AddTIdDateTimeStamp(ATimeStamp);
end;

procedure TIdDateTimeStamp.AddWeeks;
begin
  // Cannot add years as there are not exactly 52 weeks in the year and there
  // is no exact match between weeks and the 400 year leap cycle
  
  // Convert down to days...
  while ANumber > MaxWeekAdd do begin
    AddDays(MaxWeekAdd);
    Dec(ANumber, MaxWeekAdd);
  end;

  AddDays(ANumber * IdDaysInWeek);
end;

procedure TIdDateTimeStamp.AddYears;
begin
  {TODO: Capture overflow because adding Cardinal to Integer }
  if (FYear <= -1) and (Integer(ANumber) >= -FYear) then begin
    Inc(ANumber);
  end;
  Inc(FYear, ANumber);
  CheckLeapYear;
end;

procedure TIdDateTimeStamp.CheckLeapYear;
begin
  // Nested if done to prevent unnecessary calcs on slower machines
  if FYear mod 4 = 0 then begin
    if FYear mod 100 = 0 then begin
      if FYear mod 400 = 0 then begin
        FIsLeapYear := True;
      end else begin
        FIsLeapYear := False;
      end;
    end else begin
      FIsLeapYear := True;
    end;
  end else begin
    FIsLeapYear := False;
  end;
  {TODO : If (FIsLeapYear = false) and (FDay = IdDaysInLeapYear) then begin
            and, do what?
  }
end;

function TIdDateTimeStamp.GetAsISO8601Calendar;
begin
  result := Sys.IntToStr(FYear) + '-';    {Do not Localize}
  result := result + Sys.IntToStr(MonthOfYear) + '-';  {Do not Localize}
  result := result + Sys.IntToStr(DayOfMonth) + 'T';   {Do not Localize}
  result := result + AsTimeOfDay;
end;

function TIdDateTimeStamp.GetAsISO8601Ordinal : String;
begin
  result := Sys.IntToStr(FYear) + '-';   {Do not Localize}
  result := result + Sys.IntToStr(FDay) + 'T'; {Do not Localize}
  result := result + AsTimeOfDay;
end;

function TIdDateTimeStamp.GetAsISO8601Week : String;
begin
  result := Sys.IntToStr(FYear) + '-W';    {Do not Localize}
  result := result + Sys.IntToStr(WeekOfYear) + '-'; {Do not Localize}
  result := result + Sys.IntToStr(DayOfWeek) + 'T';   {Do not Localize}
  result := result + AsTimeOfDay;
end;

function TIdDateTimeStamp.GetAsRFC822;
begin
  result := IdDayShortNames[DayOfWeek] + ', ';    {Do not Localize}
  result := result + Sys.IntToStr(DayOfMonth) + ' ';  {Do not Localize}
  result := result + IdMonthShortNames[MonthOfYear] + ' '; {Do not Localize}
  result := result + Sys.IntToStr(Year) + ' ';   {Do not Localize}
  result := result + AsTimeOfDay + ' ';    {Do not Localize}
  result := result + TimeZoneAsString;
end;

function TIdDateTimeStamp.GetAsTDateTime;
begin
  result := TimeStampToDateTime(GetAsTTimeStamp);
end;

function TIdDateTimeStamp.GetAsTTimeStamp;
begin
  Result := Self;
end;

function TIdDateTimeStamp.GetAsTimeOfDay;
var
  i : Integer;
begin
  i := HourOf24Day;
  if i < 10 then begin
    result := result + '0' + Sys.IntToStr(i) + ':';   {Do not Localize}
  end else begin
    result := result + Sys.IntToStr(i) + ':';   {Do not Localize}
  end;
  i := MinuteOfHour;
  if i < 10 then begin
    result := result + '0' + Sys.IntToStr(i) + ':';   {Do not Localize}
  end else begin
    result := result + Sys.IntToStr(i) + ':';   {Do not Localize}
  end;
  i := SecondOfMinute;
  if i < 10 then begin
    result := result + '0' + Sys.IntToStr(i);  {Do not Localize}
  end else begin
    result := result + Sys.IntToStr(i);  {Do not Localize}
  end;
end;

function TIdDateTimeStamp.GetBeatOfDay;
var
  i64 : Int64;
  DTS : TIdDateTimeStamp;
begin
  // Check
  if FTimeZone <> TZ_MET then
  begin
    // Rather than messing about with this instance, create
    // a new one.
    DTS := TIdDateTimeStamp.Create(Self);
    try
      DTS.SetYear(FYear);
      DTS.SetDay(FDay);
      DTS.SetSecond(FSecond);
      DTS.SetMillisecond(FMillisecond);
      DTS.SetTimeZone(TZ_MET);
      DTS.AddMinutes( (TZ_MET * IdMinutesInHour) - FTimeZone);
      result := DTS.GetBeatOfDay;
    finally
      DTS.Free;
    end;
  end else
  begin
    i64 := (FSecond * IdMillisecondsInSecond) + FMillisecond;
    i64 := i64 * IdBeatsInDay;
    i64 := i64 div IdMillisecondsInDay;
    result := Integer(i64);
  end;
end;

function TIdDateTimeStamp.GetDaysInYear;
begin
  if IsLeapYear then begin
    result := IdDaysInLeapYear;
  end else begin
    result := IdDaysInYear;
  end;
end;

function TIdDateTimeStamp.GetDayOfMonth;
var
  count, mnth, days : Integer;
begin
  mnth := MonthOfYear;
  if IsLeapYear and (mnth > 2) then begin
    days := 1;
  end else begin
    days := 0;
  end;
  for count := 1 to mnth - 1 do begin
    Inc(days, IdDaysInMonth[count]);
  end;
  days := Day - days;
  if days < 0 then begin
    result := 0;
  end else begin
    result := days;    
  end;
end;

function TIdDateTimeStamp.GetDayOfWeek;
var
  a, y, m, d, mnth : Integer;
begin
  // Thanks to the "FAQ About Calendars" by Claus T�ndering for this algorithm
  // http://www.tondering.dk/claus/calendar.html
  mnth := MonthOfYear;
  a := (14 - mnth) div 12;
  y := Year - a;
  m := mnth + (12 * a) - 2;
  d := DayOfMonth + y + (y div 4) - (y div 100) + (y div 400) + ((31 * m) div 12);
  d := d mod 7;
  result := d + 1;
end;

function TIdDateTimeStamp.GetDayOfWeekName;
begin
  result := IdDayNames[GetDayOfWeek];
end;

function TIdDateTimeStamp.GetDayOfWeekShortName;
begin
  result := IdDayShortNames[GetDayOfWeek];
end;

function TIdDateTimeStamp.GetHourOf12Day;
var
  hr : Integer;
begin
  hr := GetHourOf24Day;
  if hr > IdHoursInHalfDay then begin
    Dec(hr, IdHoursInHalfDay);
  end;
  result := hr;
end;

function TIdDateTimeStamp.GetHourOf24Day;
begin
  result := (Second) div IdSecondsInHour;
end;

function TIdDateTimeStamp.GetIsMorning;
begin
  if Second <= (IdSecondsInHalFDay + 1) then begin
    result := True;
  end else begin
    result := False;
  end;
end;

function TIdDateTimeStamp.GetMinuteOfDay;
begin
  result := Second div IdSecondsInMinute;
end;

function TIdDateTimeStamp.GetMinuteOfHour;
begin
  result := GetMinuteOfDay - (IdMinutesInHour * (GetHourOf24Day));
end;

function TIdDateTimeStamp.GetMonthOfYear;
var
  AddOne, Count : Byte;
  Today : Integer;
begin
  if IsLeapYear then begin
    AddOne := 1;
  end else begin
    AddOne := 0;
  end;
  Today := Day;
  Count := 1;
  result := 0;
  while Count <> 13 do begin
    if Count = 2 then begin
      if Today > IdDaysInMonth[Count] + AddOne then begin
        Dec(Today, IdDaysInMonth[Count] + AddOne);
      end else begin
        result := Count;
        break;
      end;
    end else begin
      if Today > IdDaysInMonth[Count] then begin
        Dec(Today, IdDaysInMonth[Count]);
      end else begin
        result := Count;
        break;
      end;
    end;
    Inc(Count);
  end;      
end;

function TIdDateTimeStamp.GetMonthName;
begin
  result := IdMonthNames[MonthOfYear];  
end;

function TIdDateTimeStamp.GetMonthShortName;
begin
  result := IdMonthShortNames[MonthOfYear];
end;

function TIdDateTimeStamp.GetSecondsInYear;
begin
  if IsLeapYear then begin
    result := IdSecondsInLeapYear;
  end else begin
    result := IdSecondsInYear;
  end;
end;

function TIdDateTimeStamp.GetSecondOfMinute;
begin
  result := FSecond - (GetMinuteOfDay * IdSecondsInMinute);
end;

function TIdDateTimeStamp.GetTimeZoneAsString: String;
var
  i : Integer;
begin
  i := GetTimeZoneHour;
  if i < 0 then
  begin
    if i < -9 then
    begin
      result := Sys.IntToStr(i);
    end else
    begin
      result := '-0' + Sys.IntToStr(Abs(i));   {Do not Localize}
    end;
  end else
  begin
    if i <= 9 then
    begin
      result := '+0' + Sys.IntToStr(i);   {Do not Localize}
    end else
    begin
      result := '+' + Sys.IntToStr(i);   {Do not Localize}
    end;
  end;
  i := GetTimeZoneMinutes;
  if i <= 9 then
  begin
    result := result + '0';    {Do not Localize}
  end;
  result := result + Sys.IntToStr(i);
end;

function TIdDateTimeStamp.GetTimeZoneHour: Integer;
begin
  result := FTimeZone div 60;
end;

function TIdDateTimeStamp.GetTimeZoneMinutes: Integer;
begin
  result := Abs(FTimeZone) mod 60;
end;

function TIdDateTimeStamp.GetWeekOfYear;
var
  w : Integer;
  DT : TIdDateTimeStamp;
begin
  DT := TIdDateTimeStamp.Create(Self);
  try
    DT.SetYear(Year);
    w := DT.DayOfWeek; // Get the first day of this year & hence number of
    // days of the first week that are in the previous year
    w := w + Day - 2; // Get complete weeks
    w := w div 7;
    result := w + 1;
  finally
    DT.Free;
  end;
end;

procedure TIdDateTimeStamp.SetFromDOSDateTime(ADate, ATime: Word);
begin
  Zero;
  SetYear(1980);
  AddYears(ADate shr 9);
  AddMonths(((ADate and $1E0) shr 5) - 1);
  AddDays((ADate and $1F) - 1);
  AddHours(ATime shr 11);
  AddMinutes((ATime and $7E0) shr 5);
  AddSeconds((ATime and $1F) - 1);
end;

procedure TIdDateTimeStamp.SetDateFromISO8601(AString: String);
var
  i, week : Integer;
  s : String;
begin
  // AString should be in one of three formats:
  // Calender - YYYY-MM-DD
  // Ordinal - YYYY-XXX  where XXX is the day of the year
  // Week - YYYY-WXX-D  where W is a literal and XX is the week of the year.
  i := IndyPos('-', AString);    {Do not Localize}
  if i > 0 then
  begin
    s := Sys.Trim(Copy(AString, 1, i - 1));
    AString := Sys.Trim(Copy(AString, i + 1, length(AString)));
    i := FindFirstNotOf('0123456789', s);  {Do not Localize}
    if i = 0 then
    begin
      SetYear(Sys.StrToInt(s));
      if length(AString) > 0 then begin

        i := IndyPos('-', AString);     {Do not Localize}

        if (AString[1] = 'W') or (AString[1] = 'w') then  {Do not Localize}
        begin
          // Week format
          s := Sys.Trim(Copy(AString, 2, i - 2));
          AString := Sys.Trim(Copy(AString, i + 1, length(AString)));

          week := -1;
          i := -1;
          if (length(AString) > 0)
          and (FindFirstNotOf(DIGITS, AString) = 0) then
          begin
            i := Sys.StrToInt(AString);
          end;

          if (Length(s) > 0)
          and (FindFirstNotOf(DIGITS, AString) = 0) then
          begin
            week := Sys.StrToInt(s);
          end;

          if (week > 0) and (i >= 0) then
          begin
            Dec(week);
            FDay := 1 + (IdDaysInWeek * week);

            // Now have the correct week of the year
            if i < GetDayOfWeek then begin
              SubtractDays(GetDayOfWeek - i);
            end else begin
              AddDays(i - GetDayOfWeek);
            end;
          end;

        end else if i > 0 then
        begin
          // Calender format
          s := Sys.Trim(Copy(AString, 1, i - 1));
          AString := Sys.Trim(Copy(AString, i + 1, length(AString)));
          // Set the day first due to internal format.
          if (length(AString) > 0)
          and (FindFirstNotOf(DIGITS, s) = 0) then
          begin
            SetDay(Sys.StrToInt(AString));
          end;
          
          // Add the months.
          if (length(s) > 0) and (FindFirstNotOf(DIGITS, s) = 0) then
          begin
            AddMonths(Sys.StrToInt(s) - 1);
          end;
        end else
        begin
          // Ordinal format
          i := FindFirstNotOf(DIGITS, AString);
          if i = 0 then begin
            SetDay(Sys.StrToInt(AString));
          end;
        end;

      end;
    end;
  end;
end;

procedure TIdDateTimeStamp.SetTimeFromISO8601(AString: String);
var
  i : Integer;
  Hour, Minute : String;
begin
  // AString should be in the format of HH:MM:SS where : is a literal.
  i := IndyPos(':', AString);      {Do not Localize}
  Hour := Sys.Trim(Copy(AString, 1, i - 1));
  AString := Sys.Trim(Copy(AString, i + 1, length(AString)));

  i := IndyPos(':', AString);      {Do not Localize}
  Minute := Sys.Trim(Copy(AString, 1, i - 1));
  AString := Sys.Trim(Copy(AString, i + 1, Length(Astring)));

  // Set seconds first due to internal format.
  if (length(AString) > 0)
  and (FindFirstNotOf(DIGITS, AString) = 0) then
  begin
    SetSecond(Sys.StrToInt(AString));
  end;

  if (length(Minute) > 0)
  and (FindFirstNotOf(DIGITS, Minute) = 0) then
  begin
    AddMinutes(Sys.StrToInt(Minute));
  end;  

  if (length(Hour) > 0)
  and (FindFirstNotOf(DIGITS, Hour) = 0) then
  begin
    AddHours(Sys.StrToInt(Hour));
  end;
end;

procedure TIdDateTimeStamp.SetFromISO8601(AString: String);
var
  i : Integer;
begin
  Zero;
  i := IndyPos('T', AString);  {Do not Localize}
  if i > 0 then
  begin
    SetDateFromISO8601(Sys.Trim(Copy(AString, 1, i - 1)));
    SetTimeFromISO8601(Sys.Trim(Copy(AString, i + 1, length(AString))));
  end else
  begin
    SetDateFromISO8601(AString);
    SetTimeFromISO8601(AString);
  end;
end;

procedure TIdDateTimeStamp.SetFromRFC822(AString: String);
begin
  SetFromTDateTime(StrInternetToDateTime(AString))
end;

procedure TIdDateTimeStamp.SetFromTDateTime;
var
  aStamp:TIdDateTimeStamp;
begin
  aStamp:=DateTimeToTimeStamp(ADateTime);
  try
    SetFromTTimeStamp(aStamp);
  finally
    Sys.FreeAndNil(aStamp);
  end;
end;

procedure TIdDateTimeStamp.SetFromTTimeStamp;
begin
  FDay := ATimeStamp.Day;
  FMillisecond := ATimeStamp.Millisecond;
  FIsLeapYear := ATimeStamp.IsLeapYear;
  FSecond := ATimeStamp.Second;
  FTimeZone := ATimeStamp.TimeZone;
  FYear := ATimeStamp.Year;
end;

procedure TIdDateTimeStamp.SetDay;
begin
  if ANumber > 0 then begin
    FDay := 0;
    AddDays(ANumber);
  end else begin
    FDay := 1;
  end;
end;

procedure TIdDateTimeStamp.SetMillisecond;
begin
  FMillisecond := 0;
  AddMilliseconds(ANumber);
end;

procedure TIdDateTimeStamp.SetSecond;
begin
  FSecond := 0;
  AddSeconds(ANumber);
end;

procedure TIdDateTimeStamp.SetTimeZone(const Value: Integer);
begin
  FTimeZone := Value;
end;

procedure TIdDateTimeStamp.SetYear;
begin
  If ANumber = 0 then begin
    FYear := 1;
  end else begin
    FYear := ANumber;
  end;
  CheckLeapYear;
end;

procedure TIdDateTimeStamp.SubtractDays;
var
  i : Integer;
begin
  if ANumber = 0 then exit;

  // First remove the number of days in this year.  As with AddDays this
  // is both an optimisation and a fix for calculations that begin in leap years.
  if ANumber >= Cardinal(FDay - 1) then begin
    ANumber := ANumber - Cardinal(FDay - 1);
    FDay := 1;
  end else begin
    FDay := FDay - Integer(ANumber);
  end;

  // Subtract the number of whole leap year cycles = 400 years
  if ANumber >= IdDaysInLeapYearCycle then begin
    i := ANumber div IdDaysInLeapYearCycle;
    SubtractYears(i * IdYearsInLeapYearCycle);
    ANumber := ANumber - Cardinal(i * IdDaysInLeapYearCycle);
  end;

  // Next subtract the centuries, checking for the century that is passed through
  if ANumber >= IdDaysInLeapCentury then begin
    while ANumber >= IdDaysInLeapCentury do begin
      i := FYear div 100;

      if i mod 4 = 0 then begin
        // Going back through a 'leap' century    {Do not Localize}
        SubtractYears(IdYearsInCentury);
        ANumber := ANumber - Cardinal(IdDaysInLeapCentury);
      end else begin
        SubtractYears(IdYearsInCentury);
        ANumber := ANumber - Cardinal(IdDaysInCentury);
      end;
    end;
  end;

  // Subtract multiples of 4 ("Short" Leap year cycle)
  if ANumber >= IdDaysInShortLeapYearCycle then begin
    while ANumber >= IdDaysInShortLeapYearCycle do begin

      // Round off current year to nearest four.
      i := (FYear shr 2) shl 2;
      if Sys.IsLeapYear(i) then begin
        // Normal
        SubtractYears(IdYearsInShortLeapYearCycle);
        ANumber := ANumber - Cardinal(IdDaysInShortLeapYearCycle);
      end else begin
        // Subtraction crosses a 100-year (but not 400-year) boundary. Add the
        // same number of years, but one less day.
        SubtractYears(IdYearsInShortLeapYearCycle);
        ANumber := ANumber - Cardinal(IdDaysInShortNonLeapYearCycle);
      end;
    end;
  end;

  // Now the individual years
  while ANumber > Cardinal(DaysInYear) do begin
    SubtractYears(1);
    Dec(ANumber, DaysInYear);
    if Self.IsLeapYear then begin
      // Correct the assumption of a non-leap year
      AddDays(1);
    end;
  end;

  // and finally the remainders
  if ANumber >= Cardinal(FDay) then begin
    SubtractYears(1);
    ANumber := ANumber - Cardinal(FDay);
    Day := DaysInYear - Integer(ANumber);
  end else begin
    Dec(FDay, ANumber);
  end;

end;

procedure TIdDateTimeStamp.SubtractHours;
var
  i : Cardinal;
begin
  i := ANumber div IdHoursInDay;
  SubtractDays(i);
  Dec(ANumber, i * IdHoursInDay);

  SubtractSeconds(ANumber * IdSecondsInHour);
end;

procedure TIdDateTimeStamp.SubtractMilliseconds;
var
  i : Cardinal;
begin
  if ANumber = 0 then exit;

  i := ANumber div IdMillisecondsInDay;
  SubtractDays(i);
  Dec(ANumber, i * IdMillisecondsInDay);

  i := ANumber div IdMillisecondsInSecond;
  SubtractSeconds(i);
  Dec(ANumber, i * IdMillisecondsInSecond);

  Dec(FMillisecond, ANumber);
  while FMillisecond <= 0 do begin
    SubtractSeconds(1);
    // FMillisecond is already negative, so add it.
    FMillisecond := IdMillisecondsInSecond + FMillisecond;
  end; 
end;

procedure TIdDateTimeStamp.SubtractMinutes(ANumber : Cardinal);
begin
  // Down size to seconds
  while ANumber > MaxMinutesAdd do begin
    SubtractSeconds(MaxMinutesAdd * IdSecondsInMinute);
    Dec(ANumber, MaxMinutesAdd);
  end;
  SubtractSeconds(ANumber * IdSecondsInMinute);
end;

procedure TIdDateTimeStamp.SubtractMonths;
var
  i : Integer;
begin
  i := ANumber div IdMonthsInYear;
  SubtractYears(i);
  Dec(ANumber, i * IdMonthsInYear);

  while ANumber > 0 do begin
    i := MonthOfYear;
    if i = 1 then begin
      i := 13;
    end;
    if (i = 3) and (IsLeapYear) then begin
      SubtractDays(IdDaysInMonth[2] + 1);
    end else begin
      SubtractDays(IdDaysInMonth[i - 1]);
    end;
    Dec(ANumber);
  end;
end;

procedure TIdDateTimeStamp.SubtractSeconds(ANumber : Cardinal);
var
  i : Cardinal;
begin
  if ANumber = 0 then exit;

  i := ANumber div IdSecondsInDay;
  SubtractDays(i);
  Dec(ANumber, i * IdSecondsInDay);

  Dec(FSecond, ANumber);
  If FSecond < 0 then begin
    SubtractDays(1);
    FSecond := IdSecondsInDay + FSecond;
  end;
end;

procedure TIdDateTimeStamp.SubtractTDateTime;
begin
  SubtractTIdDateTimeStamp(DateTimeToTimeStamp(ADateTime));
end;

procedure TIdDateTimeStamp.SubtractTIdDateTimeStamp;
begin
  { TODO : Check for accuracy }
  SubtractYears(AIdDateTime.Year);
  SubtractDays(AIdDateTime.Day);
  SubtractSeconds(AIdDateTime.Second);
  SubtractMilliseconds(AIdDateTime.Millisecond);
end;

procedure TIdDateTimeStamp.SubtractTTimeStamp;
begin
  SubtractTIdDateTimeStamp(ATimeStamp);
end;

procedure TIdDateTimeStamp.SubtractWeeks(ANumber : Cardinal);
begin
  if ANumber = 0 then exit;

  // Down size to subtracting Days
  while ANumber > MaxWeekAdd do begin
    SubtractDays(MaxWeekAdd * IdDaysInWeek);
    Dec(ANumber, MaxWeekAdd * IdDaysInWeek);
  end;
  SubtractDays(ANumber * IdDaysInWeek);
end;

procedure TIdDateTimeStamp.SubtractYears;
begin
  if (FYear > 0) and (ANumber >= Cardinal(FYear)) then begin
    Inc(ANumber);
  end;

  FYear := FYear - Integer(ANumber);
  CheckLeapYear;
end;

procedure TIdDateTimeStamp.Zero;
begin
  ZeroDate;
  ZeroTime;
  FTimeZone := 0;
end;

procedure TIdDateTimeStamp.ZeroDate;
begin
  SetYear(1);
  SetDay(1);
end;

procedure TIdDateTimeStamp.ZeroTime;
begin
  SetSecond(0);
  SetMillisecond(0);
end;

end.
