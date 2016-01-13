##Boss_Counter_Owlbear##
my $owlbear_take_over_event = 0;

sub EVENT_SPAWN{
         $owlbear_take_over_event = 0;
       $counter = undef;
       $owlbear_take_over_event += 1;	# adds one to spawn variable #
    }
sub EVENT_SIGNAL{
  if($signal == 607){
       $counter = 0;	
    }
if($signal == 401) { ##signal 401 is from each owlbear boss owlbear screechmaw, Skriat Chee, Skriat Chu##
    $counter += 3;
	   if($counter == 3) {
   quest::depop(166081); #Rittuh Purrik
   quest::depop(166080); #Sergeant Tylah
   quest::depop(166078); #Guard Klilnaw
   quest::depop(166079); #Guard Rawkkun
   quest::depop(166083); #Kerr Tiparr
   quest::depop(166084); #Tolah Rakknak
   quest::depop(166082); #Tokk Smippah
   quest::spawn2(166771,498127,0,1975,978.8,34,121); #Guard Kliknaw afraid
   quest::spawn2(166772,498132,0,2011.9,991.9,34.2,111.5); #Guard Rawkkun afraid
   quest::spawn2(166773,498129,0,1924.8,1096.9,25.6,170.4); #Kerr Tiparr afraid
   quest::spawn2(166774,498130,0,2026.6,1071,25.6,93.2); #Rittuh Purrik afraid
   quest::spawn2(166775,498131,0,1921.9,1009.9,29.4,33.5); #Sergeant Tylah afraid
   quest::spawn2(166967,498133,0,1928,1141,25.6,77.5); #Tolah Rakknak afraid
   quest::spawn2(166968,498134,0,1993,1063,25.6,255.5); #Tokk Smippah afraid
   quest::signalwith(166783,402,5000);
  }
 }
}
