### note to Angelox;
### DON'T FORGET TO ENABLE QUEST GLOBALS ON NPC!!!
### LDoN Version Spawner - Inteded for development only
sub EVENT_SAY {
	if($text=~/Hail/i){
 			quest::say("Good day to you $name!  I'm the Version Spawner - Which Instance do you want?");
			quest::say("Instances availabe are [GukC], [TakE]"); 
	}
	########## GukC ###################################
	elsif ($text=~/GukC6/i) {
		if ($gukc_ins6 > 0) {
			quest::say("Ok $name, GuKC6 Version Six it is, Global there...");
			$gukc_ins6 = $qglobals{"gukc_ins6"};
			#quest::setglobal("gukc", 1, 5, "D1");
			quest::AssignToInstance($gukc_ins6);
			quest::MovePCInstance(239, $gukc_ins6, 0, 0, 0);
		}
		else{
			quest::say("Ok $name, GukC Version Six it is, Creating it...");
			##quest::CreateInstance(zone_name, version, expiration_time)
			$gukc_ins6 = quest::CreateInstance("gukc", 6, 14400);
			quest::AssignToInstance($gukc_ins6); 
			quest::setglobal("gukc_ins6",$gukc_ins6,365,"D1");
			##quest:MovePCInstance(zoneID, instanceID, x, y, z, heading)
			quest::MovePCInstance(239, $gukc_ins6, 0, 0, 0);
			}
		}
	elsif($text=~/GukC/i){
			quest::say("Which version of GukC do you want?");
			quest::say("Version(s) available are [GukC6].");
		}
	########## TakE #####################################	
	elsif ($text=~/TakE2/i) {
		if ($take_ins2 > 0) {
			quest::say("Ok $name, TakE Version Two it is, Global there...");
			$take_ins2 = $qglobals{"take_ins2"};
			quest::AssignToInstance($take_ins2);
			quest::MovePCInstance(251, $take_ins2, 0, 0, 0);
		}
		else {
			quest::say("Ok $name, TakE Version Two it is, Creating it...");
			##quest::CreateInstance(zone_name, version, expiration_time)
			$take_ins2 = quest::CreateInstance("take", 3, 14400);
			quest::AssignToInstance($take_ins2); 
			quest::setglobal("take_ins2",$take_ins2,365,"D1");
			##quest:MovePCInstance(zoneID, instanceID, x, y, z, heading)
			quest::MovePCInstance(251, $take_ins2, 0, 0, 0);
			}	
		}
	elsif ($text=~/TakE3/i) {
		if ($take_ins3 > 0) {
			quest::say("Ok $name, TakE Version Three it is, Global there...");
			$take_ins3 = $qglobals{"take_ins3"};
			quest::AssignToInstance($take_ins3);
			quest::MovePCInstance(251, $take_ins3, 0, 0, 0);
		}
		else {
			quest::say("Ok $name, TakE Version Three it is, Creating it...");
			##quest::CreateInstance(zone_name, version, expiration_time)
			$take_ins3 = quest::CreateInstance("take", 3, 14400);
			quest::AssignToInstance($take_ins3); 
			quest::setglobal("take_ins3",$take_ins3,365,"D1");
			##quest:MovePCInstance(zoneID, instanceID, x, y, z, heading)
			quest::MovePCInstance(251, $take_ins3, 0, 0, 0);
			}	
		}
	elsif ($text=~/TakE4/i) {
		if ($take_ins4 > 0) {
			quest::say("Ok $name, TakE Version Four it is, Global there...");
			$take_ins4 = $qglobals{"take_ins4"};
			quest::AssignToInstance($take_ins4);
			quest::MovePCInstance(251, $take_ins4, 0, 0, 0);
		}
		else {
			quest::say("Ok $name, TakE Version Four it is, Creating it...");
			##quest::CreateInstance(zone_name, version, expiration_time)
			$take_ins4 = quest::CreateInstance("take", 4, 14400);
			quest::AssignToInstance($take_ins4); 
			quest::setglobal("take_ins4",$take_ins4,365,"D1");
			##quest:MovePCInstance(zoneID, instanceID, x, y, z, heading)
			quest::MovePCInstance(251, $take_ins4, 0, 0, 0);
			}	
		}
	elsif ($text=~/TakE5/i) {
		if ($take_ins5 > 0) {
			quest::say("Ok $name, TakE Version Five it is, Global there...");
			$take_ins5 = $qglobals{"take_ins5"};
			quest::AssignToInstance($take_ins5);
			quest::MovePCInstance(251, $take_ins5, 0, 0, 0);
		}
		else {
			quest::say("Ok $name, TakE Version Five it is, Creating it...");
			##quest::CreateInstance(zone_name, version, expiration_time)
			$take_ins5 = quest::CreateInstance("take", 5, 14400);
			quest::AssignToInstance($take_ins5); 
			quest::setglobal("take_ins5",$take_ins5,365,"D1");
			##quest:MovePCInstance(zoneID, instanceID, x, y, z, heading)
			quest::MovePCInstance(251, $take_ins5, 0, 0, 0);
			}	
		}
	elsif ($text=~/TakE6/i) {
		if ($take_ins6 > 0) {
			quest::say("Ok $name, TakE Version Six it is, Global there...");
			$take_ins6 = $qglobals{"take_ins6"};
			quest::AssignToInstance($take_ins6);
			quest::MovePCInstance(251, $take_ins6, 0, 0, 0);
		}
		else {
			quest::say("Ok $name, TakE Version Six it is, Creating it...");
			##quest::CreateInstance(zone_name, version, expiration_time)
			$take_ins6 = quest::CreateInstance("take", 6, 14400);
			quest::AssignToInstance($take_ins6); 
			quest::setglobal("take_ins6",$take_ins6,365,"D1");
			##quest:MovePCInstance(zoneID, instanceID, x, y, z, heading)
			quest::MovePCInstance(251, $take_ins6, 0, 0, 0);
			}	
		}
	elsif ($text=~/TakE7/i) {
		if ($take_ins7 > 0) {
			quest::say("Ok $name, TakE Version Seven it is, Global there...");
			$take_ins7 = $qglobals{"take_ins7"};
			quest::AssignToInstance($take_ins7);
			quest::MovePCInstance(251, $take_ins7, 0, 0, 0);
		}
		else {
			quest::say("Ok $name, TakE Version Seven it is, Creating it...");
			##quest::CreateInstance(zone_name, version, expiration_time)
			$take_ins7 = quest::CreateInstance("take", 7, 14400);
			quest::AssignToInstance($take_ins7); 
			quest::setglobal("take_ins7",$take_ins7,365,"D1");
			##quest:MovePCInstance(zoneID, instanceID, x, y, z, heading)
			quest::MovePCInstance(251, $take_ins7, 0, 0, 0);
			}	
		}
	elsif ($text=~/TakE8/i) {
		if ($take_ins8 > 0) {
			quest::say("Ok $name, TakE Version Eight it is, Global there...");
			$take_ins8 = $qglobals{"take_ins8"};
			quest::AssignToInstance($take_ins8);
			quest::MovePCInstance(251, $take_ins8, 0, 0, 0);
		}
		else {
			quest::say("Ok $name, TakE Version Eight it is, Creating it...");
			##quest::CreateInstance(zone_name, version, expiration_time)
			$take_ins8 = quest::CreateInstance("take", 8, 14400);
			quest::AssignToInstance($take_ins8); 
			quest::setglobal("take_ins8",$take_ins8,365,"D1");
			##quest:MovePCInstance(zoneID, instanceID, x, y, z, heading)
			quest::MovePCInstance(251, $take_ins8, 0, 0, 0);
			}	
		}
	elsif ($text=~/TakE9/i) {
		if ($take_ins9 > 0) {
			quest::say("Ok $name, TakE Version Nine it is, Global there...");
			$take_ins9 = $qglobals{"take_ins9"};
			quest::AssignToInstance($take_ins9);
			quest::MovePCInstance(251, $take_ins9, 0, 0, 0);
		}
		else {
			quest::say("Ok $name, TakE Version Nine it is, Creating it...");
			##quest::CreateInstance(zone_name, version, expiration_time)
			$take_ins9 = quest::CreateInstance("take", 9, 14400);
			quest::AssignToInstance($take_ins9); 
			quest::setglobal("take_ins9",$take_ins9,365,"D1");
			##quest:MovePCInstance(zoneID, instanceID, x, y, z, heading)
			quest::MovePCInstance(251, $take_ins9, 0, 0, 0);
			}	
		}
	elsif ($text=~/TakE10/i) {
		if ($take_ins10 > 0) {
			quest::say("Ok $name, TakE Version Ten it is, Global there...");
			$take_ins10 = $qglobals{"take_ins10"};
			quest::AssignToInstance($take_ins10);
			quest::MovePCInstance(251, $take_ins10, 0, 0, 0);
		}
		else {
			quest::say("Ok $name, TakE Version Ten it is, Creating it...");
			##quest::CreateInstance(zone_name, version, expiration_time)
			$take_ins10 = quest::CreateInstance("take", 10, 14400);
			quest::AssignToInstance($take_ins10); 
			quest::setglobal("take_ins10",$take_ins10,365,"D1");
			##quest:MovePCInstance(zoneID, instanceID, x, y, z, heading)
			quest::MovePCInstance(251, $take_ins10, 0, 0, 0);
			}	
		}
	elsif($text=~/TakE/i){
			quest::say("Which version of TakE do you want?");
			quest::say("Version(s) available are [TakE2],[TakE3],[TakE4],[TakE5],[TakE6],[TakE7],[TakE8],[TakE9],[TakE10]."); 
	}
}