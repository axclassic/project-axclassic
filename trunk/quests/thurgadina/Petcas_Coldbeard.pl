# zone: thurgadina
# ax_peq

sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Hail to ye as well offlander. I bid you welcome to the Icy Mug, one o' the finest establishments for a drink in Thurgadin. Whether it's [souvenirs], stories, or that [special brew] yer lookin for, you've come to the right place.");
}
  elsif($text=~/special brew/i){
    quest::say("Aha, you're looking for something with a kick to it, eh? Well, I'm willing to give some up to you, but it's going to cost you. Give me 350 gold pieces and I might consider parting ways with some.");
  }
}

sub EVENT_ITEM {
  if($gold == 350){
    quest::say("Here are your special beans. I'm sure you'll enjoy the fine flavor and the delicate aroma that can only be gotten from the depths of Thurgadin. I know one recipe calls to filter three coffee beans to get some normal coffee, then filtering the coffee and those beans to get a wintry treat able to heat just about anyone up.");
    quest::summonitem("60290");
  }
  if($platinum == 35){
    quest::say("Here are your special beans. I'm sure you'll enjoy the fine flavor and the delicate aroma that can only be gotten from the depths of Thurgadin. I know one recipe calls to filter three coffee beans to get some normal coffee, then filtering the coffee and those beans to get a wintry treat able to heat just about anyone up.");
    quest::summonitem("60290");
  }
}