//
//  addcontroller.m
//  WorldClock
//
//  Created by WPP Administrator on 10/7/13.
//  Copyright (c) 2013 Eric Prewitt. All rights reserved.
//

#import "addcontroller.h"

@interface addcontroller()

@end

@implementation addcontroller{
    NSArray *cities;
    NSArray *citytimezones;
    NSArray *searchResults;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
       
    [super viewDidLoad];
    citytimezones = [NSArray arrayWithObjects:
                     @"(GMT) ",
                     @"(GMT) ",
                     @"(GMT+3) ",
                     @"(GMT+1) ",
                     @"(GMT+3) ",
                     @"(GMT) ",
                     @"(GMT+1) ",
                     @"(GMT) ",
                     @"(GMT) ",
                     @"(GMT+2) ",
                     @"(GMT+1) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT) ",
                     @"(GMT+2) ",
                     @"(GMT) ",
                     @"(GMT) ",
                     @"(GMT+3) ",
                     @"(GMT+3) ",
                     @"(GMT+1) ",
                     @"(GMT) ",
                     @"(GMT) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+3) ",
                     @"(GMT+3) ",
                     @"(GMT+3) ",
                     @"(GMT+2) ",
                     @"(GMT+1) ",
                     @"(GMT+1) ",
                     @"(GMT+1) ",
                     @"(GMT) ",
                     @"(GMT+1) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+1) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+3) ",
                     @"(GMT) ",
                     @"(GMT+3) ",
                     @"(GMT+1) ",
                     @"(GMT+1) ",
                     @"(GMT) ",
                     @"(GMT) ",
                     @"(GMT+1) ",
                     @"(GMT) ",
                     @"(GMT+2) ",
                     @"(GMT+1) ",
                     @"(GMT+2) ",
                     @"(HADT) ",
                     @"(AKDT) ",
                     @"(AST) ",
                     @"(AST) ",
                     @"(GMT-3) ",
                     @"(GMT-3) ",
                     @"(GMT-3) ",
                     @"(GMT-3) ",
                     @"(GMT-3) ",
                     @"(GMT-3) ",
                     @"(GMT-3) ",
                     @"(GMT-3) ",
                     @"(GMT-3) ",
                     @"(GMT-3) ",
                     @"(GMT-4) ",
                     @"(GMT-3) ",
                     @"(GMT-3) ",
                     @"(AST) ",
                     @"(GMT-3) ",
                     @"(EST) ",
                     @"(GMT-3) ",
                     @"(CDT) ",
                     @"(AST) ",
                     @"(GMT-3) ",
                     @"(CST) ",
                     @"(AST) ",
                     @"(GMT-4) ",
                     @"(GMT-5) ",
                     @"(MDT) ",
                     @"(MDT) ",
                     @"(GMT-4) ",
                     @"(CDT) ",
                     @"(GMT-4:30) ",
                     @"(GMT-3) ",
                     @"(EST) ",
                     @"(CDT) ",
                     @"(MDT) ",
                     @"(CST) ",
                     @"(MST) ",
                     @"(GMT-4) ",
                     @"(AST) ",
                     @"(GMT) ",
                     @"(PDT) ",
                     @"(MST) ",
                     @"(MDT) ",
                     @"(EDT) ",
                     @"(AST) ",
                     @"(MDT) ",
                     @"(GMT-4) ",
                     @"(CST) ",
                     @"(GMT-3) ",
                     @"(ADT) ",
                     @"(GMT-2) ",
                     @"(ADT) ",
                     @"(EDT) ",
                     @"(AST) ",
                     @"(AST) ",
                     @"(CST) ",
                     @"(GMT-5) ",
                     @"(GMT-4) ",
                     @"(ADT) ",
                     @"(GMT-4) ",
                     @"(MST) ",
                     @"(EDT) ",
                     @"(CDT) ",
                     @"(EDT) ",
                     @"(EDT) ",
                     @"(CDT) ",
                     @"(EDT) ",
                     @"(EDT) ",
                     @"(EDT) ",
                     @"(MDT) ",
                     @"(EDT) ",
                     @"(EST) ",
                     @"(AKDT) ",
                     @"(EDT) ",
                     @"(EDT) ",
                     @"(AST) ",
                     @"(GMT-4) ",
                     @"(GMT-5) ",
                     @"(PDT) ",
                     @"(AST) ",
                     @"(GMT-3) ",
                     @"(CST) ",
                     @"(GMT-4) ",
                     @"(AST) ",
                     @"(AST) ",
                     @"(CDT) ",
                     @"(MDT) ",
                     @"(CDT) ",
                     @"(CDT) ",
                     @"(PST) ",
                     @"(CDT) ",
                     @"(GMT-2) ",
                     @"(ADT) ",
                     @"(CDT) ",
                     @"(GMT-2) ",
                     @"(EDT) ",
                     @"(AST) ",
                     @"(EDT) ",
                     @"(EDT) ",
                     @"(EDT) ",
                     @"(AKDT) ",
                     @"(GMT-2) ",
                     @"(CDT) ",
                     @"(CDT) ",
                     @"(CDT) ",
                     @"(MDT) ",
                     @"(EST) ",
                     @"(EDT) ",
                     @"(GMT-3) ",
                     @"(MST) ",
                     @"(EDT) ",
                     @"(AST) ",
                     @"(GMT-4) ",
                     @"(AST) ",
                     @"(CDT) ",
                     @"(CDT) ",
                     @"(GMT-3) ",
                     @"(CST) ",
                     @"(CDT) ",
                     @"(GMT-4) ",
                     @"(PDT) ",
                     @"(GMT-3) ",
                     @"(GMT-3) ",
                     @"(AST) ",
                     @"(GMT-3) ",
                     @"(GMT) ",
                     @"(MDT) ",
                     @"(AKDT) ",
                     @"(AST) ",
                     @"(GMT-2:30) ",
                     @"(AST) ",
                     @"(AST) ",
                     @"(AST) ",
                     @"(AST) ",
                     @"(CST) ",
                     @"(CST) ",
                     @"(ADT) ",
                     @"(EDT) ",
                     @"(PDT) ",
                     @"(EDT) ",
                     @"(AST) ",
                     @"(PDT) ",
                     @"(PDT) ",
                     @"(CDT) ",
                     @"(AKDT) ",
                     @"(MDT) ",
                     @"(GMT+8) ",
                     @"(GMT+7) ",
                     @"(GMT+10) ",
                     @"(GMT+11) ",
                     @"(GMT+5) ",
                     @"(GMT+13) ",
                     @"(GMT-3) ",
                     @"(GMT-3) ",
                     @"(GMT+13) ",
                     @"(GMT+3) ",
                     @"(GMT+6) ",
                     @"(GMT+2) ",
                     @"(GMT+3) ",
                     @"(GMT+6) ",
                     @"(GMT+3) ",
                     @"(GMT+12) ",
                     @"(GMT+5) ",
                     @"(GMT+5) ",
                     @"(GMT+5) ",
                     @"(GMT+3) ",
                     @"(GMT+3) ",
                     @"(GMT+5) ",
                     @"(GMT+7) ",
                     @"(GMT+3) ",
                     @"(GMT+6) ",
                     @"(GMT+8) ",
                     @"(GMT+8) ",
                     @"(GMT+8) ",
                     @"(GMT+5:30) ",
                     @"(GMT+3) ",
                     @"(GMT+6) ",
                     @"(GMT+9) ",
                     @"(GMT+4) ",
                     @"(GMT+5) ",
                     @"(GMT+2) ",
                     @"(GMT+8) ",
                     @"(GMT+2) ",
                     @"(GMT+7) ",
                     @"(GMT+8) ",
                     @"(GMT+7) ",
                     @"(GMT+9) ",
                     @"(GMT+7) ",
                     @"(GMT+9) ",
                     @"(GMT+3) ",
                     @"(GMT+4:30) ",
                     @"(GMT+12) ",
                     @"(GMT+5) ",
                     @"(GMT+8) ",
                     @"(GMT+5:45) ",
                     @"(GMT+5:45) ",
                     @"(GMT+10) ",
                     @"(GMT+5:30) ",
                     @"(GMT+8) ",
                     @"(GMT+8) ",
                     @"(GMT+8) ",
                     @"(GMT+3) ",
                     @"(GMT+8) ",
                     @"(GMT+12) ",
                     @"(GMT+8) ",
                     @"(GMT+8) ",
                     @"(GMT+4) ",
                     @"(GMT+3) ",
                     @"(GMT+7) ",
                     @"(GMT+7) ",
                     @"(GMT+7) ",
                     @"(GMT+5) ",
                     @"(GMT+7) ",
                     @"(GMT+7) ",
                     @"(GMT+9) ",
                     @"(GMT+3) ",
                     @"(GMT+6) ",
                     @"(GMT+6:30) ",
                     @"(GMT+3) ",
                     @"(GMT+11) ",
                     @"(GMT+5) ",
                     @"(GMT+9) ",
                     @"(GMT+8) ",
                     @"(GMT+8) ",
                     @"(GMT+8) ",
                     @"(GMT+5) ",
                     @"(GMT+4) ",
                     @"(GMT+3:30) ",
                     @"(GMT+6) ",
                     @"(GMT+9) ",
                     @"(GMT+8) ",
                     @"(GMT+8) ",
                     @"(GMT+11) ",
                     @"(GMT+7) ",
                     @"(GMT+11) ",
                     @"(GMT+10) ",
                     @"(GMT+6) ",
                     @"(GMT+4) ",
                     @"(GMT) ",
                     @"(ADT) ",
                     @"(GMT+1) ",
                     @"(GMT-1) ",
                     @"(GMT+1) ",
                     @"(GMT+1) ",
                     @"(GMT) ",
                     @"(GMT-2) ",
                     @"(GMT) ",
                     @"(GMT-3) ",
                     @"(GMT+10:30) ",
                     @"(GMT+10) ",
                     @"(GMT+10:30) ",
                     @"(GMT+11) ",
                     @"(GMT+9:30) ",
                     @"(GMT+8:45) ",
                     @"(GMT+11) ",
                     @"(GMT+10) ",
                     @"(GMT+11) ",
                     @"(GMT+11) ",
                     @"(GMT+8) ",
                     @"(GMT+11) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+3) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+3) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+3) ",
                     @"(GMT+2) ",
                     @"(GMT+1) ",
                     @"(GMT+2) ",
                     @"(GMT+1) ",
                     @"(GMT+3) ",
                     @"(GMT+1) ",
                     @"(GMT+3) ",
                     @"(GMT+1) ",
                     @"(GMT+3) ",
                     @"(GMT+3) ",
                     @"(GMT+1) ",
                     @"(GMT+2) ",
                     @"(GMT+1) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+3) ",
                     @"(GMT+3) ",
                     @"(GMT+2) ",
                     @"(GMT+4) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+3) ",
                     @"(GMT+2) ",
                     @"(GMT+4) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+3) ",
                     @"(GMT+2) ",
                     @"(GMT+3) ",
                     @"(GMT+2) ",
                     @"(GMT+3) ",
                     @"(GMT+2) ",
                     @"(GMT+3) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+3) ",
                     @"(GMT+4) ",
                     @"(GMT+2) ",
                     @"(GMT+2) ",
                     @"(GMT+3) ",
                     @"(GMT+2) ",
                     @"(GMT+3) ",
                     @"(GMT+6) ",
                     @"(GMT+7) ",
                     @"(GMT+6:30) ",
                     @"(GMT+3) ",
                     @"(GMT+5) ",
                     @"(GMT+4) ",
                     @"(GMT+5) ",
                     @"(GMT+4) ",
                     @"(GMT+3) ",
                     @"(GMT+4) ",
                     @"(GMT+14) ",
                     @"(GMT+13) ",
                     @"(GMT+13:45) ",
                     @"(GMT+10) ",
                     @"(GMT-5) ",
                     @"(GMT+11) ",
                     @"(GMT+13) ",
                     @"(GMT+13) ",
                     @"(GMT+12) ",
                     @"(GMT+12) ",
                     @"(GMT-6) ",
                     @"(GMT-9) ",
                     @"(GMT+11) ",
                     @"(GMT+10) ",
                     @"(HST) ",
                     @"(HAST) ",
                     @"(GMT+14) ",
                     @"(GMT+11) ",
                     @"(GMT+12) ",
                     @"(GMT+12) ",
                     @"(GMT-9:30) ",
                     @"(GMT-11) ",
                     @"(GMT+12) ",
                     @"(GMT-11) ",
                     @"(GMT+11:30) ",
                     @"(GMT+11) ",
                     @"(GMT-11) ",
                     @"(GMT+9) ",
                     @"(GMT-8) ",
                     @"(GMT+11) ",
                     @"(GMT+11) ",
                     @"(GMT+10) ",
                     @"(GMT-10) ",
                     @"(GMT+10) ",
                     @"(GMT-10) ",
                     @"(GMT+12) ",
                     @"(GMT+13) ",
                     @"(GMT+10) ",
                     @"(GMT+12) ",
                     @"(GMT+12) ",
                     nil];
	// Do any additional setup after loading the view.
    cities = [NSArray arrayWithObjects:@    "Africa/Abidjan",
              @    "Africa/Accra",
              @    "Africa/Addis_Ababa",
              @    "Africa/Algiers",
             @    "Africa/Asmara",
              @    "Africa/Bamako",
              @    "Africa/Bangui",
              @    "Africa/Banjul",
              @    "Africa/Bissau",
              @    "Africa/Blantyre",
              @    "Africa/Brazzaville",
              @    "Africa/Bujumbura",
              @    "Africa/Cairo",
              @    "Africa/Casablanca",
              @    "Africa/Ceuta",
              @    "Africa/Conakry",
              @    "Africa/Dakar",
              @    "Africa/Dar_es_Salaam",
              @    "Africa/Djibouti",
              @    "Africa/Douala",
              @    "Africa/El_Aaiun",
              @    "Africa/Freetown",
              @    "Africa/Gaborone",
              @    "Africa/Harare",
              @    "Africa/Johannesburg",
              @    "Africa/Juba",
              @    "Africa/Kampala",
              @    "Africa/Khartoum",
              @    "Africa/Kigali",
              @    "Africa/Kinshasa",
              @    "Africa/Lagos",
              @    "Africa/Libreville",
              @    "Africa/Lome",
              @    "Africa/Luanda",
              @    "Africa/Lubumbashi",
              @    "Africa/Lusaka",
              @    "Africa/Malabo",
              @    "Africa/Maputo",
              @    "Africa/Maseru",
              @    "Africa/Mbabane",
              @    "Africa/Mogadishu",
              @    "Africa/Monrovia",
              @    "Africa/Nairobi",
              @    "Africa/Ndjamena",
              @    "Africa/Niamey",
              @    "Africa/Nouakchott",
              @    "Africa/Ouagadougou",
              @    "Africa/Porto-Novo",
              @    "Africa/Sao_Tome",
              @    "Africa/Tripoli",
              @    "Africa/Tunis",
              @    "Africa/Windhoek",
              @    "America/Adak",
              @    "America/Anchorage",
              @    "America/Anguilla",
              @    "America/Antigua",
              @    "America/Araguaina",
              @    "America/Argentina/Buenos_Aires",
              @    "America/Argentina/Catamarca",
              @    "America/Argentina/Cordoba",
              @    "America/Argentina/Jujuy",
              @    "America/Argentina/La_Rioja",
              @    "America/Argentina/Mendoza",
              @    "America/Argentina/Rio_Gallegos",
              @    "America/Argentina/Salta",
              @    "America/Argentina/San_Juan",
              @    "America/Argentina/San_Luis",
              @    "America/Argentina/Tucuman",
              @    "America/Argentina/Ushuaia",
              @    "America/Aruba",
              @    "America/Asuncion",
              @    "America/Atikokan",
              @    "America/Bahia",
              @    "America/Bahia_Banderas",
              @    "America/Barbados",
              @    "America/Belem",
              @    "America/Belize",
              @    "America/Blanc-Sablon",
              @    "America/Boa_Vista",
              @    "America/Bogota",
              @    "America/Boise",
              @    "America/Cambridge_Bay",
              @    "America/Campo_Grande",
              @    "America/Cancun",
              @    "America/Caracas",
              @    "America/Cayenne",
              @    "America/Cayman",
              @    "America/Chicago",
              @    "America/Chihuahua",
              @    "America/Costa_Rica",
              @    "America/Creston",
              @    "America/Cuiaba",
              @    "America/Curacao",
              @    "America/Danmarkshavn",
              @    "America/Dawson",
              @    "America/Dawson_Creek",
              @    "America/Denver",
              @    "America/Detroit",
              @    "America/Dominica",
              @    "America/Edmonton",
              @    "America/Eirunepe",
              @    "America/El_Salvador",
              @    "America/Fortaleza",
              @    "America/Glace_Bay",
              @    "America/Godthab",
              @    "America/Goose_Bay",
              @    "America/Grand_Turk",
              @    "America/Grenada",
              @    "America/Guadeloupe",
              @    "America/Guatemala",
              @    "America/Guayaquil",
              @    "America/Guyana",
              @    "America/Halifax",
              @    "America/Havana",
              @    "America/Hermosillo",
              @    "America/Indiana/Indianapolis",
              @    "America/Indiana/Knox",
              @    "America/Indiana/Marengo",
              @    "America/Indiana/Petersburg",
              @    "America/Indiana/Tell_City",
              @    "America/Indiana/Vevay",
              @    "America/Indiana/Vincennes",
              @    "America/Indiana/Winamac",
              @    "America/Inuvik",
              @    "America/Iqaluit",
              @    "America/Jamaica",
              @    "America/Juneau",
              @    "America/Kentucky/Louisville",
              @    "America/Kentucky/Monticello",
              @    "America/Kralendijk",
              @    "America/La_Paz",
              @    "America/Lima",
              @    "America/Los_Angeles",
              @    "America/Lower_Princes",
              @    "America/Maceio",
              @    "America/Managua",
              @    "America/Manaus",
              @    "America/Marigot",
              @    "America/Martinique",
              @    "America/Matamoros",
              @    "America/Mazatlan",
              @    "America/Menominee",
              @    "America/Merida",
              @    "America/Metlakatla",
              @    "America/Mexico_City",
              @    "America/Miquelon",
              @    "America/Moncton",
              @    "America/Monterrey",
              @    "America/Montevideo",
              @    "America/Montreal",
              @    "America/Montserrat",
              @    "America/Nassau",
              @    "America/New_York",
              @    "America/Nipigon",
              @    "America/Nome",
              @    "America/Noronha",
              @    "America/North_Dakota/Beulah",
              @    "America/North_Dakota/Center",
              @    "America/North_Dakota/New_Salem",
              @    "America/Ojinaga",
              @    "America/Panama",
              @    "America/Pangnirtung",
              @    "America/Paramaribo",
              @    "America/Phoenix",
              @    "America/Port-au-Prince",
              @    "America/Port_of_Spain",
              @    "America/Porto_Velho",
              @    "America/Puerto_Rico",
              @    "America/Rainy_River",
              @    "America/Rankin_Inlet",
              @    "America/Recife",
              @    "America/Regina",
              @    "America/Resolute",
              @    "America/Rio_Branco",
              @    "America/Santa_Isabel",
              @    "America/Santarem",
              @    "America/Santiago",
              @    "America/Santo_Domingo",
              @    "America/Sao_Paulo",
              @    "America/Scoresbysund",
              @    "America/Shiprock",
              @    "America/Sitka",
              @    "America/St_Barthelemy",
              @    "America/St_Johns",
              @    "America/St_Kitts",
              @    "America/St_Lucia",
              @    "America/St_Thomas",
              @    "America/St_Vincent",
              @    "America/Swift_Current",
              @    "America/Tegucigalpa",
              @    "America/Thule",
              @    "America/Thunder_Bay",
              @    "America/Tijuana",
              @    "America/Toronto",
              @    "America/Tortola",
              @    "America/Vancouver",
              @    "America/Whitehorse",
              @    "America/Winnipeg",
              @    "America/Yakutat",
              @    "America/Yellowknife",
              @    "Antarctica/Casey",
              @    "Antarctica/Davis",
              @    "Antarctica/DumontDUrville",
              @    "Antarctica/Macquarie",
              @    "Antarctica/Mawson",
              @    "Antarctica/McMurdo",
              @    "Antarctica/Palmer",
              @    "Antarctica/Rothera",
              @    "Antarctica/South_Pole",
              @    "Antarctica/Syowa",
              @    "Antarctica/Vostok",
              @    "Arctic/Longyearbyen",
              @    "Asia/Aden",
              @    "Asia/Almaty",
              @    "Asia/Amman",
              @    "Asia/Anadyr",
              @    "Asia/Aqtau",
              @    "Asia/Aqtobe",
              @    "Asia/Ashgabat",
              @    "Asia/Baghdad",
              @    "Asia/Bahrain",
              @    "Asia/Baku",
              @    "Asia/Bangkok",
              @    "Asia/Beirut",
              @    "Asia/Bishkek",
              @    "Asia/Brunei",
              @    "Asia/Choibalsan",
              @    "Asia/Chongqing",
              @    "Asia/Colombo",
              @    "Asia/Damascus",
              @    "Asia/Dhaka",
              @    "Asia/Dili",
              @    "Asia/Dubai",
              @    "Asia/Dushanbe",
              @    "Asia/Gaza",
              @    "Asia/Harbin",
              @    "Asia/Hebron",
              @    "Asia/Ho_Chi_Minh",
              @    "Asia/Hong_Kong",
              @    "Asia/Hovd",
              @    "Asia/Irkutsk",
              @    "Asia/Jakarta",
              @    "Asia/Jayapura",
              @    "Asia/Jerusalem",
              @    "Asia/Kabul",
              @    "Asia/Kamchatka",
              @    "Asia/Karachi",
              @    "Asia/Kashgar",
              @    "Asia/Kathmandu",
              @    "Asia/Katmandu",
              @    "Asia/Khandyga",
              @    "Asia/Kolkata",
              @    "Asia/Krasnoyarsk",
              @    "Asia/Kuala_Lumpur",
              @    "Asia/Kuching",
              @    "Asia/Kuwait",
              @    "Asia/Macau",
              @    "Asia/Magadan",
              @    "Asia/Makassar",
              @    "Asia/Manila",
              @    "Asia/Muscat",
              @    "Asia/Nicosia",
              @    "Asia/Novokuznetsk",
              @    "Asia/Novosibirsk",
              @    "Asia/Omsk",
              @    "Asia/Oral",
              @    "Asia/Phnom_Penh",
              @    "Asia/Pontianak",
              @    "Asia/Pyongyang",
              @    "Asia/Qatar",
              @    "Asia/Qyzylorda",
              @    "Asia/Rangoon",
              @    "Asia/Riyadh",
              @    "Asia/Sakhalin",
              @    "Asia/Samarkand",
              @    "Asia/Seoul",
              @    "Asia/Shanghai",
              @    "Asia/Singapore",
              @    "Asia/Taipei",
              @    "Asia/Tashkent",
              @    "Asia/Tbilisi",
              @    "Asia/Tehran",
              @    "Asia/Thimphu",
              @    "Asia/Tokyo",
              @    "Asia/Ulaanbaatar",
              @    "Asia/Urumqi",
              @    "Asia/Ust-Nera",
              @    "Asia/Vientiane",
              @    "Asia/Vladivostok",
              @    "Asia/Yakutsk",
              @    "Asia/Yekaterinburg",
              @    "Asia/Yerevan",
              @    "Atlantic/Azores",
              @    "Atlantic/Bermuda",
              @    "Atlantic/Canary",
              @    "Atlantic/Cape_Verde",
              @    "Atlantic/Faroe",
              @    "Atlantic/Madeira",
              @    "Atlantic/Reykjavik",
              @    "Atlantic/South_Georgia",
              @    "Atlantic/St_Helena",
              @    "Atlantic/Stanley",
              @    "Australia/Adelaide",
              @    "Australia/Brisbane",
              @    "Australia/Broken_Hill",
              @    "Australia/Currie",
              @    "Australia/Darwin",
              @    "Australia/Eucla",
              @    "Australia/Hobart",
              @    "Australia/Lindeman",
              @    "Australia/Lord_Howe",
              @    "Australia/Melbourne",
              @    "Australia/Perth",
              @    "Australia/Sydney",
              @    "Europe/Amsterdam",
              @    "Europe/Andorra",
              @    "Europe/Athens",
              @    "Europe/Belgrade",
              @    "Europe/Berlin",
              @    "Europe/Bratislava",
              @    "Europe/Brussels",
              @    "Europe/Bucharest",
              @    "Europe/Budapest",
              @    "Europe/Busingen",
              @    "Europe/Chisinau",
              @    "Europe/Copenhagen",
              @    "Europe/Dublin",
              @    "Europe/Gibraltar",
              @    "Europe/Guernsey",
              @    "Europe/Helsinki",
              @    "Europe/Isle_of_Man",
              @    "Europe/Istanbul",
              @    "Europe/Jersey",
              @    "Europe/Kaliningrad",
              @    "Europe/Kiev",
              @    "Europe/Lisbon",
              @    "Europe/Ljubljana",
              @    "Europe/London",
              @    "Europe/Luxembourg",
              @    "Europe/Madrid",
              @    "Europe/Malta",
              @    "Europe/Mariehamn",
              @    "Europe/Minsk",
              @    "Europe/Monaco",
              @    "Europe/Moscow",
              @    "Europe/Oslo",
              @    "Europe/Paris",
              @    "Europe/Podgorica",
              @    "Europe/Prague",
              @    "Europe/Riga",
              @    "Europe/Rome",
              @    "Europe/Samara",
              @    "Europe/San_Marino",
              @    "Europe/Sarajevo",
              @    "Europe/Simferopol",
              @    "Europe/Skopje",
              @    "Europe/Sofia",
              @    "Europe/Stockholm",
              @    "Europe/Tallinn",
              @    "Europe/Tirane",
              @    "Europe/Uzhgorod",
              @    "Europe/Vaduz",
              @    "Europe/Vatican",
              @    "Europe/Vienna",
              @    "Europe/Vilnius",
              @    "Europe/Volgograd",
              @    "Europe/Warsaw",
              @    "Europe/Zagreb",
              @    "Europe/Zaporozhye",
              @    "Europe/Zurich",
              @    "Indian/Antananarivo",
              @    "Indian/Chagos",
              @    "Indian/Christmas",
              @    "Indian/Cocos",
              @    "Indian/Comoro",
              @    "Indian/Kerguelen",
              @    "Indian/Mahe",
              @    "Indian/Maldives",
              @    "Indian/Mauritius",
              @    "Indian/Mayotte",
              @    "Indian/Reunion",
              @    "Pacific/Apia",
              @    "Pacific/Auckland",
              @    "Pacific/Chatham",
              @    "Pacific/Chuuk",
              @    "Pacific/Easter",
              @    "Pacific/Efate",
              @    "Pacific/Enderbury",
              @    "Pacific/Fakaofo",
              @    "Pacific/Fiji",
              @    "Pacific/Funafuti",
              @    "Pacific/Galapagos",
              @    "Pacific/Gambier",
              @    "Pacific/Guadalcanal",
              @    "Pacific/Guam",
              @    "Pacific/Honolulu",
              @    "Pacific/Johnston",
              @    "Pacific/Kiritimati",
              @    "Pacific/Kosrae",
              @    "Pacific/Kwajalein",
              @    "Pacific/Majuro",
              @    "Pacific/Marquesas",
              @    "Pacific/Midway",
              @    "Pacific/Nauru",
              @    "Pacific/Niue",
              @    "Pacific/Norfolk",
              @    "Pacific/Noumea",
              @    "Pacific/Pago_Pago",
              @    "Pacific/Palau",
              @    "Pacific/Pitcairn",
              @    "Pacific/Pohnpei",
              @    "Pacific/Ponape",
              @    "Pacific/Port_Moresby",
              @    "Pacific/Rarotonga",
              @    "Pacific/Saipan",
              @    "Pacific/Tahiti",
              @    "Pacific/Tarawa",
              @    "Pacific/Tongatapu",
              @    "Pacific/Truk",
              @    "Pacific/Wake",
              @    "Pacific/Wallis", 
              nil];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [cities count];
        return [citytimezones count];
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"citycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:simpleTableIdentifier];
       // cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [cities objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [citytimezones objectAtIndex:indexPath.row];
   }
    
    
    return cell;
    
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *sectionedArray = [[NSMutableArray alloc]init];
    for(char c ='A' ; c <= 'Z' ;  c++)
    {
        [sectionedArray addObject:[NSString stringWithFormat:@"%c",c]];
    }
    return sectionedArray;
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSInteger count = 0;
    for(NSString *character in cities)
    {
        if([character isEqualToString:title])
        {
            return count;
        }
        count ++;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /* UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"City Selected"
     message:@"..."
     delegate:self
     cancelButtonTitle:@"Ok"
     otherButtonTitles:nil];
     
     [alert show];
     */
    
    
    //  NSString *selectedValue = [cities objectAtIndex:indexPath.row];
    //[self.delegate passItemBack:self didFinishWithItem:[selectedValue]];
    //NSLog(selectedValue);
    [self.delegate didselectwith:self cities:[self.tableView cellForRowAtIndexPath:indexPath ].textLabel.text];
    //[self.delegate didselectwith1:self cities:[self.tableView cellForRowAtIndexPath:indexPath ].textLabel.text];
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    searchResults = [cities filteredArrayUsingPredicate:resultPredicate];
    //searchResults = [citytimezones filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)backbutton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
