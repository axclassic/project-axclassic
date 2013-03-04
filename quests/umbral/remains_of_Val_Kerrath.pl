######################################
## NPC: Remains of Val Kerrath      ##
## Zone: Umbral plane               ##
## Medallion of Akelha Ra Quest     ##
##                                  ##
## Added by caved for AX-CLASSIC    ##
## 04-03-2013                       ##
######################################
sub EVENT_SAY {
my $talk = quest::saylink("talk", 1);
my $prophets = quest::saylink("prophets", 1);
if($text=~/Hail/i){
$client->Message(14,"Fleshy mortal, can you not see that I am cursed to live in eternal anguish? What is it that you seek from me? Do you want to $talk about Vex Thal?");
}
if($text=~/talk/i){
$client->Message(14,"The city of shadow is sealed by powerful magic. Only one that wears the talisman of Akelha Ra can pass through the seals on the gate. I have not been beyond the gates but rumors of dark $prophets that possess great power have been heard throughout the ages");
  }
if($text=~/prophets/i){
$client->Message(14,"Only legends and rumors have circulated about the dark prophets in Vex Thal. I suspect that they are the reason for my eternally cursed state. If you could find someway to defeat the dark prophet leading those in Vex Thal and bring me back proof of the deed, I shall reward you with an ancient relic that I possess");
  }
}
sub EVENT_ITEM { 
    if (plugin::check_handin(\%itemcount, 8365=>1)) {
    $client->Message(14,"$name, you have done more than was ever expected. Take this and my blessing will be with you always.");
    quest::ding(); quest::exp("2000");
    quest::summonitem("8364");
    }

  else {
    $client->Message(14,"I have no need for this $name\. Take it back...");
    plugin::return_items(\%itemcount);
  }
}

