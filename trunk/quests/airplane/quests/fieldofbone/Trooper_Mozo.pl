sub EVENT_SAY {
  if($text=~/hail/i){
    quest::emote('looks upon you smugly.');
    quest::say('And what are you, some sort of adventurer? Bah!! You will be shaken by the first undead you come across. Wetting your paints you shall be. Ha Ha!! I doubt you could even [kill the decaying skeletons]!');
    quest::say("If you are looking for [bat wings], I can also help you with that.");}
  elsif($text=~/kill the decaying skeletons/i){
    quest::say('You kill skeletons?!! I think not!! They will bounce you with no trouble at all. Ten silvers says you cannot collect four bone chips!! When Velious melts!! Hah!');}
elsif ($text=~/bat wings/i){
    quest::say("I have many bat wings collected on my trips around Norrath, bring me one bone chip, and I will give you a bat wing in return .");}
}


sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13073 => 4)){
    quest::emote('gasps in astonishment.');
    quest::say('Wha...? This!! But... I... Why you... I oughta.. All right!! A bet is a bet. Here you go. A few silver pieces for your achievement. What?!! You thought I would give you ten? Fat chance! Now get lost or I will haul you in for impersonating a froglok.');
    quest::faction(193,15);
    quest::faction(30,15);
    quest::faction(282,15);
    quest::faction(62,15);
    quest::faction(317,15);
    my $a = quest::ChooseRandom(1,2,3,4,5,6,7);
    quest::givecash(0,$a,0,0);
     quest::ding(); quest::exp(500);
  }
   if($itemcount{13073} == 1){
    quest::say("Thank you and here is your batwing.");
    quest::summonitem(13068);  #Batwing
    }
}
#Submitted by Senzo : PEQ Quest Team