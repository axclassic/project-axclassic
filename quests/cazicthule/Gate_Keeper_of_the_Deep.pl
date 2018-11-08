sub EVENT_SAY {
my $Ancient = quest::saylink("Ancient", 1);
    if($text=~/Hail/i) {
	quest::say("Greetings traveler, are you here seeking the $Ancient Greenblood Piranha?");
}
    elsif($text=~/Ancient/i) {
     quest::say("Very well I will summon him if you are proven to be worthy of this fight.");
	 plugin::check_hasitem($client, 62863); ## Druid Epic 1.5 ##
    plugin::check_hasitem($client, 62880); ## Druid Epic 2.0 ##
    plugin::check_hasitem($client, 119466); ## Druid Epic 2.5 ##
    plugin::check_hasitem($client, 119483); ## Druid Epic 3.0 ##
        plugin::check_hasitem($client, 9955); ## Cleric Epic 1.5 ##
        plugin::check_hasitem($client, 20076); ## Cleric Epic 2.0 ##
        plugin::check_hasitem($client, 119476); ## Cleric Epic 2.5 ##
        plugin::check_hasitem($client, 119484); ## Cleric Epic 3.0 ##
            plugin::check_hasitem($client, 50003); ## Shadowknight Epic 1.5 ##
            plugin::check_hasitem($client, 48136); ## Shadowknight Epic 2.0 ##
            plugin::check_hasitem($client, 119469); ## Shadowknight Epic 2.5 ##
            plugin::check_hasitem($client, 119485); ## Shadowknight Epic 3.0 ##
                plugin::check_hasitem($client, 57400); ## Shaman Epic 1.5 ##
                plugin::check_hasitem($client, 57405); ## Shaman Epic 2.0 ##
                plugin::check_hasitem($client, 119470); ## Shaman Epic 2.5 ##
                plugin::check_hasitem($client, 119486); ## Shaman Epic 3.0 ##
                    plugin::check_hasitem($client, 12665); ## Wizard Epic 1.5 ##
                    plugin::check_hasitem($client, 16576); ## Wizard Epic 2.0 ##
                    plugin::check_hasitem($client, 119471); ## Wizard Epic 2.5 ##
                    plugin::check_hasitem($client, 119487); ## Wizard Epic 3.0 ##
                        plugin::check_hasitem($client, 19092); ## Magician Epic 1.5 ##
                        plugin::check_hasitem($client, 19839); ## Magician Epic 2.0 ##
                        plugin::check_hasitem($client, 119472); ## Magician Epic 2.5 ##
                        plugin::check_hasitem($client, 119488); ## Magician Epic 3.0 ##
                            plugin::check_hasitem($client, 52952); ## Enchanter Epic 1.5 ##
                            plugin::check_hasitem($client, 52962); ## Enchanter Epic 2.0 ##
                            plugin::check_hasitem($client, 119473); ## Enchanter Epic 2.5 ##
                            plugin::check_hasitem($client, 119489); ## Enchanter Epic 3.0 ##
                                plugin::check_hasitem($client, 62581); ## Necromancer Epic 1.5 ##
                                plugin::check_hasitem($client, 64067); ## Necromancer Epic 2.0 ##
                                plugin::check_hasitem($client, 119474); ## Necromancer Epic 2.5 ##
                                plugin::check_hasitem($client, 119490); ## Necromancer Epic 3.0 ##
                                    plugin::check_hasitem($client, 60321); ## Warrior Epic 1.5 ##
                                    plugin::check_hasitem($client, 60332); ## Warrior Epic 2.0 ##
                                    plugin::check_hasitem($client, 119475); ## Warrior Epic 2.5 ##
                                    plugin::check_hasitem($client, 119491); ## Warrior Epic 3.0 ##
                                        plugin::check_hasitem($client, 52347); ## Rogue Epic 1.5 ##
                                        plugin::check_hasitem($client, 52348); ## Rogue Epic 2.0 ##
                                        plugin::check_hasitem($client, 119476); ## Rogue Epic 2.5 ##
                                        plugin::check_hasitem($client, 119492); ## Rogue Epic 3.0 ##
                                            plugin::check_hasitem($client, 61025); ## Monk Epic 1.5 ##
                                            plugin::check_hasitem($client, 67742); ## Monk Epic 2.0 ##
                                            plugin::check_hasitem($client, 119477); ## Monk Epic 2.5 ##
                                            plugin::check_hasitem($client, 119493); ## Monk Epic 3.0 ##
                                                plugin::check_hasitem($client, 52911); ## Neastlord Epic 1.5 ##
                                                plugin::check_hasitem($client, 57054); ## Beastlord Epic 2.0 ##
                                                plugin::check_hasitem($client, 119478); ## Beastlord Epic 2.5 ##
                                                plugin::check_hasitem($client, 119494); ## Beastlord Epic 3.0 ##
                                                    plugin::check_hasitem($client, 77631); ## Bard Epic 1.5 ##
                                                    plugin::check_hasitem($client, 77640); ## Bard Epic 2.0 ##
                                                    plugin::check_hasitem($client, 119479); ## Bard Epic 2.5 ##
                                                    plugin::check_hasitem($client, 119495); ## Batd Epic 3.0 ##
                                                        plugin::check_hasitem($client, 64031); ## Paladin Epic 1.5 ##
                                                        plugin::check_hasitem($client, 48147); ## Paladin Epic 2.0 ##
                                                        plugin::check_hasitem($client, 119480); ## Paladin Epic 2.5 ##
                                                        plugin::check_hasitem($client, 119496); ## Paladin Epic 3.0 ##
                                                            plugin::check_hasitem($client, 18398); ## Berserker Epic 1.5 ##
                                                            plugin::check_hasitem($client, 18609); ## Berserker Epic 2.0 ##
                                                            plugin::check_hasitem($client, 119481); ## Berserker Epic 2.5 ##
                                                            plugin::check_hasitem($client, 119497); ## Berserker Epic 3.0 ##
                                                                plugin::check_hasitem($client, 62627); ## Ranger Epic 1.5 ##
                                                                plugin::check_hasitem($client, 62649); ## Ranger Epic 2.0 ##
                                                                plugin::check_hasitem($client, 119482); ## Ranger Epic 2.5 ##
                                                                plugin::check_hasitem($client, 119498); ## Ranger Epic 3.0 ##
						quest::say("You have indeed proven your worthiness.");
	        quest::say("Prepare yourself $name!");
			quest::setglobal("CazicEpic", 1, 5, "F");
	  quest::depop(48433);
	quest::depop(48435);
	quest::depop(48434);
    quest::depopall(48247);
	quest::depopall(48442);
	quest::depopall(48441);
	quest::depopall(48248);
	quest::depopall(48439);
	quest::depopall(48039);
	quest::depopall(48152);
	quest::depopall(48038);
	quest::depopall(48283);
	quest::depopall(48074);
	quest::spawn2(48434,40,0,49.9,442,-129.1,0);
	quest::spawn2(48435,39,0,46.8,393,-119.9,197.5);
	quest::spawn2(48437,43,0,82,489.9,-125.1,0);
	quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
	quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
	quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
	quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
	quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
    quest::depop();
	}
   else {
    $client->Message(14,"$name, You are not yet worthy. Be Gone from my sight!");
  }
 }
 
 



