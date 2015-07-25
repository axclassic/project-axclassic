
sub EVENT_SAY {
   if($text=~/hail/i){
    quest::say("Hello, How may I help you?");
    }
  if($text=~/slate/i){
   quest::say("Luckily for you, someone found this stuck in a bush.");
    quest::summonitem(2877);
    }
  }

sub EVENT_ITEM {
my $slate = quest::saylink("slate", 1);
  if(plugin::check_handin(\%itemcount, 2873 => 1)) {
    quest::say("Young $name, I will be happy to process your registration for you. While I etch your name on our people's book of records I will require you to run a couple of errands. Take this certificate to the tax collector and obtain his seal. While you're out doing that, have Mignah create your personal Acrylia slate for you. Bring both the seal and the slate to me as soon as you can.");
    quest::exp(50);
    quest::summonitem("2874");
    }
  elsif(plugin::check_handin(\%itemcount, 2875 => 1, 2876 => 1)) {
    quest::say("Ahh, there you are. I was about to send someone looking for you. Everything seems to be in order here, only one task remains. You must gain audience with the king and swear fealty to his highness by handing him this document. Return to me when this is done.");
    quest::summonitem(18299);
    quest::ding();
    quest::exp(50);
    }
  elsif(plugin::check_handin(\%itemcount, 18304 => 1)) {
    quest::say("Well done, $name, I am honored to be the first to welcome you to citizenship of Shar Vahl! May you serve our society as well as it serves you. Return to your guildmaster and present both the slate and the application to him. The acrylia slate shall henceforth serve as proof of your citizenship.");
    quest::summonitem("2877");
    quest::summonitem("2897");
    quest::say("Oh, by the way, be careful with this as it will be important for recording your service to our society. If you should somehow lose it, ask me about your $slate and I will issue you a new one.");
    quest::exp(100);
    quest::faction(175,10);
    quest::faction(2806,10);
  }
  else {
    plugin::return_items(\%itemcount);
   }
}


#END of FILE ZONE:sharvahl ID:155078 -- Registrar_Bindarah