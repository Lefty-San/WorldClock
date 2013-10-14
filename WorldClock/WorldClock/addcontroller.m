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
    
    _defaults = [NSUserDefaults standardUserDefaults];
    

    
    citytimezones = [NSArray arrayWithObjects:
                     @"(GMT)",
                     @"(GMT)",
                     @"(GMT+3)",
                     @"(GMT+1)",
                     @"(GMT+3)",
                     @"(GMT)",
                     @"(GMT+1)",
                     @"(GMT)",
                     @"(GMT)",
                     @"(GMT+2)",
                     @"(GMT+1)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT)",
                     @"(GMT+2)",
                     @"(GMT)",
                     @"(GMT)",
                     @"(GMT+3)",
                     @"(GMT+3)",
                     @"(GMT+1)",
                     @"(GMT)",
                     @"(GMT)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+3)",
                     @"(GMT+3)",
                     @"(GMT+3)",
                     @"(GMT+2)",
                     @"(GMT+1)",
                     @"(GMT+1)",
                     @"(GMT+1)",
                     @"(GMT)",
                     @"(GMT+1)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+1)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+3)",
                     @"(GMT)",
                     @"(GMT+3)",
                     @"(GMT+1)",
                     @"(GMT+1)",
                     @"(GMT)",
                     @"(GMT)",
                     @"(GMT+1)",
                     @"(GMT)",
                     @"(GMT+2)",
                     @"(GMT+1)",
                     @"(GMT+2)",
                     @"(HADT)",
                     @"(AKDT)",
                     @"(AST)",
                     @"(AST)",
                     @"(GMT-3)",
                     @"(GMT-3)",
                     @"(GMT-3)",
                     @"(GMT-3)",
                     @"(GMT-3)",
                     @"(GMT-3)",
                     @"(GMT-3)",
                     @"(GMT-3)",
                     @"(GMT-3)",
                     @"(GMT-3)",
                     @"(GMT-4)",
                     @"(GMT-3)",
                     @"(GMT-3)",
                     @"(AST)",
                     @"(GMT-3)",
                     @"(EST)",
                     @"(GMT-3)",
                     @"(CDT)",
                     @"(AST)",
                     @"(GMT-3)",
                     @"(CST)",
                     @"(AST)",
                     @"(GMT-4)",
                     @"(GMT-5)",
                     @"(MDT)",
                     @"(MDT)",
                     @"(GMT-4)",
                     @"(CDT)",
                     @"(GMT-4:30)",
                     @"(GMT-3)",
                     @"(EST)",
                     @"(CDT)",
                     @"(MDT)",
                     @"(CST)",
                     @"(MST)",
                     @"(GMT-4)",
                     @"(AST)",
                     @"(GMT)",
                     @"(PDT)",
                     @"(MST)",
                     @"(MDT)",
                     @"(EDT)",
                     @"(AST)",
                     @"(MDT)",
                     @"(GMT-4)",
                     @"(CST)",
                     @"(GMT-3)",
                     @"(ADT)",
                     @"(GMT-2)",
                     @"(ADT)",
                     @"(EDT)",
                     @"(AST)",
                     @"(AST)",
                     @"(CST)",
                     @"(GMT-5)",
                     @"(GMT-4)",
                     @"(ADT)",
                     @"(GMT-4)",
                     @"(MST)",
                     @"(EDT)",
                     @"(CDT)",
                     @"(EDT)",
                     @"(EDT)",
                     @"(CDT)",
                     @"(EDT)",
                     @"(EDT)",
                     @"(EDT)",
                     @"(MDT)",
                     @"(EDT)",
                     @"(EST)",
                     @"(AKDT)",
                     @"(EDT)",
                     @"(EDT)",
                     @"(AST)",
                     @"(GMT-4)",
                     @"(GMT-5)",
                     @"(PDT)",
                     @"(AST)",
                     @"(GMT-3)",
                     @"(CST)",
                     @"(GMT-4)",
                     @"(AST)",
                     @"(AST)",
                     @"(CDT)",
                     @"(MDT)",
                     @"(CDT)",
                     @"(CDT)",
                     @"(PST)",
                     @"(CDT)",
                     @"(GMT-2)",
                     @"(ADT)",
                     @"(CDT)",
                     @"(GMT-2)",
                     @"(EDT)",
                     @"(AST)",
                     @"(EDT)",
                     @"(EDT)",
                     @"(EDT)",
                     @"(AKDT)",
                     @"(GMT-2)",
                     @"(CDT)",
                     @"(CDT)",
                     @"(CDT)",
                     @"(MDT)",
                     @"(EST)",
                     @"(EDT)",
                     @"(GMT-3)",
                     @"(MST)",
                     @"(EDT)",
                     @"(AST)",
                     @"(GMT-4)",
                     @"(AST)",
                     @"(CDT)",
                     @"(CDT)",
                     @"(GMT-3)",
                     @"(CST)",
                     @"(CDT)",
                     @"(GMT-4)",
                     @"(PDT)",
                     @"(GMT-3)",
                     @"(GMT-3)",
                     @"(AST)",
                     @"(GMT-3)",
                     @"(GMT)",
                     @"(MDT)",
                     @"(AKDT)",
                     @"(AST)",
                     @"(GMT-2:30)",
                     @"(AST)",
                     @"(AST)",
                     @"(AST)",
                     @"(AST)",
                     @"(CST)",
                     @"(CST)",
                     @"(ADT)",
                     @"(EDT)",
                     @"(PDT)",
                     @"(EDT)",
                     @"(AST)",
                     @"(PDT)",
                     @"(PDT)",
                     @"(CDT)",
                     @"(AKDT)",
                     @"(MDT)",
                     @"(GMT+8)",
                     @"(GMT+7)",
                     @"(GMT+10)",
                     @"(GMT+11)",
                     @"(GMT+5)",
                     @"(GMT+13)",
                     @"(GMT-3)",
                     @"(GMT-3)",
                     @"(GMT+13)",
                     @"(GMT+3)",
                     @"(GMT+6)",
                     @"(GMT+2)",
                     @"(GMT+3)",
                     @"(GMT+6)",
                     @"(GMT+3)",
                     @"(GMT+12)",
                     @"(GMT+5)",
                     @"(GMT+5)",
                     @"(GMT+5)",
                     @"(GMT+3)",
                     @"(GMT+3)",
                     @"(GMT+5)",
                     @"(GMT+7)",
                     @"(GMT+3)",
                     @"(GMT+6)",
                     @"(GMT+8)",
                     @"(GMT+8)",
                     @"(GMT+8)",
                     @"(GMT+5:30)",
                     @"(GMT+3)",
                     @"(GMT+6)",
                     @"(GMT+9)",
                     @"(GMT+4)",
                     @"(GMT+5)",
                     @"(GMT+2)",
                     @"(GMT+8)",
                     @"(GMT+2)",
                     @"(GMT+7)",
                     @"(GMT+8)",
                     @"(GMT+7)",
                     @"(GMT+9)",
                     @"(GMT+7)",
                     @"(GMT+9)",
                     @"(GMT+3)",
                     @"(GMT+4:30)",
                     @"(GMT+12)",
                     @"(GMT+5)",
                     @"(GMT+8)",
                     @"(GMT+5:45)",
                     @"(GMT+5:45)",
                     @"(GMT+10)",
                     @"(GMT+5:30)",
                     @"(GMT+8)",
                     @"(GMT+8)",
                     @"(GMT+8)",
                     @"(GMT+3)",
                     @"(GMT+8)",
                     @"(GMT+12)",
                     @"(GMT+8)",
                     @"(GMT+8)",
                     @"(GMT+4)",
                     @"(GMT+3)",
                     @"(GMT+7)",
                     @"(GMT+7)",
                     @"(GMT+7)",
                     @"(GMT+5)",
                     @"(GMT+7)",
                     @"(GMT+7)",
                     @"(GMT+9)",
                     @"(GMT+3)",
                     @"(GMT+6)",
                     @"(GMT+6:30)",
                     @"(GMT+3)",
                     @"(GMT+11)",
                     @"(GMT+5)",
                     @"(GMT+9)",
                     @"(GMT+8)",
                     @"(GMT+8)",
                     @"(GMT+8)",
                     @"(GMT+5)",
                     @"(GMT+4)",
                     @"(GMT+3:30)",
                     @"(GMT+6)",
                     @"(GMT+9)",
                     @"(GMT+8)",
                     @"(GMT+8)",
                     @"(GMT+11)",
                     @"(GMT+7)",
                     @"(GMT+11)",
                     @"(GMT+10)",
                     @"(GMT+6)",
                     @"(GMT+4)",
                     @"(GMT)",
                     @"(ADT)",
                     @"(GMT+1)",
                     @"(GMT-1)",
                     @"(GMT+1)",
                     @"(GMT+1)",
                     @"(GMT)",
                     @"(GMT-2)",
                     @"(GMT)",
                     @"(GMT-3)",
                     @"(GMT+10:30)",
                     @"(GMT+10)",
                     @"(GMT+10:30)",
                     @"(GMT+11)",
                     @"(GMT+9:30)",
                     @"(GMT+8:45)",
                     @"(GMT+11)",
                     @"(GMT+10)",
                     @"(GMT+11)",
                     @"(GMT+11)",
                     @"(GMT+8)",
                     @"(GMT+11)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+3)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+3)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+3)",
                     @"(GMT+2)",
                     @"(GMT+1)",
                     @"(GMT+2)",
                     @"(GMT+1)",
                     @"(GMT+3)",
                     @"(GMT+1)",
                     @"(GMT+3)",
                     @"(GMT+1)",
                     @"(GMT+3)",
                     @"(GMT+3)",
                     @"(GMT+1)",
                     @"(GMT+2)",
                     @"(GMT+1)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+3)",
                     @"(GMT+3)",
                     @"(GMT+2)",
                     @"(GMT+4)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+3)",
                     @"(GMT+2)",
                     @"(GMT+4)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+3)",
                     @"(GMT+2)",
                     @"(GMT+3)",
                     @"(GMT+2)",
                     @"(GMT+3)",
                     @"(GMT+2)",
                     @"(GMT+3)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+3)",
                     @"(GMT+4)",
                     @"(GMT+2)",
                     @"(GMT+2)",
                     @"(GMT+3)",
                     @"(GMT+2)",
                     @"(GMT+3)",
                     @"(GMT+6)",
                     @"(GMT+7)",
                     @"(GMT+6:30)",
                     @"(GMT+3)",
                     @"(GMT+5)",
                     @"(GMT+4)",
                     @"(GMT+5)",
                     @"(GMT+4)",
                     @"(GMT+3)",
                     @"(GMT+4)",
                     @"(GMT+14)",
                     @"(GMT+13)",
                     @"(GMT+13:45)",
                     @"(GMT+10)",
                     @"(GMT-5)",
                     @"(GMT+11)",
                     @"(GMT+13)",
                     @"(GMT+13)",
                     @"(GMT+12)",
                     @"(GMT+12)",
                     @"(GMT-6)",
                     @"(GMT-9)",
                     @"(GMT+11)",
                     @"(GMT+10)",
                     @"(HST)",
                     @"(HAST)",
                     @"(GMT+14)",
                     @"(GMT+11)",
                     @"(GMT+12)",
                     @"(GMT+12)",
                     @"(GMT-9:30)",
                     @"(GMT-11)",
                     @"(GMT+12)",
                     @"(GMT-11)",
                     @"(GMT+11:30)",
                     @"(GMT+11)",
                     @"(GMT-11)",
                     @"(GMT+9)",
                     @"(GMT-8)",
                     @"(GMT+11)",
                     @"(GMT+11)",
                     @"(GMT+10)",
                     @"(GMT-10)",
                     @"(GMT+10)",
                     @"(GMT-10)",
                     @"(GMT+12)",
                     @"(GMT+13)",
                     @"(GMT+10)",
                     @"(GMT+12)",
                     @"(GMT+12)",
                     nil];
	// Do any additional setup after loading the view.
    cities = [NSArray arrayWithObjects:@"Abidjan",
              @"Accra",
              @"Addis Ababa",
              @"Algiers",
              @"Asmara",
              @"Bamako",
              @"Bangui",
              @"Banjul",
              @"Bissau",
              @"Blantyre",
              @"Brazzaville",
              @"Bujumbura",
              @"Cairo",
              @"Casablanca",
              @"Ceuta",
              @"Conakry",
              @"Dakar",
              @"Dar es Salaam",
              @"Djibouti",
              @"Douala",
              @"El Aaiun",
              @"Freetown",
              @"Gaborone",
              @"Harare",
              @"Johannesburg",
              @"Juba",
              @"Kampala",
              @"Khartoum",
              @"Kigali",
              @"Kinshasa",
              @"Lagos",
              @"Libreville",
              @"Lome",
              @"Luanda",
              @"Lubumbashi",
              @"Lusaka",
              @"Malabo",
              @"Maputo",
              @"Maseru",
              @"Mbabane",
              @"Mogadishu",
              @"Monrovia",
              @"Nairobi",
              @"Ndjamena",
              @"Niamey",
              @"Nouakchott",
              @"Ouagadougou",
              @"Porto-Novo",
              @"Sao Tome",
              @"Tripoli",
              @"Tunis",
              @"Windhoek",
              @"Adak",
              @"Anchorage",
              @"Anguilla",
              @"Antigua",
              @"Araguaina",
              @"Buenos Aires",
              @"Catamarca",
              @"Cordoba",
              @"Jujuy",
              @"La Rioja",
              @"Mendoza",
              @"Rio Gallegos",
              @"Salta",
              @"San Juan",
              @"San Luis",
              @"Tucuman",
              @"Ushuaia",
              @"Aruba",
              @"Asuncion",
              @"Atikokan",
              @"Bahia",
              @"Bahia Banderas",
              @"Barbados",
              @"Belem",
              @"Belize",
              @"Blanc-Sablon",
              @"Boa Vista",
              @"Bogota",
              @"Boise",
              @"Cambridge Bay",
              @"Campo Grande",
              @"Cancun",
              @"Caracas",
              @"Cayenne",
              @"Cayman",
              @"Chicago",
              @"Chihuahua",
              @"Costa Rica",
              @"Creston",
              @"Cuiaba",
              @"Curacao",
              @"Danmarkshavn",
              @"Dawson",
              @"Dawson Creek",
              @"Denver",
              @"Detroit",
              @"Dominica",
              @"Edmonton",
              @"Eirunepe",
              @"El Salvador",
              @"Fortaleza",
              @"Glace Bay",
              @"Godthab",
              @"Goose Bay",
              @"Grand Turk",
              @"Grenada",
              @"Guadeloupe",
              @"Guatemala",
              @"Guayaquil",
              @"Guyana",
              @"Halifax",
              @"Havana",
              @"Hermosillo",
              @"Indianapolis",
              @"Knox",
              @"Marengo",
              @"Petersburg",
              @"Tell City",
              @"Vevay",
              @"Vincennes",
              @"Winamac",
              @"Inuvik",
              @"Iqaluit",
              @"Jamaica",
              @"Juneau",
              @"Louisville",
              @"Monticello",
              @"Kralendijk",
              @"La Paz",
              @"Lima",
              @"Los Angeles",
              @"Lower Princes",
              @"Maceio",
              @"Managua",
              @"Manaus",
              @"Marigot",
              @"Martinique",
              @"Matamoros",
              @"Mazatlan",
              @"Menominee",
              @"Merida",
              @"Metlakatla",
              @"Mexico City",
              @"Miquelon",
              @"Moncton",
              @"Monterrey",
              @"Montevideo",
              @"Montreal",
              @"Montserrat",
              @"Nassau",
              @"New York",
              @"Nipigon",
              @"Nome",
              @"Noronha",
              @"Beulah",
              @"Center",
              @"New Salem",
              @"Ojinaga",
              @"Panama",
              @"Pangnirtung",
              @"Paramaribo",
              @"Phoenix",
              @"Port-au-Prince",
              @"Port of Spain",
              @"Porto Velho",
              @"Puerto Rico",
              @"Rainy River",
              @"Rankin Inlet",
              @"Recife",
              @"Regina",
              @"Resolute",
              @"Rio Branco",
              @"Santa Isabel",
              @"Santarem",
              @"Santiago",
              @"Santo Domingo",
              @"Sao Paulo",
              @"Scoresbysund",
              @"Shiprock",
              @"Sitka",
              @"St Barthelemy",
              @"St Johns",
              @"St Kitts",
              @"St Lucia",
              @"St Thomas",
              @"St Vincent",
              @"Swift Current",
              @"Tegucigalpa",
              @"Thule",
              @"Thunder Bay",
              @"Tijuana",
              @"Toronto",
              @"Tortola",
              @"Vancouver",
              @"Whitehorse",
              @"Winnipeg",
              @"Yakutat",
              @"Yellowknife",
              @"Casey",
              @"Davis",
              @"DumontDUrville",
              @"Macquarie",
              @"Mawson",
              @"McMurdo",
              @"Palmer",
              @"Rothera",
              @"South Pole",
              @"Syowa",
              @"Vostok",
              @"Longyearbyen",
              @"Aden",
              @"Almaty",
              @"Amman",
              @"Anadyr",
              @"Aqtau",
              @"Aqtobe",
              @"Ashgabat",
              @"Baghdad",
              @"Bahrain",
              @"Baku",
              @"Bangkok",
              @"Beirut",
              @"Bishkek",
              @"Brunei",
              @"Choibalsan",
              @"Chongqing",
              @"Colombo",
              @"Damascus",
              @"Dhaka",
              @"Dili",
              @"Dubai",
              @"Dushanbe",
              @"Gaza",
              @"Harbin",
              @"Hebron",
              @"Ho Chi Minh",
              @"Hong Kong",
              @"Hovd",
              @"Irkutsk",
              @"Jakarta",
              @"Jayapura",
              @"Jerusalem",
              @"Kabul",
              @"Kamchatka",
              @"Karachi",
              @"Kashgar",
              @"Kathmandu",
              @"Katmandu",
              @"Khandyga",
              @"Kolkata",
              @"Krasnoyarsk",
              @"Kuala Lumpur",
              @"Kuching",
              @"Kuwait",
              @"Macau",
              @"Magadan",
              @"Makassar",
              @"Manila",
              @"Muscat",
              @"Nicosia",
              @"Novokuznetsk",
              @"Novosibirsk",
              @"Omsk",
              @"Oral",
              @"Phnom Penh",
              @"Pontianak",
              @"Pyongyang",
              @"Qatar",
              @"Qyzylorda",
              @"Rangoon",
              @"Riyadh",
              @"Sakhalin",
              @"Samarkand",
              @"Seoul",
              @"Shanghai",
              @"Singapore",
              @"Taipei",
              @"Tashkent",
              @"Tbilisi",
              @"Tehran",
              @"Thimphu",
              @"Tokyo",
              @"Ulaanbaatar",
              @"Urumqi",
              @"Ust-Nera",
              @"Vientiane",
              @"Vladivostok",
              @"Yakutsk",
              @"Yekaterinburg",
              @"Yerevan",
              @"Azores",
              @"Bermuda",
              @"Canary",
              @"Cape Verde",
              @"Faroe",
              @"Madeira",
              @"Reykjavik",
              @"South Georgia",
              @"St Helena",
              @"Stanley",
              @"Adelaide",
              @"Brisbane",
              @"Broken Hill",
              @"Currie",
              @"Darwin",
              @"Eucla",
              @"Hobart",
              @"Lindeman",
              @"Lord Howe",
              @"Melbourne",
              @"Perth",
              @"Sydney",
              @"Amsterdam",
              @"Andorra",
              @"Athens",
              @"Belgrade",
              @"Berlin",
              @"Bratislava",
              @"Brussels",
              @"Bucharest",
              @"Budapest",
              @"Busingen",
              @"Chisinau",
              @"Copenhagen",
              @"Dublin",
              @"Gibraltar",
              @"Guernsey",
              @"Helsinki",
              @"Isle of Man",
              @"Istanbul",
              @"Jersey",
              @"Kaliningrad",
              @"Kiev",
              @"Lisbon",
              @"Ljubljana",
              @"London",
              @"Luxembourg",
              @"Madrid",
              @"Malta",
              @"Mariehamn",
              @"Minsk",
              @"Monaco",
              @"Moscow",
              @"Oslo",
              @"Paris",
              @"Podgorica",
              @"Prague",
              @"Riga",
              @"Rome",
              @"Samara",
              @"San Marino",
              @"Sarajevo",
              @"Simferopol",
              @"Skopje",
              @"Sofia",
              @"Stockholm",
              @"Tallinn",
              @"Tirane",
              @"Uzhgorod",
              @"Vaduz",
              @"Vatican",
              @"Vienna",
              @"Vilnius",
              @"Volgograd",
              @"Warsaw",
              @"Zagreb",
              @"Zaporozhye",
              @"Zurich",
              @"Antananarivo",
              @"Chagos",
              @"Christmas",
              @"Cocos",
              @"Comoro",
              @"Kerguelen",
              @"Mahe",
              @"Maldives",
              @"Mauritius",
              @"Mayotte",
              @"Reunion",
              @"Apia",
              @"Auckland",
              @"Chatham",
              @"Chuuk",
              @"Easter",
              @"Efate",
              @"Enderbury",
              @"Fakaofo",
              @"Fiji",
              @"Funafuti",
              @"Galapagos",
              @"Gambier",
              @"Guadalcanal",
              @"Guam",
              @"Honolulu",
              @"Johnston",
              @"Kiritimati",
              @"Kosrae",
              @"Kwajalein",
              @"Majuro",
              @"Marquesas",
              @"Midway",
              @"Nauru",
              @"Niue",
              @"Norfolk",
              @"Noumea",
              @"Pago Pago",
              @"Palau",
              @"Pitcairn",
              @"Pohnpei",
              @"Ponape",
              @"Port Moresby",
              @"Rarotonga",
              @"Saipan",
              @"Tahiti",
              @"Tarawa",
              @"Tongatapu",
              @"Truk",
              @"Wake",
              @"Wallis",
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
   // NSString *value = [cities objectAtIndex:indexPath.row];
    NSString *value = [cities objectAtIndex:indexPath.row];
    NSString *gmt = [citytimezones objectAtIndex:indexPath.row];
   
    _clocklabel1 = [_defaults objectForKey:@"ClocksUserSet"];
    _clocklabel2 = [_defaults objectForKey:@"ClocksUserSet1"];
    _clocklabel3 = [_defaults objectForKey:@"ClocksUserSet2"];
    _clocklabel4 = [_defaults objectForKey:@"ClocksUserSet3"];
    _clocklabel5 = [_defaults objectForKey:@"ClocksUserSet4"];
    _clocklabel6 = [_defaults objectForKey:@"ClocksUserSet5"];
    NSLog(@"trial %@", _clocklabel4);
    
  //  NSLog(@"%@", value);
    if (_clocklabel1 != NULL) {
        if ([_clocklabel1 isEqual:@""]) {
            [_defaults setObject:value forKey:@"ClocksUserSet"];
            [_defaults setObject:gmt forKey:@"ClocksUserSetGMT"];
        }
    }
    else {
        [_defaults setObject:value forKey:@"ClocksUserSet"];
        [_defaults setObject:gmt forKey:@"ClocksUserSetGMT"];
    }
    if (_clocklabel2 != NULL) {
        if ([_clocklabel2 isEqual:@""]) {
            [_defaults setObject:value forKey:@"ClocksUserSet1"];
            [_defaults setObject:gmt forKey:@"ClocksUserSet1GMT"];
        }
    }
    else {
        [_defaults setObject:value forKey:@"ClocksUserSet1"];
        [_defaults setObject:gmt forKey:@"ClocksUserSet1GMT"];
    }
    if (_clocklabel3 != NULL){
        if ([_clocklabel3 isEqual:@""]) {
            [_defaults setObject:value forKey:@"ClocksUserSet2"];
            [_defaults setObject:gmt forKey:@"ClocksUserSet2GMT"];
        }
    }
    else {
        [_defaults setObject:value forKey:@"ClocksUserSet2"];
        [_defaults setObject:gmt forKey:@"ClocksUserSet2GMT"];
    }
    if (_clocklabel4 != NULL) {
        if ([_clocklabel4 isEqual:@""]) {
            [_defaults setObject:value forKey:@"ClocksUserSet3"];
            [_defaults setObject:gmt forKey:@"ClocksUserSet3GMT"];
        }
    }
    else {
        [_defaults setObject:value forKey:@"ClocksUserSet3"];
         [_defaults setObject:gmt forKey:@"ClocksUserSet3GMT"];
    }
    if (_clocklabel5 != NULL) {
        if ([_clocklabel5 isEqual:@""]) {
            [_defaults setObject:value forKey:@"ClocksUserSet4"];
            [_defaults setObject:gmt forKey:@"ClocksUserSet4GMT"];
        }
    }
    else {
        [_defaults setObject:value forKey:@"ClocksUserSet4"];
        [_defaults setObject:gmt forKey:@"ClocksUserSet4GMT"];
    }
    if (_clocklabel6 != NULL) {
        if ([_clocklabel6 isEqual:@""]) {
            [_defaults setObject:value forKey:@"ClocksUserSet5"];
            [_defaults setObject:gmt forKey:@"ClocksUserSet5GMT"];
        }
    }
    else {
        [_defaults setObject:value forKey:@"ClocksUserSet5"];
        [_defaults setObject:gmt forKey:@"ClocksUserSet5GMT"];
    }
    _clocklabel1 = [_defaults objectForKey:@"ClocksUserSet"];
    _clocklabel2 = [_defaults objectForKey:@"ClocksUserSet1"];
    _clocklabel3 = [_defaults objectForKey:@"ClocksUserSet2"];
    _clocklabel4 = [_defaults objectForKey:@"ClocksUserSet3"];
    _clocklabel5 = [_defaults objectForKey:@"ClocksUserSet4"];
    _clocklabel6 = [_defaults objectForKey:@"ClocksUserSet5"];
    
  //  if (_clocklabel1==_clocklabel2) {
   //     [_defaults setObject:@"" forKey:@"ClocksUserSet"];
  //  }
    if (_clocklabel2==_clocklabel1) {
        [_defaults setObject:@"" forKey:@"ClocksUserSet1"];
        [_defaults setObject:@"" forKey:@"ClocksUserSet1GMT"];
    }
    if (_clocklabel3==_clocklabel2) {
        [_defaults setObject:@"" forKey:@"ClocksUserSet2"];
        [_defaults setObject:@"" forKey:@"ClocksUserSet2GMT"];
    }
    if (_clocklabel4==_clocklabel3) {
        [_defaults setObject:@"" forKey:@"ClocksUserSet3"];
        [_defaults setObject:@"" forKey:@"ClocksUserSet3GMT"];
        NSLog(@"other");
    }
    if (_clocklabel5==_clocklabel4) {
        [_defaults setObject:@"" forKey:@"ClocksUserSet4"];
        [_defaults setObject:@"" forKey:@"ClocksUserSet4GMT"];
    }
    if (_clocklabel6==_clocklabel5) {
        [_defaults setObject:@"" forKey:@"ClocksUserSet5"];
        [_defaults setObject:@"" forKey:@"ClocksUserSet5GMT"];
    }
 //   if ([_clocklabel1 isEqual:@""]) {
  //      [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ClocksUserSet"];
  //  }
    if ([_clocklabel2 isEqual:@""]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ClocksUserSet1"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ClocksUserSet1GMT"];
    }
    if ([_clocklabel3 isEqual:@""]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ClocksUserSet2"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ClocksUserSet2GMT"];
    }
    if ([_clocklabel4 isEqual:@""]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ClocksUserSet3"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ClocksUserSet3GMT"];
    }
    if ([_clocklabel5 isEqual:@""]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ClocksUserSet4"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ClocksUserSet4GMT"];
    }
    if ([_clocklabel6 isEqual:@""]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ClocksUserSet5"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ClocksUserSet5GMT"];
    }
    

     [_defaults synchronize];
  //  NSString *test = [_defaults objectForKey:@"ClocksUserSet1"];
  //  NSLog(@"%@", test);
  
//   [self.delegate didselectwith:self cities:[self.tableView cellForRowAtIndexPath:indexPath ].textLabel.text];
    
    
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
