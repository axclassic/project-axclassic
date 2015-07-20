sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 8467 =>1 )) {
    quest::say("Thank you for delivering this. While I have you here, perhaps you can help. We are in dire need of assistance in the moor. All of the reports from our Taruun are indicating the same thing. The area has to be swept clear of the factions that currently inhabit it. The land itself seems defendable, we need someone to gather some soldiers and clear the area.");
    quest::say("If you accomplish this mission for us, I will be able to reward you for your actions in this leadership role. You will need only to return this box to me to collect your reward and promotion. It will need to contain a grimling chieftain staff, an owlbear guardian talon, a sonic wolf guardian fang, and your Journeyman's Cloak. Good luck to you, should you elect to accept this challenge.");
    quest::ding();
    quest::exp(10000);
    quest::summonitem(17133);
    }
   elsif (plugin::check_handin(\%itemcount, 8491 =>1 )) {
    quest::say("You have proven to be a great leader and excellent soldier. Please accept this cloak as a symbol of your accomplishment. We would be proud to have you as a member of our ranks. You can choose to stay within the ranks of your sect or you can work with us was a member of the Shar Vahl Garrison. If you wish to continue your work as a member of the garrison, please take this form, sign it in triplicate and give it to Veteran Darznel. Either way, please stand still, while I offer you our formal salutation.");
    quest::shout("Ahem... Citizens of Shar Vahl, Attention! It is my duty and honor as commander of the Shar Vahl Garrison to thank $name for their fine work. Give 'em your complete respect and salute 'em when you see them in passing. We enjoy our freedom, because of brave citizens like #name. Thank you for your time... Carry on!");
    quest::summonitem(8471);
    quest::ding();
    quest::exp(10000);
    }
   else {
    plugin::return_items(\%itemcount);
    }
}