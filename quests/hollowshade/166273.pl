##Boss_Counter_Grimlings##
my $grimling_take_over_event = 0;

sub EVENT_SPAWN{
         $grimling_take_over_event = 0;
       $counter = undef;
       $grimling_take_over_event += 1;	# adds one to spawn variable #
    }
sub EVENT_SIGNAL{
  if($signal == 609){
       $counter = 0;	
    }
  if($signal == 203){
   quest::spawn2(166495,0,0,1988,1128,28.3,154); #a grimling guard
   quest::spawn2(166792,0,0,1974.7,1143.6,25.6,129.5); #Prince Garzemort
   quest::spawn2(166594,0,0,1956.3,1129.3,25.6,131.9); #a grimling guard
   quest::spawn2(166782,0,0,1978,982.1,31.2,121); #a grimling conqueror
   quest::spawn2(166780,0,0,2009.3,991.1,34.2,117.1); #a grimling manacrafter
   quest::spawn2(166778,0,0,1921.5,1009.1,29.4,24.4); #a grimling thief
   quest::spawn2(166781,0,0,1925.5,1097.7,25.6,140.1); #a grimling soldier
   quest::spawn2(166779,0,0,2026.6,1071.1,25.6,68.8); #a grimling spiritist
   quest::depop(166783);
         $counter = 0;
   quest::depop();
  }
	if($signal == 201) { ##signal 201 is from each grimling boss Gleeknot Gnitrat, Grurn No Eyes, Fabled Grurn No Eyes, Gniktar Grimwit##
    $counter += 1;
	   if($counter == 3) {
   quest::depop(166081); #Rittuh Purrik
   quest::depop(166080); #Sergeant Tylah
   quest::depop(166078); #Guard Klilnaw
   quest::depop(166079); #Guard Rawkkun
   quest::depop(166083); #Kerr Tiparr
   quest::spawn2(166771,498127,0,1975,978.8,34,121); #Guard Kliknaw afraid
   quest::spawn2(166772,498132,0,2011.9,991.9,34.2,111.5); #Guard Rawkkun afraid
   quest::spawn2(166773,498129,0,1924.8,1096.9,25.6,170.4); #Kerr Tiparr afraid
   quest::spawn2(166774,498130,0,2026.6,1071,25.6,93.2); #Rittuh Purrik afraid
   quest::spawn2(166775,498131,0,1921.9,1009.9,29.4,33.5); #Sergeant Tylah afraid
   quest::signalwith(166783,202,5000);
  }
 }
}

