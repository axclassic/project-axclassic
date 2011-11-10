sub EVENT_SAY { 

if($text=~/Hail/i){
  quest::say("Greetings, $name.  Are you [pure of heart and soul]?");
  }
if(($text=~/pure of heart and soul/i) && ($class eq "Paladin")) {
  quest::say("Then choose. Do you wish your purity to be tested by Gregori or Dirkog?");
  }
if(($text=~/Gregori/i) && ($class eq "Paladin")){
        quest::say("Gregori's tale is one of virtue. Read this book and return it to me if you are ready for your own virtues to be tested.");
        quest::summonitem(18526);
        
        }
if(($text=~/Dirkog/i) && ($class eq "Paladin")){
        quest::say("Dirkog is a gruff one, but his faith is what all paladins should strive to equal. Please read this book and return it when ready for your test.");
        quest::summonitem(18527);
        }
if(($text=~/pure of heart and soul/i) && ($class ne "Paladin")) {
  quest::say("It is unfortunate that you are mistaken in your calling, for you are no paladin. I cannot assist you like another might.");
  quest::depop();
  }

}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18527 => 1)) { #Walk with Evil (Book) {
    quest::spawn2(71077,0,0,563,1331.1,-766.9,63.4);
    quest::say("Farewell, $name.");
    quest::depop();
  }
  
  if(plugin::check_handin(\%itemcount, 18526 => 1)) { #A Virtuous Knight (Book) {
  quest::spawn2(71089,0,0,563,1331.1,-766.9,63.4);
  quest::say("Farewell, $name.");
  quest::depop();
  }
}

#END of FILE Zone:airplane  ID:853 -- Dason_Goldblade 



