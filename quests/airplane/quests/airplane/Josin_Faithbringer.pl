sub EVENT_SAY {
    if($text=~/Hail/i){
      quest::say("Greetings, $name.  Are you ready to begin your test of faith?");
      }
    if(($text=~/test of faith/i) && ($class eq "Cleric")){
      quest::say("I have faith that you will do well, but my faith isn't being tested, now is it?");
      quest::emote("smiles meekly.");
      quest::say("Please choose Alan or Deric to begin your test.");
      }
    if(($text=~/Alan/i) && ($class eq "Cleric")){
      quest::say("I shall summon Alan for you, as you seem ready and willing.");
      quest::spawn2(71080,0,0,660.7,1361.6,-766.9,193.2);
      quest::depop();
      }
    if(($text=~/Deric/i) && ($class eq "Cleric")){
      quest::say("I shall summon Deric for you, as you seem ready and willing.");
      quest::spawn2(71083,0,0,660.7,1338.0,-766.9,193.2);
      quest::depop();
      }
}
#END of FILE Zone:airplane  ID:2851 -- Josin_Faithbringer 



