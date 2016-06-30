# 111147 lucid_spirit_of_Abrams

sub EVENT_SPAWN {
	quest::settimer("settime", 300); #10 seconds or 300 seconds(5 min)
}


sub EVENT_SAY {
	if($text=~/hail/i) {
	 quest::say("Where am I? Oh god no, please let this be a simple nightmare. Please don't hold my 
	 withering soul here any longer! Who are you? Why have you freed me? Please tell me it is over.");
	}
	if($text=~/soul/i) {
	quest::emote("looks about the corridor, paranoia gelaming in his ghostly eyes. He stammers out, 
	'She's trapped me soul here in her accursed tower. Don't speak too loudly or she'll hear ye. When me mad form is 
	destroyed I am free fer a short time, only to remember me life as it once was and the fate I now endure. 
	Unfortunately, I be doomed to this existence forever. Tell me before I am pulled away again, why have ye freed me?"); 
	}
}

sub EVENT_ITEM {
	quest::say("Errm... okay thanks.");
}

sub EVENT_TIMER {
	if($timer eq "settime") {
		quest::emote("suddenly clasps his hands over his ears and wails. He begins to fade 
		away until all that is left is the echo of his tormented screams.");
		quest::depop();
	}
}