sub EVENT_SPAWN {
     quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25);
}

sub EVENT_ENTER {
  if($ulevel >= 20){
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
               $client->Message(14, "You may pass.");
              quest::movepc(337,-1613,-1016,99);
    } 
    else {
 $client->Message(5, "You shall not pass.");
 }
 }
