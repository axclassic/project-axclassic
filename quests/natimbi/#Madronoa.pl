######################################
## NPC: #Madronoa                   ##
## Zone: Natimbi                    ##
## Quest: Port Pl to QVic           ##
## Created by Caved for AXClassic   ##
## EQWorld Server     19-01-2013    ##
######################################

sub EVENT_SAY {
my $travel = quest::saylink("travel", 1);
  if ($text=~/hail/i) {
    $client->Message(14,"Hello $name, how are you today? My name is Madronoa and I have recently returned from the Prayer Grounds of Calling. A group of young adventurers such as yourself led me there some time ago. While there I've learned how to channel the energy to teleport those such as yourself there. If you wish to $travel to Qvic, I shall create a portal for you.");
  }
  if ($text=~/travel/i) {
            quest::movepc(295,-124,-651,-422,0); #port to qvic
         }
      }

