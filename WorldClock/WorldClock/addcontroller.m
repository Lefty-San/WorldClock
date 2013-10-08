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
	// Do any additional setup after loading the view.
    cities = [NSArray arrayWithObjects:@"Afghanistan/Kabul",
              @"Lebanon/Beirut",
              @"Algeria/Algiers",
              @"Madagascar/Antananarivo",
              @"Argentina/Buenos Aires",
              @"Malaysia/Kuala Lumpur",
              @"Australia/Canberra",
              @"Mexico/Mexico City",
              @"Australia/Sydney",
              @"Morocco/Casablanca",
              @"Australia/Darwin",
              @"Myanmar/Yangon",
              @"Australa/Brisbane",
              @"Nepal/Kathmandu",
              @"Australia/Adelaide",
              @"Netherlands/Amsterdam",
              @"Australia/Melbourne",
              @"New Zealand/Auckland",
              @"Australia/Perth",
              @"Nicaragua/Managua",
              @"Austria/Vienna",
              @"Nigeria/Lagos",
              @"Bahamas/Nassau",
              @"Norway/Oslo",
              @"Bangladesh/Dhaka",
              @"Pakistan/Islamabad",
              @"Belarus/Minsk",
              @"Pakistan/Karachi",
              @"Belgium/Brussels",
              @"Pakistan/Lahore",
              @"Bolivia/La Paz",
              @"Paraguay/Asuncion",
              @"Brazil/Brasilia",
              @"Peru/Lima",
              @"Brazil/Rio de Janeiro",
              @"Philippines/Manila",
              @"Brazil/São Paulo",
              @"Poland/Warsaw",
              @"Bulgaria/Sofia",
              @"Portugal/Lisbon ",
              @"Canada/Calgary",
              @"Puerto Rico/San Juan",
              @"Canada/Edmonton",
              @"Qatar/Doha",
              @"Canada/Vancouver",
              @"Romania/Bucharest",
              @"Canada/Winnipeg",
              @"Russia/Anadyr",
              @"Canada/St. John's",
              @"Russia/Moscow",
              @"Canada/Halifax",
              @"Saudi Arabia/Riyadh",
              @"Canada/Ottawa",
              @"Serbia/Belgrade",
              @"Canada/Toronto",
              @"Singapore/Singapore",
              @"Canada/Montreal",
              @"South Africa/Cape Town",
              @"Chile/Santiago",
              @"South Africa/Johannesburg",
              @"China/Beijing",
              @"South Korea/Seoul",
              @"China/Shanghai",
              @"Spain/Barcelona",
              @"Colombia/Bogota",
              @"Spain/Madrid",
              @"Congo Dem.Rep./Kinshasa",
              @"Sudan/Khartoum",
              @"Croatia/Zagreb",
              @"Sweden/Stockholm",
              @"Cuba/Havana",
              @"Switzerland/Zurich",
              @"Czech Republic/Prague",
              @"Taiwan/Taipei",
              @"Denmark/Copenhagen",
              @"Tanzania/Dar es Salaam",
              @"Dominican Republic/Santo Domingo",
              @"Thailand/Bangkok",
              @"Egypt/Cairo",
              @"Turkey/Ankara",
              @"El Salvador/San Salvador",
              @"Turkey/Istanbul",
              @"Estonia/Tallinn",
              @"U.S.A./Anchorage",
              @"Ethiopia/Addis Ababa",
              @"U.S.A./Phoenix",
              @"Fiji/Suva",
              @"U.S.A./Los Angeles",
              @"Finland/Helsinki",
              @"U.S.A./San Francisco",
              @"France/Paris",
              @"U.S.A./Denver",
              @"Germany/Berlin",
              @"U.S.A./Washington DC",
              @"Germany/Frankfurt",
              @"U.S.A./Miami",
              @"Ghana/Accra",
              @"U.S.A./Atlanta",
              @"Greece/Athens",
              @"U.S.A./Honolulu",
              @"Guatemala/Guatemala",
              @"U.S.A./Chicago",
              @"Honduras/Tegucigalpa",
              @"U.S.A./Indianapolis",
              @"Hong Kong/Hong Kong",
              @"U.S.A./New Orleans",
              @"Hungary/Budapest",
              @"U.S.A./Boston",
              @"Iceland/Reykjavik",
              @"U.S.A./Detroit",
              @"India/New Delhi",
              @"U.S.A./Minneapolis",
              @"India/Bangalore",
              @"U.S.A./Las Vegas",
              @"India/Mumbai",
              @"U.S.A./New York",
              @"India/Kolkata",
              @"U.S.A./Columbus",
              @"Indonesia/Jakarta",
              @"U.S.A./Philadelphia",
              @"Iran/Tehran",
              @"U.S.A./Dallas",
              @"Iraq/Baghdad",
              @"U.S.A./Houston",
              @"Ireland/Dublin",
              @"U.S.A./Salt Lake City",
              @"Israel/Jerusalem",
              @"U.S.A./Seattle",
              @"Italy/Rome",
              @"Ukraine/Kyiv",
              @"Jamaica/Kingston",
              @"United Arab Emirates/Dubai",
              @"Japan/Tokyo",
              @"United Kingdom/London",
              @"Jordan/Amman",
              @"Uruguay/Montevideo",
              @"Kazakhstan/Almaty",
              @"Uzbekistan/Tashkent",
              @"Kenya/Nairobi",
              @"Venezuela/Caracas",
              @"Kiribati/Kiritimati",
              @"Vietnam/Hanoi",
              @"Kuwait/Kuwait City",
              @"Zimbabwe/Harare",
              nil];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [cities count];
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"citycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [cities objectAtIndex:indexPath.row];
    }
    
    return cell;
    
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




@end
