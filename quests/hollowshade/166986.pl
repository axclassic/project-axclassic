##North Cave Delay respawn check against Sonic Wolves##
sub EVENT_SIGNAL{
if ($signal == 2001) {
   quest::settimer("delay_wolves_north_cave_timer",180);
  }
if($signal == 2002){
   quest::depop(166);
  }
if($signal == 2003){
   quest::depop(166);
  }
if($signal == 2004){
   quest::depop(166);
	}
if($signal == 2005){
   quest::depop(166);
	}
if($signal == 2006){
   quest::depop(166);
  }
if($signal == 2007){
   quest::depop(166);
	}
if($signal == 2008){   
   quest::depop(166);
	}
if($signal == 2009){   
   quest::depop(166);
	}
if($signal == 2010){   
   quest::depop(166);
	}
if($signal == 2011){   
   quest::depop(166);
	}
if($signal == 2012){   
   quest::depop(166);
  }
if($signal == 2013){
   quest::depop(166);
  }
if($signal == 2014){
   quest::depop(166);
  }
if($signal == 2015){
   quest::depop(166);
  }
if($signal == 2016){
   quest::depop(166);
  }
if($signal == 2017){
   quest::depop(166);
  }
if($signal == 2018){
   quest::depop(166);
  }
if($signal == 2019){
   quest::depop(166);
  }
if($signal == 2020){
   quest::depop(166);
  }
if($signal == 2021){
   quest::depop(166);
  }
if($signal == 2022){
   quest::depop(166);
  }
if($signal == 2023){
   quest::depop(166);
  }
if($signal == 2024){
   quest::depop(166);
  }
if($signal == 2025){
   quest::depop(166);
  }
if($signal == 2026){
   quest::depop(166);
	}
if($signal == 2027){
   quest::depop(166);
  }
if($signal == 2028){
   quest::depop(166);
	}
if($signal == 2029){
   quest::depop(166);
  }
if($signal == 2030){
   quest::depop(166);
  }
if($signal == 2031){
   quest::depop(166);
  }
if($signal == 2032){
   quest::depop(166);
  }
if($signal == 2033){
   quest::depop(166);
  }
if($signal == 2034){
   quest::depop(166);
  }
if($signal == 2035){
   quest::depop(166);
  }
if($signal == 2036){
   quest::depop(166);
  }
if($signal == 2037){
   quest::depop(166);
  }
if($signal == 2038){
   quest::depop(166);
  }
if($signal == 2039){
   quest::depop(166);
  }
if($signal == 2040){
   quest::depop(166);
  }
if($signal == 2041){
   quest::depop(166);
  }
if($signal == 2042){
   quest::depop(166);
  }
if($signal == 2043){
   quest::depop(166);
  }
if($signal == 2044){
   quest::depop(166);
  }
if($signal == 2045){
   quest::depop(166);
  }
if($signal == 2046){
   quest::depop(166);
  }
if($signal == 2047){
   quest::depop(166);
  }
if($signal == 2048){
   quest::depop(166);
  }
if($signal == 2049){
   quest::depop(166);
  }
if($signal == 2050){
   quest::depop(166);
  }
if($signal == 2051){
   quest::depop(166);
  }
if($signal == 2052){
   quest::depop(166);
  }
if($signal == 2053){
   quest::depop(166);
  }
if($signal == 2054){
   quest::depop(166);
  }
if($signal == 2055){
   quest::depop(166);
  }
if($signal == 2056){
   quest::depop(166);
  }
if($signal == 2057){
   quest::depop(166);
  }
if($signal == 2058){
   quest::depop(166);
  }
if($signal == 2059){
   quest::depop(166);
  }
if($signal == 2060){
   quest::depop(166);
  }
if($signal == 2061){
   quest::depop(166);
  }
if($signal == 2062){
   quest::depop(166);
  }
if($signal == 2063){
   quest::depop(166);
  }
if($signal == 2064){
   quest::depop(1662);
  }
if($signal == 2065){
   quest::depop(166);
  }
if($signal == 2066){
   quest::depop(166);
  }
if($signal == 2067){
   quest::depop(166);
  }
if($signal == 2068){
   quest::depop(166);
  }
if($signal == 2069){
   quest::depop(166);
  }
if($signal == 2070){
   quest::depop(166);
  }
if($signal == 2071){
   quest::depop(166);
  }
if($signal == 2072){
   quest::depop(166);
  }
if($signal == 2073){
   quest::depop(166);
  }
if($signal == 2074){
   quest::depop(166);
  }
if($signal == 2075){
   quest::depop(166);
  }
if($signal == 2076){
   quest::depop(166);
  }
if($signal == 2077){
   quest::depop(166);
  }
if($signal == 2078){
   quest::depop(166);
  }
if($signal == 2079){
   quest::depop(166);
  }
}
 sub EVENT_TIMER{
 if($timer eq "delay_wolves_north_cave_timer"){
     quest::stoptimer("delay_wolves_north_cave_timer");
   quest::depop();
   }
 }  
