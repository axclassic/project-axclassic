#NPC: Elesseryl Terussar
#RezBot quest
sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Hail, $name! You are brave to seek me here. what can I do for you? ")
  }
  elsif(($text=~/RezBot/i) && ($RezBot == 1)){
    quest::say("You already have what you need.");
    return;
  }
  elsif($text=~/RezBot/i){
       quest::say("Take this Scroll to the Spell Scriber Anita Thrall");
       quest::summonitem(629);  # RezBot Scroll
       return;
  }
}