sub EVENT_SAY { if($text=~/Hail/i){quest::say("Welcome, $name .  Please feel at ease here in the Temple of Thunder.  We, the Knights of Thunder, are here to guide and serve."); }}
sub EVENT_ITEM { 	if (plugin::check_handin(\%itemcount, 18715 => 1)){	quest::say("Ah! A new recruit. Here take this tunic of the Temple of Thunder. wear it well and may it protect you as you grow. Praise be to Karana! The Storm Lord $name.");
    quest::summonitem(13505);    quest::ding();	quest::faction(33, 10);  #Guards of Qeynos    quest::faction(53, 10);  #Priests of Life    quest::faction(164, -30);  #Bloodsabers	quest::exp(1000); 	} else{      #do all other handins first with plugin, then let it do disciplines      plugin::try_tome_handins(\%itemcount, $class, 'Cleric');      plugin::return_items(\%itemcount);    }
}
#END of FILE Zone:qeynos  ID:1055 -- Renic_Losaren 

