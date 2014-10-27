#Metafuze reencarnated zebeker pet#
sub EVENT_SPAWN {
quest::say("I'm free! Now, as promised, I'll tell you everything I know. My master snuck in here through a secret entrance and unleashed this curse upon the Nest. She wanted vengeance against the dragons for their 'crimes' as she often put it. I could tell that much by her maddening rants. Unfortunately, I cannot say more. My master left me here shortly after completing the curse and said that if I ever repeated her name, I would be blasted from Norrath before I could pronounce the first syllable. I believe her too!");

quest::say("I can only give you a clue  as to her name... She is near Lavastorm.");
quest::say("Return to your master, Chieftain Relae Aderi and speak the name I dare not.");
quest::ding();
quest::exp();
quest::givecash();
quest::depop();
}
}