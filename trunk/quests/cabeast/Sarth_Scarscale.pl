#Iksar low- to mid-level armor quests.  This is for the Shadowknight.  

sub EVENT_SAY {
my $mantle = quest::saylink("mantle", 1);
my $Bracer = quest::saylink("Bracer", 1);
my $Greaves = quest::saylink("Greaves", 1);
my $Mask = quest::saylink("Mask", 1);
my $Breastplate = quest::saylink("Breastplate", 1);
  if($text=~/Hail/i) {
    quest::emote(' hisses at you loudly.');
	quest::say("So, you bear the $mantle of a crusader, yes?  I am known as Sarth and shall reward you, provided you prove your worthiness to our cause, child of Rile.");
  }
  if($text=~/mantle/i){
    quest::say("We shall see if you are worthy of that. I shall make armor for you, to aid you in your service to our Father. I specialize in the forging of $Bracer, $Greaves, $Mask, and $Breastplate. Sirtha makes the other items of armor. Take care when you address her, hatchling. It would not be the first time a hatchling has left here with scars.");
  }
  if($text=~/Bracer/i){
    quest::say("Have you ever seen Bloodgills? I hear they will devour a broodling in seconds and that their scales are tough as iron. Bring me some of these scales, a banded bracer, and a sapphire as blue as the sky. Only then will I give the bracer to you, broodling.");
  }
  if($text=~/Greaves/i){
    quest::say("Do you know the beasts that call themselves sarnaks? One such beast who calls itself Zorash attacked an envoy of merchants who were to deliver a pair of special boots to me. It taunts us by wearing them as a trophy. Bring them back and the skull of Grachnist, his goblin ally. Return them to me along with a star ruby and your banded greaves, and I shall craft you an excellent pair of greaves.");
  }
  if($text=~/Mask/i){
    quest::say("Have you ever encountered a drixie before? I crush every one I see. They are an annoyance beyond mere words! Kill the Queen and bring me her wings as a trophy along with an emerald of fire and a banded mask.");
  }
  if($text=~/Breastplate/i){
    quest::say("Ahhhh....a breastplate you want, is it? Well, they are not easy to come by. Fetch me a scorpion chitin. Intact, mind you! They are extremely fragile and must be treated before they can protect your carcass. Also, fetch me a war braid from a sarnak to connect the pieces. I also require a ruby and your banded tunic. Do this and I shall make it for you, hatchling. Now, go!"); 
  }
}
 
sub EVENT_ITEM {
  #Dreadscale Bracer for:  Scale=14824  Bracer=3061  Sapphire=10034  
  if(plugin::check_handin(\%itemcount,14824=>1,3061=>1,10034=>1)) {
    quest::say("Well done!  Here is the item we agreed upon.  May Cazic's glorious curses flow through you!");
    quest::summonitem(4971);
	sub EVENT_SAY {
my $Rile = quest::saylink("Rile", 1);
my $armor = quest::saylink("armor", 1);
my $Helm = quest::saylink("Helm", 1);
my $Boots = quest::saylink("Boots", 1);
my $Gauntlets = quest::saylink("Gauntlets", 1);
my $Vambraces = quest::saylink("Vambraces", 1);
  if($text=~/Hail/i){
    quest::emote("eyes you intently. 'So, yet another hatchling approaches us. I am known as Sirtha and that is Sarth. We are children of $Rile. Who do you call your father, broodling?'");
  }
  if($text=~/Rile/i){
    quest::say("Very good. We are smiths for the Crusaders of the Greenmist and I shall make $armor for you, provided you prove your worth. Fail these simple tasks, and you shall not be worthy to bear the title of crusader!");
  }
  if($text=~/armor/i){
    quest::say("I will make $Helm, $Gauntlets, $Boots, and $Vambraces. My broodmate shall make the bracers, greaves, masks, and breastplate.");
  }
  if($text=~/Helm/i){
    quest::say("The sarnak are a mockery of the Iksar. They are nothing more than beasts fit only to do our bidding! I require you to bring me the sword of one of their Order of Knights and the head of a sarnak berserker. These beasts have been attacking our patrols of late. I also require a stone called a ruby and a banded helm. Do this and I shall make a helm for you.");
  }
  if($text=~/Boots/i){
    quest::say("Cactus quills can be very lethal. I seek to work them into my new boots. Find me these quills, a pair of skeletal feet, an emerald of fire, and some banded boots so that I may start working on them. Why are you still here?! Begone!");
  }
  if($text=~/Gauntlets/i){
    quest::say("I currently have need of a complete skeletal hand for the research I am conducting. I wish to study its properties and form so that I can make gauntlets befitting our station. I also require two rubies that holds stars within and some banded gauntlets to complete my ritual. Do that and the gauntlets are yours to keep.");
  }
  if($text=~/Vambraces/i){
    quest::say("The hideous Golra are hardy creatures. The tales indicate their ferocity almost matches our own. I wish to gain a trophy of one of these beasts. Bring me the skin of one, two blue sapphires, and banded sleeves. Then I shall give you these fine vambraces.");
  }
}

sub EVENT_ITEM {
  #Dreadscale Helm for:  Head=14822  Sword=14826  Helm=3053  Ruby=10035
  if(plugin::check_handin(\%itemcount,14822=>1,14826=>1,3053=>1,10035=>1)) {
    quest::say("Well done! Here is the item we agreed upon. May Cazic's glorious curses flow through you!");
    quest::summonitem(4968);
	quest::ding();
	quest::exp(10000);
  }
  #Dreadscale Boots for:  Quills=14828  Boots=3064  Feet=14823  FireEmerald=10033
  elsif(plugin::check_handin(\%itemcount,14828=>1,14823=>1,3064=>1,10033=>1)) {
    quest::say("Well done! Here is the item we agreed upon. May Cazic's glorious curses flow through you!");
    quest::summonitem(4974);
	quest::ding();
	quest::exp(10000);
  }
  #Dreadscale Gauntlets for:  Hand=14825  Gauntlets=3062  StarRuby=10032
  elsif(plugin::check_handin(\%itemcount,14825=>1,3062=>1,10032=>2)) {
    quest::say("Well done! Here is the item we agreed upon. May Cazic's glorious curses flow through you!");
    quest::summonitem(4972);
	quest::ding();
	quest::exp(10000);
  }
  #Dreadscale Vambraces for:  Hide=14830  Vambraces=3060  Sapphire=10034
  elsif(plugin::check_handin(\%itemcount,14830=>1,3060=>1,10034=>2)) {
    quest::say("Well done! Here is the item we agreed upon. May Cazic's glorious curses flow through you!");
    quest::summonitem(4970);
	quest::ding();
	quest::exp(10000);
  }
   #Dreadscale Greaves for:  Boots=14829  Head=14820  Greaves=3063  StarRuby=10032
  elsif(plugin::check_handin(\%itemcount,14829=>1,14820=>1,3063=>1,10032=>1)) {
    quest::say("Well done!  Here is the item we agreed upon.  May Cazic's glorious curses flow through you!");
    quest::summonitem(4973);
	quest::ding();
	quest::exp(10000);
  }
  #Dreadscale Mask for:  Wings=14827  Mask=3054  FireEmerald=10033
  elsif(plugin::check_handin(\%itemcount,14827=>1,3054=>1,10033=>1)) {
    quest::say("Well done!  Here is the item we agreed upon.  May Cazic's glorious curses flow through you!");
    quest::summonitem(4975);
	quest::ding();
	quest::exp(10000);
  }
  #Dreadscale Breastplate for:  Braid=12982  Chitin=14821  Breastplate=3056  Ruby=10035  
  elsif(plugin::check_handin(\%itemcount,12982=>1,14821=>1,3056=>1,10035=>1)) {
    quest::say("Well done!  Here is the item we agreed upon.  May Cazic's glorious curses flow through you!");
    quest::summonitem(4969);
	quest::ding();
	quest::exp(10000);
  }
  else {
     plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }

#END of FILE Zone:cabeast  ID:106011 -- Sarth_Scarscale

