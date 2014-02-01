##################################
#      Faldor Hendrys            #
##################################
# ZONE: Qeynos2                  #
# DATABASE: AX_CLASSIC Custom    #
# LAST EDIT DATE: Dec 9th, 2010  #
# VERSION: 1.0                   #
# REVISED BY Caved               #
##################################
sub EVENT_SAY {
  if($text=~/hail/i) {
    $client->Message(14,"Hey there, $name. I overheard your conversation with Aediles earlyer. What did he want from you an Orc Ribcage? He asks for the impossible since there are no Orcs here at all. I think i got a deal for you that could benefit both of us, you see? I have been hunting Orcs for many years in the Commonlands. I sold all the other stuff but i got some Orc Ribcages left. I would be willing to part with one if you could bring me 2 Lightstones, my wife is collecting those and i could really use some bonuspoints with her.. Now go get me the stones! ");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10300 => 2)) {
  quest::summonitem(19551);
   quest::ding(); quest::exp(100);
  $client->Message(14,"Good! here is your Orc Ribcage. Go pester the little dwarf for another helper.");
  }
 }

