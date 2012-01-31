on *:START: {
  if (!$hget(ProHLer.Tmp)) hmake ProHLer.Tmp 1
  if (!$hget(ProHLer)) hmake ProHLer 3
}

menu * {
  ProHLer
  .$iif(!%ProHLer.On,$style(2))Turn ProHLer Off:/ProHLer.Off
  .$iif(%ProHLer.On,$style(2))Turn ProHLer On:/ProHLer.On
  .-
  .Open ProHler:/ProHLer.Open
}
menu nicklist {
  ProHLer
  .$iif($1 == $null,$style(2)) Add to NonHighlighting Nicknames:/ProHLer.Menu.NickList.1 $1
}
menu @ProHLer.* {
  dclick:/ProHLer.Menu.Window.2 $1-
  ProHLer
  .Add to NonHighlighting Nicknames:ProHLer.Menu.Window.1 $active
}

;If You have your own color identifers you can replace the ProHLer identifers with something like this:
;alias ProHLer.C1 {
;  var %c = $c1(MSG)
;  %c = $gettok($remove(%c,,MSG),1,44)
;  return $iif($prop == code,%c,$iif($1,$+(,%c,$1),$+(,%c))) 
;}
alias ProHLer.C1 {
  if (%ProHLer.CustomColors.On) {
    if (%ProHLer.CustomColors.1 != $false) var %c $iif($v1 < 10, $+(0,$v1), $v1))
  }
  else var %c = 04
  %c = $gettok($remove(%c,,MSG),1,44)
  return $iif($prop == code,%c,$iif($1,$+(,%c,$1),$+(,%c))) 
}
alias ProHLer.C2 {
  if (%ProHLer.CustomColors.On) {
    if (%ProHLer.CustomColors.2 != $false) var %c $iif($v1 < 10, $+(0,$v1), $v1))
  }
  else var %c = 03
  %c = $gettok($remove(%c,,MSG),1,44)
  return $iif($prop == code,%c,$iif($1,$+(,%c,$1),$+(,%c))) 
}
alias ProHLer.C3 {
  var %c = 02
  %c = $gettok($remove(%c,,MSG),1,44)
  return $iif($prop == code,%c,$iif($1,$+(,%c,$1),$+(,%c))) 
}
alias ProHLer.C4 {
  var %c = 05
  %c = $gettok($remove(%c,,MSG),1,44)
  return $iif($prop == code,%c,$iif($1,$+(,%c,$1),$+(,%c))) 
}
alias ProHLer.CloseWindows {
  if ($input(Are you sure you want to close all the ProHLer windows?,yqd,ProHLer - Question)) {
    var %total $window(@ProHLer.*,0)
    close -@ProHLer.*
    if ($dialog(ProHLer.DMain)) dialog -x $v1
    if ($dialog(ProHLer.DNoHL)) dialog -x $v1
    if ($dialog(ProHLer.DHLers)) dialog -x $v1
    if ($dialog(ProHLer.DResetStats)) dialog -x $v1
    if ($dialog(ProHLer.DSettings)) dialog -x $v1
    noop $input(All ProHLer windows are closed! Total: %total,oid,ProHLer - Info)
  }
}
alias ProHLer.Help {
  if ($window(@ProHLer.Help)) {
    clear @ProHLer.Help
  }
  else window -k0vxz @ProHLer.Help
  aline $ProHLer.C1().code @ProHLer.Help <***>ProHLer HighLight detection script by: Marlinc - Version $ProHLer.Version $+ <***>
  aline $ProHLer.C3().code @ProHLer.Help Common aliases:
  aline @ProHLer.Help $ProHLer.C2(/ProHLer.Open) $ProHLer.C1(=) $ProHLer.C3(Opens the main screen of ProHLer wich provides Stats and Settings)
  aline @ProHLer.Help $ProHLer.C2(/ProHLer.CloseWindows) $ProHLer.C1(=) $ProHLer.C3(Closes all the ProHLer windows)
  aline @ProHLer.Help $ProHLer.C2(/ProHLer.Help) $ProHLer.C1(=) $ProHLer.C3(Opens this help screen)
  aline @ProHLer.Help $ProHLer.C2(/ProHLer.On) $ProHLer.C1(=) $ProHLer.C3(This will turn ProHLer on)
  aline @ProHLer.Help $ProHLer.C2(/ProHLer.Off) $ProHLer.C1(=) $ProHLer.C3(This will turn ProHLer off)
  aline @ProHLer.Help $ProHLer.C2(/ProHLer.Changelog) $ProHLer.C1(=) $ProHLer.C3(Opens the ProHLer changelog)
  aline $ProHLer.C3().code @ProHLer.Help -----
  aline $ProHLer.C3().code @ProHLer.Help Developer aliases/identifiers/variables:
  aline @ProHLer.Help $ProHLer.C2(/ProHLer.Nicks.Filter) $ProHLer.C1(=) $ProHLer.C3(Sorts the nicknames that highlighted you to a file called ProHLer.NicksOUT.txt)
  aline @ProHLer.Help $ProHLer.C2(/ProHLer.Chans.Filter) $ProHLer.C1(=) $ProHLer.C3(Sorts the channels where you are highlighted you to a file called ProHLer.ChansOUT.txt)
  aline @ProHLer.Help $ProHLer.C2($!ProHLer.Version) $ProHLer.C1(=) $ProHLer.C3(Returns the current ProHLer version)
  aline @ProHLer.Help $ProHLer.C2($!ProHLer.Duration) $ProHLer.C1(=) $ProHLer.C3(Returns a $ProHLer.Duration(12345) format of $!duration)
  aline @ProHLer.Help $ProHLer.C2($!ProHLer.C1) $ProHLer.C1(=) $ProHLer.C3(Returns ProHLer color 1)
  aline @ProHLer.Help $ProHLer.C2($!ProHLer.C2) $ProHLer.C1(=) $ProHLer.C3(Returns ProHLer color 2)
  aline @ProHLer.Help $ProHLer.C2($!ProHLer.C3) $ProHLer.C1(=) $ProHLer.C3(Returns ProHLer color 3)
  aline @ProHLer.Help $ProHLer.C2($!ProHLer.C4) $ProHLer.C1(=) $ProHLer.C3(Returns ProHLer color 4)
  aline @ProHLer.Help $ProHLer.C2($!ProHLer.C5) $ProHLer.C1(=) $ProHLer.C3(Returns ProHLer color 5)
  aline @ProHLer.Help $ProHLer.C2($!ProHler.NoHL) $ProHLer.C1(=) $ProHLer.C3(If no nickname specified it will return a list of nicknames that can't highlight you)
  aline @ProHLer.Help $ProHLer.C2($+(%,ProHLer.LastUpdate)) $ProHLer.C1(=) $ProHLer.C3(Returns the time of the last update in $!ctime format)
  aline @ProHLer.Help $ProHLer.C2($+(%,ProHLer.Version)) $ProHLer.C1(=) $ProHLer.C3(Returns the current ProHLer version. This is only to check if you updated you ProHLer version)
  aline @ProHLer.Help $ProHLer.C2($+(%,ProHLer.TotalHls)) $ProHLer.C1(=) $ProHLer.C3(Returns the total of highlights you got)
}
alias ProHLer.ChangeLog {
  if ($window(@ProHLer.Help)) {
    clear @ProHLer.Help
  }
  else window -k0vxz @ProHLer.Help
  aline $ProHLer.C1().code @ProHLer.Help <***>ProHLer HighLight detection script by: Marlinc - Version $ProHLer.Version $+ <***>
  aline $ProHLer.C3().code @ProHLer.Help Changelog $ProHLer.Version $+ :
  aline @ProHLer.Help $ProHLer.C2(----- 1 -----) $ProHLer.C1(=) $ProHLer.C3(Add updatechecker bug fixed)
  aline @ProHLer.Help $ProHLer.C2(----- 2 -----) $ProHLer.C1(=) $ProHLer.C3(Added a ACTION HighLight checkbox to turn it off)
  aline @ProHLer.Help $ProHLer.C2(----- 3 -----) $ProHLer.C1(=) $ProHLer.C3(Added custom color support)
  aline @ProHLer.Help $ProHLer.C2(----- 4 -----) $ProHLer.C1(=) $ProHLer.C3(Added spam protect)
  aline @ProHLer.Help $ProHLer.C2(----- 5 -----) $ProHLer.C1(=) $ProHLer.C3(Added a question to ask if you want HighLight on ACTION enabled)
}

alias ProHLer.Duration {
  return $replacecs($duration($1),hrs,Hours,hr,Hour,mins,Minutes,min,Minute,secs,Seconds,sec,Second,days,Days,day,Day,wks,Weeks,wk,Week)
}
alias ProHLer.Menu.NickList.1 {
  set %proHler.DNoHL.nick $1
  dialog -mordv ProHLer.DNoHL ProHLer.DNoHL 
}
alias ProHLer.Menu.Window.1 {
  set %proHler.DNoHL.nick $remove($1,@ProHLer.)
  dialog -mordv ProHLer.DNoHL ProHLer.DNoHL 
}
alias ProHLer.Menu.Window.2 {
  if ($mouse.lb) {
    if ($1 == 1) {
      set %proHler.DNoHL.nick $remove($active,@ProHLer.)
      dialog -mordv ProHLer.DNoHL ProHLer.DNoHL 
    }
    elseif ($1 == 2) ProHLer.Open
    elseif ($1 == 3) window -c $active
    elseif ($1 == 4) ProHLer.CloseWindows
  }
}
alias ProHLer.UpdateCheck.Start {
  set %ProHLer.UpdateCheck.LastCheck $ctime
  if ($sock(ProHLer.UpdateCheck)) echo -a socket is al open
  else {
    if ($1) set %ProHLer.UpdateCheck.Alias $1
    else set %ProHLer.UpdateCheck.Alias ProHLer.UpdateCheck.Return1
    if ($window(@ProHLer.UpdateCheck)) clear @ProHLer.UpdateCheck
    else window -k0n2h @ProHLer.UpdateCheck
    aline $ProHLer.C1().code @ProHLer.UpdateCheck <***>ProHLer HighLight detection script by: Marlinc - Version $ProHLer.Version $+ <***>
    aline $ProHLer.C3().code @ProHLer.UpdateCheck Checking for new version...
    sockopen ProHLer.UpdateCheck mchosts.co.cc 80
  }
}
on *:sockopen:ProHLer.UpdateCheck*: {
  sockwrite -nt $sockname GET /mirc/ProHLer-UpdateCheck.php HTTP/1.1
  sockwrite -nt $sockname Host: mchosts.co.cc
  sockwrite -nt $sockname User-Agent: ProHLer VersionCheck
  sockwrite -nt $sockname $crlf
}
on *:sockread:ProHLer.UpdateCheck*: {
  if ($sockerr > 0) halt
  var %data
  sockread %data
  set %ProHLer.UpdateCheck.HTTP.Code $gettok(%data,2,32)
  set %ProHLer.UpdateCheck.HTTP.Response $gettok(%data,3-,32)
  while ($sockbr) {
    sockread %data
    if (DATA:* iswm %data) {
      var %data $mid(%data,6)
      set %ProHLer.UpdateCheck.Data.NewVersion $gettok(%data,1,44)
      set %ProHLer.UpdateCheck.Data.SwiftIRCUrl $gettok(%data,2,44)
    }
  }
  ProHLer.UpdateCheck.Check
}
alias ProHLer.UpdateCheck.Check {
  if ($window(@ProHLer.UpdateCheck)) {
    if (%ProHLer.UpdateCheck.HTTP.Code == 200) {
      aline $ProHLer.C1().code @ProHLer.UpdateCheck Data downloaded successfull!
      aline $ProHLer.C1().code @ProHLer.UpdateCheck Checking data...
      aline @ProHLer.UpdateCheck $ProHLer.C1(The newest) $ProHLer.C2(ProHLer) $ProHLer.C1(version is) $ProHLer.C2(%ProHLer.UpdateCheck.Data.NewVersion)
      if ($ProHLer.Version < %ProHLer.UpdateCheck.Data.NewVersion) {
        aline @ProHLer.UpdateCheck $ProHLer.C1(Please go to) $ProHLer.C2(%ProHLer.UpdateCheck.Data.SwiftIRCUrl) $ProHLer.C1(and upgrade ur) $ProHLer.C2(ProHLer) $ProHLer.C1(to version) $ProHLer.C2(%ProHLer.UpdateCheck.Data.NewVersion) $+ $ProHLer.C1(!)
      }
      else aline @ProHLer.UpdateCheck $ProHLer.C1(You already got the newest version of) $ProHLer.C2(ProHLer) $ProHLer.C1(there no need to upgrade!)
    }
    else {
      aline $ProHLer.C1().code @ProHLer.UpdateCheck An error has occurred while checking for a new version:
      aline @ProHLer.UpdateCheck $ProHLer.C1(HTTP-Errorcode =) $c2(%ProHLer.UpdateCheck.HTTP.Code)
      aline @ProHLer.UpdateCheck $ProHLer.C1(HTTP-Errorname =) $c2(%ProHLer.UpdateCheck.HTTP.Response)
    }
    aline $ProHLer.C3().code @ProHLer.UpdateCheck -----
  }
  if (%ProHLer.UpdateCheck.Alias) .timerProHLer.UpdateCheck.AliasTimer 1 0 %ProHLer.UpdateCheck.Alias @ProHLer.UpdateCheck
}
alias ProHLer.UpdateCheck.Return1 {
  window -a $gettok($1,1,59)
}
alias ProHLer.UpdateCheck.Return2 {
  if (%ProHLer.UpdateCheck.HTTP.Code == 200) {
    if ($ProHLer.Version < %ProHLer.UpdateCheck.Data.NewVersion) {
      if ($dialog(ProHLer.DMain)) dialog -n $v1
      if ($input(ProHLer Version %ProHLer.UpdateCheck.Data.NewVersion is now available! Do you want to see the update url?,yqd,ProHLer - Question)) {
        window -aw3 @ProHLer.UpdateCheck
      }
      if ($dialog(ProHLer.DMain)) dialog -o $v1
    }
    else window -c @ProHLer.UpdateCheck
  }
  else window -c @ProHLer.UpdateCheck
}
alias ProHler.Version { return 1.32 }
alias ProHLer.Open {
  if ($dialog(ProHLer.DMain)) dialog -x ProHLer.DMain
  if (%ProHLer.On == $null) set %ProHLer.On $true
  if (%ProHLer.Version) {
    if (%ProHLer.Version < $ProHler.Version) {
      var %OldVer %ProHLer.Version
      if (%ProHLer.LastUpdate) var %OldUpdate %ProHLer.LastUpdate
      ProHLer.Nicks.Filter
      ProHLer.Chans.Filter
      noop $input(Thank you for upgrading to ProHLer version " $+ $ProHLer.Version $+ "! $crlf $crlf Please wait patient while we check your current settings!,oid,ProHLer - Info)
      window -xdok0g1 @ProHLer.SettingsCheck
      aline $ProHLer.C1().code @ProHLer.SettingsCheck <***>ProHLer HighLight detection script by: Marlinc<***>
      aline $ProHLer.C3().code @ProHLer.SettingsCheck Loading nickname's that HighLighted you:
      var %i = 1
      while (%i <= $lines(ProHLer.NicksOUT.txt)) {
        var %name $gettok($read(ProHLer.NicksOUT.txt,n,%i),2,59)
        var %times = $gettok($read(ProHLer.NicksOUT.txt,n,%i),3,59)
        aline @ProHLer.SettingsCheck $ProHLer.C2(%name) $ProHLer.C1(=) $ProHLer.C1(%times)
        inc %i
      }
      aline $ProHLer.C3().code @ProHLer.SettingsCheck -----
      aline $ProHLer.C3().code @ProHLer.SettingsCheck Loading channels where you are HighLighted on:
      var %i = 1
      while (%i <= $lines(ProHLer.ChansOUT.txt)) {
        var %name $gettok($read(ProHLer.ChansOUT.txt,n,%i),2,59)
        var %times = $gettok($read(ProHLer.ChansOUT.txt,n,%i),3,59)
        aline @ProHLer.SettingsCheck $ProHLer.C2(%name) $ProHLer.C1(=) $ProHLer.C1(%times)
        inc %i
      }
      aline $ProHLer.C3().code @ProHLer.SettingsCheck -----
      aline $ProHLer.C3().code @ProHLer.SettingsCheck Setting variables:
      aline @ProHLer.SettingsCheck $ProHLer.C1(Setting var:) $ProHLer.C2($+(%,ProHLer.LastUpdate)) $ProHLer.C1(To) $ProHLer.C2($ctime)
      set %ProHLer.LastUpdate $ctime
      aline @ProHLer.SettingsCheck $ProHLer.C1(Setting var:) $ProHLer.C2($+(%,ProHLer.Version)) $ProHLer.C1(To) $ProHLer.C2($ProHLer.Version)
      set %ProHLer.Version $ProHLer.Version
      if (!%ProHLer.UpdateCheck.On) {
        window -u @ProHLer.SettingsCheck
        if ($input(Do you want ProHLer to check for a new version everytime you open the main window?,yqd,ProHLer - Question)) {
          aline @ProHLer.SettingsCheck $ProHLer.C1(Setting var:) $ProHLer.C2($+(%,ProHLer.UpdateCheck.On)) $ProHLer.C1(To) $ProHLer.C2($!true)
          set %ProHLer.UpdateCheck.On $true
        }
        else {
          aline @ProHLer.SettingsCheck $ProHLer.C1(Setting var:) $ProHLer.C2($+(%,ProHLer.UpdateCheck.On)) $ProHLer.C1(To) $ProHLer.C2($!false)
          set %ProHLer.UpdateCheck.On $false
        }
        window -o @ProHLer.SettingsCheck
      }
      if (!%ProHLer.ActionHighLight) {
        window -u @ProHLer.SettingsCheck
        if ($input(Do you want to get HighLighted on ACTION?,yqd,ProHLer - Question)) {
          aline @ProHLer.SettingsCheck $ProHLer.C1(Setting var:) $ProHLer.C2($+(%,ProHLer.ActionHighLight)) $ProHLer.C1(To) $ProHLer.C2($!true)
          set %ProHLer.ActionHighLight $true
        }
        else {
          aline @ProHLer.SettingsCheck $ProHLer.C1(Setting var:) $ProHLer.C2($+(%,ProHLer.ActionHighLight)) $ProHLer.C1(To) $ProHLer.C2($!false)
          set %ProHLer.ActionHighLight $false
        }
        window -o @ProHLer.SettingsCheck
      }
      aline $ProHLer.C3().code @ProHLer.SettingsCheck -----
      aline $ProHLer.C3().code @ProHLer.SettingsCheck Creating hashtables:
      if (!$hget(ProHLer.Tmp)) {
        aline @ProHLer.SettingsCheck $ProHLer.C1(Creating hashtable:) $ProHLer.C2(ProHLer.Tmp)
        hmake ProHLer.Tmp 1
      }
      if (!$hget(ProHLer)) {
        aline @ProHLer.SettingsCheck $ProHLer.C1(Creating hashtable:) $ProHLer.C2(ProHLer)
        hmake ProHLer 3
      }
      aline $ProHLer.C3().code @ProHLer.SettingsCheck -----
      aline $ProHLer.C3().code @ProHLer.SettingsCheck Thank you for upgrading to ProHLer version " $+ $ProHLer.Version $+ " from version " $+ %OldVer $+ "!   
      if (%oldUpdate) aline $ProHLer.C3().code @ProHLer.SettingsCheck Your last update was on $asctime(%OldUpdate) that was $ProHLer.Duration($calc($ctime - %OldUpdate)) ago!
    }
    else {
      if (%ProHLer.UpdateCheck.On) {
        ProHLer.UpdateCheck.Start ProHLer.UpdateCheck.Return2
      }
    }
  }
  else {
    noop $input(Thank you for installing ProHLer version " $+ $ProHLer.Version $+ "! $crlf $crlf Please wait patient while we set some settings!,oid,ProHLer - Info)
    window -xdok0g1 @ProHLer.SettingsCheck
    aline $ProHLer.C1().code @ProHLer.SettingsCheck <***>ProHLer HighLight detection script by: Marlinc<***>
    aline $ProHLer.C3().code @ProHLer.SettingsCheck Setting variables:
    aline @ProHLer.SettingsCheck $ProHLer.C1(Setting var:) $ProHLer.C2($+(%,ProHLer.LastUpdate)) $ProHLer.C1(To) $ProHLer.C2($ctime)
    set %ProHLer.LastUpdate $ctime
    aline @ProHLer.SettingsCheck $ProHLer.C1(Setting var:) $ProHLer.C2($+(%,ProHLer.Version)) $ProHLer.C1(To) $ProHLer.C2($ProHLer.Version)
    set %ProHLer.Version $ProHLer.Version
    window -u @ProHLer.SettingsCheck
    if ($input(Do you want ProHLer to check for a new version everytime you open the main window?,yqd,ProHLer - Question)) {
      aline @ProHLer.SettingsCheck $ProHLer.C1(Setting var:) $ProHLer.C2($+(%,ProHLer.UpdateCheck.On)) $ProHLer.C1(To) $ProHLer.C2($!true)
      set %ProHLer.UpdateCheck.On $true
    }
    else {
      aline @ProHLer.SettingsCheck $ProHLer.C1(Setting var:) $ProHLer.C2($+(%,ProHLer.UpdateCheck.On)) $ProHLer.C1(To) $ProHLer.C2($!false)
      set %ProHLer.UpdateCheck.On $false
    }
    if ($input(Do you want to use " $+ $me $+ " as a highlighter?,yqd,ProHLer - Question)) {
      aline @ProHLer.SettingsCheck $ProHLer.C1(Setting var:) $ProHLer.C2($+(%,ProHLer.Highlights)) $ProHLer.C1(To) $ProHLer.C2($me)
      set %ProHLer.Highlights $me
    }
    window -u @ProHLer.SettingsCheck
    if ($input(Do you want to get HighLighted on ACTION?,yqd,ProHLer - Question)) {
      aline @ProHLer.SettingsCheck $ProHLer.C1(Setting var:) $ProHLer.C2($+(%,ProHLer.ActionHighLight)) $ProHLer.C1(To) $ProHLer.C2($!true)
      set %ProHLer.ActionHighLight $true
    }
    else {
      aline @ProHLer.SettingsCheck $ProHLer.C1(Setting var:) $ProHLer.C2($+(%,ProHLer.ActionHighLight)) $ProHLer.C1(To) $ProHLer.C2($!false)
      set %ProHLer.ActionHighLight $false
    }
    window -o @ProHLer.SettingsCheck
    aline $ProHLer.C3().code @ProHLer.SettingsCheck -----
    aline $ProHLer.C3().code @ProHLer.SettingsCheck Creating hashtables:
    if (!$hget(ProHLer.Tmp)) {
      aline @ProHLer.SettingsCheck $ProHLer.C1(Creating hashtable:) $ProHLer.C2(ProHLer.Tmp)
      hmake ProHLer.Tmp 1
    }
    if (!$hget(ProHLer)) {
      aline @ProHLer.SettingsCheck $ProHLer.C1(Creating hashtable:) $ProHLer.C2(ProHLer)
      hmake ProHLer 3
    }
    aline $ProHLer.C3().code @ProHLer.SettingsCheck -----
    aline $ProHLer.C3().code @ProHLer.SettingsCheck Thank you for installing ProHLer version " $+ $ProHLer.Version $+ "!
  }
  dialog -mordv ProHLer.DMain ProHLer.DMain 
}
alias ProHLer.DMain.Reload {
  ProHLer.Nicks.Filter
  ProHLer.Chans.Filter

  if ($dialog(ProHLer.DMain)) {
    did -ra ProHLer.DMain 31 $bytes($iif(%ProHLer.TotalHls isnum,%ProHLer.TotalHls,0),bd)
    did -ra ProHLer.DMain 37 $bytes($iif(%ProHLer.TotalHls isnum,$var(%ProHLer.Nicks.*,0),0),bd)
    did -ra ProHLer.DMain 39 $bytes($iif(%ProHLer.TotalHls isnum,$var(%ProHLer.Chans.*,0),0),bd)
    var %name $gettok($read(ProHLer.NicksOUT.txt,n,1),2,59)
    var %times = $gettok($read(ProHLer.NicksOUT.txt,n,1),3,59)
    did -ra ProHLer.DMain 33 $iif(%name,%name,None) $+ $chr(40) $+ $bytes($iif(%times,%times,0),bd) $+ $chr(41)
    var %chan $gettok($read(ProHLer.ChansOUT.txt,n,1),2,59)
    var %times = $gettok($read(ProHLer.ChansOUT.txt,n,1),3,59)
    did -ra ProHLer.DMain 35 $iif(%chan,%chan,None) $+ $chr(40) $+ $bytes($iif(%times,%times,0),bd) $+ $chr(41)
    did -ra ProHLer.DMain 41 $bytes($iif(%ProHLer.TotalNonHls isnum,%ProHLer.TotalNonHls,0),bd)
    did -h ProHLer.DMain 22
    did -h ProHLer.DMain 42
    did -h ProHLer.DMain 43
    did -ra ProHLer.DMain 43 $bytes($calc($iif(%ProHLer.TotalHls isnum,%ProHLer.TotalHls,0) / $iif(%ProHLer.Average.Day isnum,%ProHLer.Average.Day,0)),bd)
    did -ra ProHLer.DMain 55 Turn ProHLer $iif(%ProHLer.On,Off,On)
  }
}
alias ProHLer.DHLers.Reload {
  if ($dialog(ProHLer.DHLers)) {
    did -ra ProHLer.DHLers 31 None
    did -rm ProHLer.DHLers 33
    did -r ProHLer.DHLers 70
    did -r ProHLer.DHLers 71
    var %i = 1
    while (%i <= $numtok(%ProHLer.Highlights,59)) {
      did -a ProHLer.DHLers 70 %i
      did -a ProHLer.DHLers 71 $gettok(%ProHLer.Highlights,%i,59)
      inc %i
    }
  }
}
alias ProHLer.DNoHL.Reload {
  if ($dialog(ProHLer.DNoHL)) {
    did -ra ProHLer.DNoHL 31 None
    did -rm ProHLer.DNoHL 33
    did -r ProHLer.DNoHL 70
    did -r ProHLer.DNoHL 71
    var %i = 1
    while (%i <= $numtok(%ProHLer.NoHls,59)) {
      did -a ProHLer.DNoHL 70 %i
      did -a ProHLer.DNoHL 71 $gettok(%ProHLer.NoHls,%i,59)
      inc %i
    }
  }
}
alias ProHLer.DSettings.Reload {
  if ($dialog(ProHLer.DSettings)) {
    if (%ProHLer.ActionHighLight == $true) did -c ProHLer.DSettings 10
    if (%ProHLer.UpdateCheck.On == $true) did -c ProHLer.DSettings 11
    did -a ProHLer.DSettings 70 Default
    did -a ProHLer.DSettings 71 Default
    var %i = 0
    while (%i <= 15) {
      did -a ProHLer.DSettings 70 %i
      did -a ProHLer.DSettings 71 %i
      inc %i
    }
    if (%ProHLer.CustomColors.1) && (%ProHLer.CustomColors.1 != $false) did -c ProHLer.DSettings 70 $calc($v1 + 2)
    else did -c ProHLer.DSettings 70 1
    if (%ProHLer.CustomColors.2) && (%ProHLer.CustomColors.2 != $false) did -c ProHLer.DSettings 71 $calc($v1 + 2)
    else did -c ProHLer.DSettings 71 1
    if (%ProHLer.CustomColors.On == $true) {
      did -c ProHLer.DSettings 12
    }
    else {
      did -b ProHLer.DSettings 70
      did -b ProHLer.DSettings 71
    }
    if (%ProHLer.SpamProtect.On == $true) did -c ProHLer.DSettings 13
    if (%ProHLer.Sounds.OnHighLight.File) {
      did -ra ProHLer.DSettings 36 $nopath($v1)
      if (%ProHLer.Sounds.OnHighLight.On == $true) did -c ProHLer.DSettings 15
    }
    if (%ProHLer.Sounds.On == $true) did -c ProHLer.DSettings 14
    else {
      did -b ProHLer.DSettings 51
      did -b ProHLer.DSettings 15
    }
  }
}
alias ProHLer.DAdvancedSound.Reload {
  if ($dialog(ProHLer.DAdvancedSound)) {
    did -ra ProHLer.DAdvancedSound 31 None
    did -rm ProHLer.DAdvancedSound 33
    did -r ProHLer.DAdvancedSound 70
    did -r ProHLer.DAdvancedSound 71
    did -b ProHLer.DAdvancedSound 10
    hdel -w ProHLer.Tmp AdvancedSound.*
    var %i = 1
    while (%i <= $hfind(ProHler, $+(AdvancedSound.*), 0, w)) {
      var %key = $hfind(ProHler, $+(AdvancedSound.*), %i, w),%value = $hget(ProHLer, $+(AdvancedSound., %i))
      tokenize 59 %value
      did -a ProHLer.DAdvancedSound 70 $1
      did -a ProHLer.DAdvancedSound 71 $2
      hadd ProHLer.Tmp $+(AdvancedSound.,%i) %value
      inc %i
    }
  }
}
alias ProHLer.Nicks.Filter {
  write -c ProHLer.NicksIN.txt
  write -c ProHLer.NicksOUT.txt
  var %i = 1
  while (%i <= $var(%ProHLer.Nicks.*,0)) {
    write ProHLer.NicksIN.txt $var(%ProHLer.Nicks.*,%i) $+ $chr(59) $+ $remove($var(%ProHLer.Nicks.*,%i),%,ProHLer.Nicks.) $+ $chr(59) $+ $eval($var(%ProHLer.Nicks.*,%i),2)
    inc %i
  }
  filter -fk ProHLer.NicksIN.txt ProHLer.Nicks.FilterGet *
  write -c ProHLer.NicksIN.txt
}
alias ProHLer.Nicks.FilterGet {
  var %data $1-
  tokenize 59 %data
  var %high $gettok($read(ProHLer.NicksOUT.txt,n,1),3,59)
  var %high $iif(%high,%high,0)
  if ($3 > %high) {
    write -il1 ProHLer.NicksOUT.txt %data
  }
  else {
    write ProHLer.NicksOUT.txt %data
  }
}
alias ProHLer.Chans.Filter {
  write -c ProHLer.ChansIN.txt
  write -c ProHLer.ChansOUT.txt
  var %i = 1
  while (%i <= $var(%ProHLer.Chans.*,0)) {
    write ProHLer.ChansIN.txt $var(%ProHLer.Chans.*,%i) $+ $chr(59) $+ $remove($var(%ProHLer.Chans.*,%i),%,ProHLer.Chans.) $+ $chr(59) $+ $eval($var(%ProHLer.Chans.*,%i),2)
    inc %i
  }
  filter -fk ProHLer.ChansIN.txt ProHLer.Chans.FilterGet *
  write -c ProHLer.ChansIN.txt
}
alias ProHLer.Chans.FilterGet {
  var %data $1-
  tokenize 59 %data
  var %high $gettok($read(ProHLer.ChansOUT.txt,n,1),3,59)
  var %high $iif(%high,%high,0)
  if ($3 > %high) {
    write -il1 ProHLer.ChansOUT.txt %data
  }
  else {
    write ProHLer.ChansOUT.txt %data
  }
}
alias ProHler.NoHL {
  if ($1) {
    var %i = 1
    while (%i <= $numtok(%ProHLer.NoHls,59)) {
      if ($gettok(%ProHLer.NoHls,%i,59) iswm $1) return $gettok(%ProHLer.NoHls,%i,59)
      inc %i
    }
  }
  else return %ProHLer.NoHls
}
alias ProHLer.Off {
  set %ProHLer.On $false
  echo -at $ProHLer.C1(ProHLer is now turned off!)
}
alias ProHLer.On {
  set %ProHLer.On $true
  echo -at $ProHLer.C1(ProHLer is now turned on!)
}
on ^*:TEXT:*:*: {
  if (%ProHLer.On) {
    var %hltext $replace($1-,$chr(59),-)
    var %hlplace $iif($chan,$chan,$nick)
    var %i = 1
    while (%i <= $numtok(%ProHLer.Highlights,59)) {
      var %hler $eval($gettok(%ProHLer.Highlights,%i,59),2)
      if (%hler isin %hltext) {
        if ($ProHler.NoHL($nick)) {
          inc %ProHLer.TotalNonHls
        }
        else {
          if (%ProHLer.SpamProtect.On) {
            if ($hget(ProHLer.Tmp, $+(SpamProtect., $nick))) {
              hadd -z ProHLer.Tmp $+(SpamProtect., $nick) 5
              var %i = 1
              while (%i <= $cnick(0)) { 
                if ($cnick(%i) iswm $nick) { var %c $cnick(%i).color | break }
                elseif (($nick isop $chan) && (@ isin $cnick(%i).modes)) { var %c $cnick(%i).color | break }
                elseif (($nick ishop $chan) && (% isin $cnick(%i).modes)) { var %c $cnick(%i).color | break }
                elseif (($nick isvoice $chan) && (+ isin $cnick(%i).modes)) { var %c $cnick(%i).color | break }
                elseif (($nick isreg $chan) && ($cnick(%i).nomode) || (!$chan)) { var %c $cnick(%i).color | break }
                inc %i
              }
              if (!%c) var %c $color(text)
              if ($nick isop $chan) { var %cc @ }
              elseif ($nick ishop $chan) { var %cc % }
              elseif ($nick isvoice $chan) { var %cc + }
              echo -tmg $iif($chan,$chan,$nick) $+(<,%c,%cc,$nick,>) $ProHLer.C1($1-)  
              halt
            }
            hadd -z ProHLer.Tmp $+(SpamProtect., $nick) 5
          }
          inc %ProHLer.TotalHls
          inc %ProHLer.Nicks. $+ $nick
          set %ProHLer.Last.Nick $nick
          set %ProHLer.Last.Time $ctime
          if (%ProHLer.Date.Day != $date(dd-mm-yy)) {
            set %ProHLer.Date.Day $date(dd-mm-yy)
            inc %ProHLer.Average.Day
          }
          var %i = 1
          while (%i <= $cnick(0)) { 
            if ($cnick(%i) iswm $nick) { var %c $cnick(%i).color | break }
            elseif (($nick isop $chan) && (@ isin $cnick(%i).modes)) { var %c $cnick(%i).color | break }
            elseif (($nick ishop $chan) && (% isin $cnick(%i).modes)) { var %c $cnick(%i).color | break }
            elseif (($nick isvoice $chan) && (+ isin $cnick(%i).modes)) { var %c $cnick(%i).color | break }
            elseif (($nick isreg $chan) && ($cnick(%i).nomode) || (!$chan)) { var %c $cnick(%i).color | break }
            inc %i
          }
          if (!%c) var %c $color(text)
          if ($nick isop $chan) { var %cc @ }
          elseif ($nick ishop $chan) { var %cc % }
          elseif ($nick isvoice $chan) { var %cc + }
          echo -tmg $iif($chan,$chan,$nick) $+(<,%c,%cc,$nick,>) $ProHLer.C1 $+ $replace($strip(%hltext),%hler,$ProHLer.C2(%hler) $+ $ProHLer.C1) 
          if ($chan) inc %ProHLer.Chans. $+ $chan
          if ($window(@ProHLer. $+ $nick)) {
            rline $ProHLer.C2().code @ProHLer. $+ $nick 2 --- $+ $nick HighLighted you $bytes($eval($+(%,ProHLer.Nicks.,$nick),2),bd) time $+ $iif($eval($+(%,ProHLer.Nicks.,$nick),2) != 1,s) $+ !
            aline $ProHLer.C3().code @ProHLer. $+ $nick $ProHLer.C1(HL) $+ $chr(40) $+ $bytes($calc($line(@ProHLer. $+ $nick,0) - 1),bd) - %hlplace - $gmt(HH:nn:ss) $+ $chr(41) $+ $+(<,%c,%cc,$nick,>03) $+ : $ProHLer.C1 $+ $replace($strip(%hltext),%hler,$ProHLer.C4(%hler) $+ $ProHLer.C1)
          }
          else {
            window -k0l35n2vxz @ProHLer. $+ $nick
            aline -al @ProHLer. $+ $nick Add to NonHighlighting Nicknames
            aline -al @ProHLer. $+ $nick Open ProHLer
            aline -al @ProHLer. $+ $nick Close Window
            aline -al @ProHLer. $+ $nick Close all ProHLer Windows
            renwin @ProHLer. $+ $nick @ProHLer. $+ $nick HighLight info( $+ $nick $+ )
            aline $ProHLer.C1().code @ProHLer. $+ $nick <***>ProHLer HighLight detection script by: Marlinc - Version $ProHLer.Version $+ <***>
            aline $ProHLer.C2().code @ProHLer. $+ $nick --- $+ $nick HighLighted you $bytes($eval($+(%,ProHLer.Nicks.,$nick),2),bd) time $+ $iif($eval($+(%,ProHLer.Nicks.,$nick),2) != 1,s) $+ !
            aline $ProHLer.C3().code @ProHLer. $+ $nick $ProHLer.C3(HL) $+ $chr(40) $+ 1 - %hlplace - $gmt(HH:nn:ss) $+ $chr(41) $+ $+(<,%c,%cc,$nick,> $+ $ProHLer.C2) $+ : $ProHLer.C1 $+ $replace($strip(%hltext),%hler,$ProHLer.C4(%hler) $+ $ProHLer.C1)
          }
          ProHLer.DMain.Reload
          noop $tip(ProHLer. $+ $nick $+ . $+ $ticks,$ProHLer.C1(Pro) $+ $ProHLer.C2(HL) $+ $ProHLer.C1(er) $+ :,$ProHLer.C2($nick) $ProHLer.C1(HighLighted you!) $crlf $ProHLer.C1(Network:) $ProHLer.C2($network) $iif($chan,$crlf $ProHLer.C1(Channel:) $ProHLer.C2($chan)) $crlf $ProHLer.C1(Text:) $ProHLer.C2($replace($strip(%hltext),%hler,$ProHLer.C1(%hler) $+ $ProHLer.C2),10)))
          flash -b5 ProHLer: $nick HighLighted you!
          if ((%ProHLer.Sounds.OnHighLight.File) && (%ProHLer.Sounds.OnHighLight.On == $true)) splay $qt(%ProHLer.Sounds.OnHighLight.File)
          window -g2 %hlplace
          haltdef
          break
        }
      }
      inc %i
    }
  }
}
on ^*:ACTION:*:*: {
  if ((%ProHLer.On) && (%ProHLer.ActionHighLight)) {
    var %hltext $replace($1-,$chr(59),-)
    var %hlplace $iif($chan,$chan,$nick)
    var %i = 1
    while (%i <= $numtok(%ProHLer.Highlights,59)) {
      var %hler $eval($gettok(%ProHLer.Highlights,%i,59),2)
      if (%hler isin %hltext) {
        if ($ProHler.NoHL($nick)) {
          inc %ProHLer.TotalNonHls
        }
        else {
          inc %ProHLer.TotalHls
          inc %ProHLer.Nicks. $+ $nick
          set %ProHLer.Last.Nick $nick
          set %ProHLer.Last.Time $ctime
          if (%ProHLer.Date.Day != $date(dd-mm-yy)) {
            set %ProHLer.Date.Day $date(dd-mm-yy)
            inc %ProHLer.Average.Day
          }
          var %i = 1
          while (%i <= $cnick(0)) { 
            if ($cnick(%i) iswm $nick) { var %c $cnick(%i).color | break }
            elseif (($nick isop $chan) && (@ isin $cnick(%i).modes)) { var %c $cnick(%i).color | break }
            elseif (($nick ishop $chan) && (% isin $cnick(%i).modes)) { var %c $cnick(%i).color | break }
            elseif (($nick isvoice $chan) && (+ isin $cnick(%i).modes)) { var %c $cnick(%i).color | break }
            elseif (($nick isreg $chan) && ($cnick(%i).nomode) || (!$chan)) { var %c $cnick(%i).color | break }
            inc %i
          }
          if (!%c) var %c $color(text)
          if ($nick isop $chan) { var %cc @ }
          elseif ($nick ishop $chan) { var %cc % }
          elseif ($nick isvoice $chan) { var %cc + }
          echo -tmg $iif($chan,$chan,$nick) $+(06* %cc,$nick,) $ProHLer.C1 $+ $replace($strip(%hltext),%hler,$ProHLer.C2(%hler) $+ $ProHLer.C1) 
          if ($chan) inc %ProHLer.Chans. $+ $chan
          if ($window(@ProHLer. $+ $nick)) {
            rline $ProHLer.C2().code @ProHLer. $+ $nick 2 --- $+ $nick HighLighted you $bytes($eval($+(%,ProHLer.Nicks.,$nick),2),bd) time $+ $iif($eval($+(%,ProHLer.Nicks.,$nick),2) != 1,s) $+ !
            aline $ProHLer.C3().code @ProHLer. $+ $nick $ProHLer.C1(HL) $+ $chr(40) $+ $bytes($calc($line(@ProHLer. $+ $nick,0) - 1),bd) - %hlplace - $gmt(HH:nn:ss) $+ $chr(41) $+ $+(06* %cc,$nick,) $+ : $ProHLer.C1 $+ $replace($strip(%hltext),%hler,$ProHLer.C4(%hler) $+ $ProHLer.C1)
          }
          else {
            window -k0l35n2vxz @ProHLer. $+ $nick
            aline -al @ProHLer. $+ $nick Add to NonHighlighting Nicknames
            aline -al @ProHLer. $+ $nick Open ProHLer
            aline -al @ProHLer. $+ $nick Close Window
            aline -al @ProHLer. $+ $nick Close all ProHLer Windows
            renwin @ProHLer. $+ $nick @ProHLer. $+ $nick HighLight info( $+ $nick $+ )
            aline $ProHLer.C1().code @ProHLer. $+ $nick <***>ProHLer HighLight detection script by: Marlinc - Version $ProHLer.Version $+ <***>
            aline $ProHLer.C2().code @ProHLer. $+ $nick --- $+ $nick HighLighted you $bytes($eval($+(%,ProHLer.Nicks.,$nick),2),bd) time $+ $iif($eval($+(%,ProHLer.Nicks.,$nick),2) != 1,s) $+ !
            aline $ProHLer.C3().code @ProHLer. $+ $nick $ProHLer.C3(HL) $+ $chr(40) $+ 1 - %hlplace - $gmt(HH:nn:ss) $+ $chr(41) $+ $+(06* %cc,$nick,> $+ $ProHLer.C2) $+ : $ProHLer.C1 $+ $replace($strip(%hltext),%hler,$ProHLer.C4(%hler) $+ $ProHLer.C1)
          }
          ProHLer.DMain.Reload
          noop $tip(ProHLer. $+ $nick $+ . $+ $ticks,$ProHLer.C1(Pro) $+ $ProHLer.C2(HL) $+ $ProHLer.C1(er) $+ :,$ProHLer.C2($nick) $ProHLer.C1(HighLighted you!) $crlf $ProHLer.C1(Network:) $ProHLer.C2($network) $iif($chan,$crlf $ProHLer.C1(Channel:) $ProHLer.C2($chan)) $crlf $ProHLer.C1(Text:) $ProHLer.C2($replace($strip(%hltext),%hler,$ProHLer.C1(%hler) $+ $ProHLer.C2),10)))
          flash -b5 ProHLer: $nick HighLighted you!
          window -g2 %hlplace
          haltdef
          break
        }
      }
      inc %i
    }
  }
}
dialog -l ProHLer.DMain {

  ;ID Info:
  ;Boxes 20-30
  ;Lables(Text) 30-50
  ;Buttons 50-70

  title      "ProHLer - Main(Loading...)"
  size       -1 -1 320 100
  option     dbu

  box        "Status"                 , 20, 5 5 150 75
  box        "Settings"               , 21, 155 5 150 85
  box        "Status"                 , 22, 5 5 150 85
  text       "Total HighLights:"      , 30, 10 15 75 10
  text       "Loading..."             , 31, 80 15 70 10
  text       "Most Highlights(Nick):" , 32, 10 25 75 10
  text       "Loading..."             , 33, 80 25 70 10
  text       "Most Highlights(Chan):" , 34, 10 35 75 10
  text       "Loading..."             , 35, 80 35 70 10
  text       "Different nicks:"       , 36, 10 45 75 10
  text       "Loading..."             , 37, 80 45 70 10
  text       "Different channels:"    , 38, 10 55 75 10
  text       "Loading..."             , 39, 80 55 70 10
  text       "Ignored HighLights:"    , 40, 10 65 75 10
  text       "Loading..."             , 41, 80 65 70 10
  text       "Average per day:"       , 42, 10 75 75 10
  text       "Loading..."             , 43, 80 75 70 10
  button     "Close ProHLer Windows"  , 50, 160 25 80 10
  button     "Reset Data!"            , 51, 160 35 80 10
  button     "HighLighters!"          , 52, 160 45 80 10
  button     "NonHighLighting nicknames!" , 53, 160 55 80 10
  button     "Show extra stats"        , 54, 160 65 80 10
  button     "Turn ProHLer ..."        , 55, 160 15 80 10
  button     "Settings"                , 56, 160 75 80 10
}
on *:dialog:ProHLer.DMain:init:0: {
  dialog -t $dname ProHLer(Version $ProHLer.Version $+ ) - Main

  ProHLer.DMain.Reload
}
on *:dialog:ProHLer.DMain:sclick:50: {
  dialog -n $dname
  if ($window(@ProHLer.SettingsCheck)) window -c @ProHLer.SettingsCheck
  if ($input(Are you sure you want to close all the ProHLer windows?,yqd,ProHLer - Question)) {
    var %total $window(@ProHLer.*,0)
    close -@ProHLer.*
    dialog -x $dname
    if ($dialog(ProHLer.DNoHL)) dialog -x $v1
    if ($dialog(ProHLer.DHLers)) dialog -x $v1
    if ($dialog(ProHLer.DResetStats)) dialog -x $v1
    if ($dialog(ProHLer.DSettings)) dialog -x $v1
    noop $input(All ProHLer windows are closed! Total: %total,oid,ProHLer - Info)
  }
}
on *:dialog:ProHLer.DMain:sclick:51: {
  if ($window(@ProHLer.SettingsCheck)) window -c @ProHLer.SettingsCheck
  dialog -mordv ProHLer.DResetStats ProHLer.DResetStats
}
on *:dialog:ProHLer.DMain:sclick:52: {
  if ($window(@ProHLer.SettingsCheck)) window -c @ProHLer.SettingsCheck
  dialog -mordv ProHLer.DHLers ProHLer.DHLers 
}
on *:dialog:ProHLer.DMain:sclick:53: {
  if ($window(@ProHLer.SettingsCheck)) window -c @ProHLer.SettingsCheck
  dialog -mordv ProHLer.DNoHL ProHLer.DNoHL 
}
on *:dialog:ProHLer.DMain:sclick:54: {
  if ($did(20).visible) {
    did -h $dname 20
    did -v $dname 22
    did -v ProHLer.DMain 42
    did -v ProHLer.DMain 43
    did -ra $dname $did Hide extra stats
  }
  else {
    did -v $dname 20
    did -h $dname 22
    did -h ProHLer.DMain 42
    did -h ProHLer.DMain 43
    did -ra $dname $did Show extra stats
  }
}
on *:dialog:ProHLer.DMain:sclick:55: {
  if (%ProHLer.On) {
    ProHLer.Off
    did -ra ProHLer.DMain 55 Turn ProHLer On
  }
  else {
    ProHLer.On
    did -ra ProHLer.DMain 55 Turn ProHLer Off
  }
}
on *:dialog:ProHLer.DMain:sclick:56: {
  if ($window(@ProHLer.SettingsCheck)) window -c @ProHLer.SettingsCheck
  dialog -mordv ProHLer.DSettings ProHLer.DSettings
}
on *:dialog:ProHLer.DMain:close:0: {
  if ($window(@ProHLer.SettingsCheck)) window -c @ProHLer.SettingsCheck
}
dialog -l ProHLer.DHLers {

  ;ID Info:
  ;Boxes 20-30
  ;Lables(Text&Edit) 30-50
  ;Buttons 50-70
  ;Lists 70-80

  title      "ProHLer - HighLighters(Loading...)"
  size       -1 -1 270 170
  option     dbu

  box        "HighLighter Editor"     , 20, 5 5 250 60
  box        "HighLighters"           , 21, 5 65 250 85
  text       "Nr:"                    , 30, 10 15 50 10
  text       "Loading..."             , 31, 80 15 50 10
  text       "Edit:"                  , 32, 10 25 50 10
  edit       "Loading..."             , 33, 77 25 150 10
  text       "Things like $me or $mnick are allowd!" , 34, 10 37 100 20
  list                                  70, 10 75 10 60
  list                                  71, 77 75 150 60
  button     "Delete Selected"        , 50, 10 135 80 10
  button     "Add one"                , 51, 90 135 80 10
  button     "Save"                   , 52, 10 45 80 10
  button     "Save all / Exit"        , 53, 5 155 80 10
}
on *:dialog:ProHLer.DHLers:init:0: {
  if ($dialog(ProHLer.DMain)) dialog -n ProHLer.DMain
  ProHLer.DHLers.Reload
  dialog -t $dname ProHLer(Version $ProHLer.Version $+ ) - HighLighters
}
on *:dialog:ProHLer.DHLers:sclick:50: {
  dialog -n $dname
  if ($did(71).sel) {
    var %nr $did(71).sel
    var %text $did(71).seltext
    if ($input(Are you sure you want to delete the folowing HighLighter: $+ $crlf $+ Nr: %nr $+ $crlf $+ Text: %text,yqd,ProHLer - Question)) {
      did -d $dname 70 %nr
      did -d $dname 71 %nr
      var %i = 1
      while (%i <= $did(70).lines) {
        did -o $dname 70 %i %i
        inc %i
      }
      did -ra $dname 31 None
      did -rma $dname 33
    }
  }
  else {
    noop $input(There is no HighLighter selected!,oid,ProHLer - Info)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DHLers:sclick:51: {
  dialog -n $dname
  var %nr $calc($did(70).lines + 1)
  if (%nr <= 30) {
    did -a $dname 70 %nr
    did -a $dname 71 New HighLighter: %nr
    did -c $dname 70 %nr
    did -c $dname 71 %nr

    did -ra $dname 31 $did(70).sel
    did -ra $dname 33 $did(71).seltext
    did -fn $dname 33
  }
  else {
    noop $input(Sorry we only accept 30 HighLighters!,oid,ProHLer - Info)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DHLers:sclick:52: {
  dialog -n $dname
  if ($did(71).sel) {
    var %nr $did(31).text
    var %text $did(33).text
    did -o $dname 70 %nr %nr
    did -o $dname 71 %nr %text
    did -c $dname 70 %nr
    did -c $dname 71 %nr
  }
  else {
    noop $input(There is no HighLighter selected!,oid,ProHLer - Info)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DHLers:sclick:53: {
  dialog -n $dname
  set %ProHLer.Highlights $didtok($dname,71,59)
  noop $input(Your HighLighters are saved!,oid,ProHLer - Info)
  dialog -x $dname
  if ($dialog(ProHLer.DMain)) dialog -o ProHLer.DMain
}
on *:dialog:ProHLer.DHLers:sclick:70: {
  did -ra $dname 31 $did($did).sel
  did -ran $dname 33 $did(71,$did($did).sel).text
  did -c $dname 71 $did($did).sel
}
on *:dialog:ProHLer.DHLers:sclick:71: {
  did -ra $dname 31 $did($did).sel
  did -ran $dname 33 $did($did).seltext
  did -c $dname 70 $did($did).sel
}
on *:dialog:ProHLer.DHLers:close:0: {
  if ($didtok($dname,71,59) != %ProHLer.Highlights) {
    if ($input(You made some changes! Do you want to save them?,yqd,ProHLer - Question)) {
      set %ProHLer.Highlights $didtok($dname,71,59)
      noop $input(Your HighLighters are saved!,oid,ProHLer - Info)
    }
  }
  if ($dialog(ProHLer.DMain)) dialog -o ProHLer.DMain
}
dialog -l ProHLer.DNoHL {

  ;ID Info:
  ;Boxes 20-30
  ;Lables(Text&Edit) 30-50
  ;Buttons 50-70
  ;Lists 70-80

  title      "ProHLer - NonHighLighting nicknames(Loading...)"
  size       -1 -1 300 170
  option     dbu

  box        "Nickname Editor"     , 20, 5 5 250 60
  box        "Nicknames"           , 21, 5 65 250 85
  text       "Nr:"                    , 30, 10 15 50 10
  text       "Loading..."             , 31, 80 15 50 10
  text       "Edit:"                  , 32, 10 25 50 10
  edit       "Loading..."             , 33, 77 25 150 10
  text       "Wildcards(*) are allowed at nicknames!" , 34, 10 37 100 20
  list                                  70, 10 75 10 60
  list                                  71, 77 75 150 60
  button     "Delete Selected"        , 50, 10 135 80 10
  button     "Add one"                , 51, 90 135 80 10
  button     "Save"                   , 52, 10 45 80 10
  button     "Save all / Exit"        , 53, 5 155 80 10
}
on *:dialog:ProHLer.DNoHL:init:0: {
  if ($dialog(ProHLer.DMain)) dialog -n ProHLer.DMain
  ProHLer.DNoHL.Reload
  dialog -t $dname ProHLer(Version $ProHLer.Version $+ ) - NonHighLight nicknames
  if (%proHler.DNoHL.nick) {
    dialog -n $dname
    if (!$didwm($dname,71,%proHler.DNoHL.nick)) {
      var %nr $calc($did(70).lines + 1)
      if (%nr <= 40) {
        did -a $dname 70 %nr
        did -a $dname 71 %proHler.DNoHL.nick
        did -c $dname 70 %nr
        did -c $dname 71 %nr

        did -ra $dname 31 $did(70).sel
        did -ranf $dname 33 $did(71).seltext
      }
      else {
        noop $input(Sorry we only accept 40 nicknames!,oid,ProHLer - Info)
      }
    }
    else {
      noop $input(The nickname " $+ %proHler.DNoHL.nick $+ " is already at your NonHighLighting nickname list! $+ $crlf $+ At nr: $didwm($dname,71,%proHler.DNoHL.nick),oid,ProHLer - Info)
      dialog -x $dname
    }
    dialog -o $dname
    unset %proHler.DNoHL.nick
  }
}
on *:dialog:ProHLer.DNoHL:sclick:50: {
  dialog -n $dname
  if ($did(71).sel) {
    var %nr $did(71).sel
    var %text $did(71).seltext
    if ($input(Are you sure you want to delete the folowing nickname: $+ $crlf $+ Nr: %nr $+ $crlf $+ Text: %text,yqd,ProHLer - Question)) {
      did -d $dname 70 %nr
      did -d $dname 71 %nr
      var %i = 1
      while (%i <= $did(70).lines) {
        did -o $dname 70 %i %i
        inc %i
      }
      did -ra $dname 31 None
      did -ram $dname 33
    }
  }
  else {
    noop $input(There is no nickname selected!,oid,ProHLer - Info)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DNoHL:sclick:51: {
  dialog -n $dname
  var %nr $calc($did(70).lines + 1)
  if (%nr <= 40) {
    did -a $dname 70 %nr
    did -a $dname 71 Nickname %nr
    did -c $dname 70 %nr
    did -c $dname 71 %nr

    did -ra $dname 31 $did(70).sel
    did -rafn $dname 33 $did(71).seltext
  }
  else {
    noop $input(Sorry we only accept 40 nicknames!,oid,ProHLer - Info)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DNoHL:sclick:52: {
  dialog -n $dname
  if ($did(71).sel) {
    var %nr $did(31).text
    var %text $did(33).text
    did -o $dname 70 %nr %nr
    did -o $dname 71 %nr %text
    did -c $dname 70 %nr
    did -c $dname 71 %nr
  }
  else {
    noop $input(There is no nickname selected!,oid,ProHLer - Info)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DNoHL:sclick:53: {
  dialog -n $dname
  set %ProHLer.NoHls $didtok($dname,71,59)
  var %i = 1
  while (%i <= $numtok(%ProHLer.NoHls,59)) {
    if ($window(@ProHLer. $+ $gettok(%ProHLer.NoHls,%i,59))) window -c @ProHLer. $+ $gettok(%ProHLer.NoHls,%i,59))
    inc %i
  }
  noop $input(Your non highlighting nicknames are saved!,oid,ProHLer - Info)
  dialog -x $dname
  if ($dialog(ProHLer.DMain)) dialog -o ProHLer.DMain
}
on *:dialog:ProHLer.DNoHL:sclick:70: {
  did -ra $dname 31 $did($did).sel
  did -ran $dname 33 $did(71,$did($did).sel).text
  did -c $dname 71 $did($did).sel
}
on *:dialog:ProHLer.DNoHL:sclick:71: {
  did -ra $dname 31 $did($did).sel
  did -ran $dname 33 $did($did).seltext
  did -c $dname 70 $did($did).sel
}
on *:dialog:ProHLer.DNoHL:close:0: {
  if ($didtok($dname,71,59) != %ProHLer.NoHls) {
    if ($input(You made some changes! Do you want to save them?,yqd,ProHLer - Question)) {
      set %ProHLer.NoHls $didtok($dname,71,59)
      noop $input(Your non highlighting nicknames are saved!,oid,ProHLer - Info)
    }
  }
  if ($dialog(ProHLer.DMain)) dialog -o ProHLer.DMain
}
dialog -l ProHLer.DResetStats {

  ;ID Info:
  ;Boxes 20-30
  ;Lables(Text&Edit) 30-50
  ;Buttons 50-70
  ;Lists 70-80

  title      "ProHLer - Reseting(Loading...)"
  size       -1 -1 120 90
  option     dbu

  box        "Reset"     , 20, 5 5 90 60
  button     "Reset Stats(nicknames)" , 50, 10 15 80 10
  button     "Reset Stats(Channels)"  , 51, 10 25 80 10
  button     "Reset All ignored HighLights" , 52, 10 35 80 10
  button     "Reset All HighLight stats" , 53, 10 45 80 10
  button     "Exit"                   , 54, 5 70 80 10
}
on *:dialog:ProHLer.DResetStats:init:0: {
  if ($dialog(ProHLer.DMain)) dialog -n ProHLer.DMain
  dialog -t $dname ProHLer(Version $ProHLer.Version $+ ) - Reseting
}
on *:dialog:ProHLer.DResetStats:sclick:50: {
  dialog -n $dname
  if ($input(Are you sure you want to reset the nickname HighLight stats?,yqd,ProHLer - Question)) {
    var %total $bytes($iif(%ProHLer.TotalHls isnum,$var(%ProHLer.Nicks.*,0),0),bd)
    unset %ProHLer.Nicks.*
    noop $input(All Nickname HighLight stats are reseted! Total: %total,oid,ProHLer - Info)
    ProHLer.DMain.Reload
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DResetStats:sclick:51: {
  dialog -n $dname
  if ($input(Are you sure you want to reset the Channel HighLight stats?,yqd,ProHLer - Question)) {
    var %total $bytes($iif(%ProHLer.TotalHls isnum,$var(%ProHLer.Chans.*,0),0),bd)
    unset %ProHLer.Chans.*
    noop $input(All Channel HighLight stats are reseted! Total: %total,oid,ProHLer - Info)
    ProHLer.DMain.Reload
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DResetStats:sclick:52: {
  dialog -n $dname
  if ($input(Are you sure you want to reset the ignored HighLight stats?,yqd,ProHLer - Question)) {
    unset %ProHLer.TotalNonHls
    noop $input(Your ignored HighLight stats are reseted!,oid,ProHLer - Info)
    ProHLer.DMain.Reload
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DResetStats:sclick:53: {
  dialog -n $dname
  if ($input(Are you sure you want to reset the all HighLight stats?,yqd,ProHLer - Question)) {
    var %total $bytes($iif(%ProHLer.TotalHls isnum,$var(%ProHLer.Nicks.*,0),0),bd)
    var %totalc $bytes($iif(%ProHLer.TotalHls isnum,$var(%ProHLer.Chans.*,0),0),bd)
    var %totaltot $iif(%ProHLer.TotalHls isnum,%ProHLer.TotalHls,0)
    var %totaligtot $iif(%ProHLer.TotalNonHls isnum,%ProHLer.TotalNonHls,0)
    unset %ProHLer.Nicks.*
    unset %ProHLer.Chans.*
    unset %ProHLer.TotalHls
    unset %ProHLer.TotalNonHls
    unset %ProHLer.Date.Day
    unset %ProHLer.Average.Day
    unset %ProHLer.Last.Nick
    unset %ProHLer.Last.Time
    noop $input(All HighLight stats are reseted! Total(Nicknames): %total $crlf Total(Channels): %totalc $crlf Total(All HighLights): %totaltot $crlf Total(All Ignored HighLights): %totaligtot,oid,ProHLer - Info)
    ProHLer.DMain.Reload
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DResetStats:sclick:54: {
  dialog -x $dname
  ProHLer.DMain.Reload
  if ($dialog(ProHLer.DMain)) dialog -o ProHLer.DMain
}
on *:dialog:ProHLer.DResetStats:close:0: {
  ProHLer.DMain.Reload
  if ($dialog(ProHLer.DMain)) dialog -o ProHLer.DMain
}
dialog -l ProHLer.DSettings {

  ;ID Info:
  ;Boxes 20-30
  ;Lables(Text&Edit) 30-50
  ;Buttons 50-70
  ;Lists 70-80

  title      "ProHLer - Settings(Loading...)"
  size       -1 -1 220 145
  option     dbu

  box        "Options"                         , 20, 5 5 100 60
  box        "Color Options"                   , 21, 105 5 100 60
  box        "Sound Options"                   , 22, 5 65 200 60
  check      "Enable UpdateCheck"              , 11, 10 15 80 10
  check      "Enable HighLight on ACTION(/me)" , 10, 10 25 100 10
  check      "Enable Spamprotect"              , 13, 10 35 100 10
  check      "Enable custom colors"            , 12, 110 15 100 10
  check      "Enable sounds"                   , 14, 10 75 100 10
  text       "Sound on HighLight:"             , 34, 10 85 50 10
  button     "Select"                          , 51, 70 85 30 10
  check      "Enable"                          , 15, 105 85 100 10
  text       "File:"                           , 35, 10 95 50 10
  text       "..."                             , 36, 70 95 150 10
  button     "Advanced sound settings"         , 52, 10 110 100 10
  text       "ProHLer Color 1:"                , 32, 110 25 50 10
  combo                                          70, 160 25 30 10, drop
  text       "ProHLer Color 2:"                , 33, 110 35 50 10
  combo                                          71, 160 35 30 10, drop
  button     "Save all / Exit"                 , 50, 5 130 80 10
}
on *:dialog:ProHLer.DSettings:init:0: {
  if ($dialog(ProHLer.DMain)) dialog -n ProHLer.DMain
  ProHLer.DSettings.Reload
  dialog -t $dname ProHLer(Version $ProHLer.Version $+ ) - Settings
}
on *:dialog:ProHLer.DSettings:sclick:11: {
  dialog -n $dname
  if (%ProHLer.UpdateCheck.On) {
    set %ProHLer.UpdateCheck.On $false
    did -u ProHLer.DSettings 11
    noop $input(ProHLer will nolonger check for a new version if you open the main window,oid,ProHLer - Info)
  }
  else {
    set %ProHLer.UpdateCheck.On $true
    did -c ProHLer.DSettings 11
    noop $input(ProHLer will now check for a new version everytime you open the main window,oid,ProHLer - Info)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DSettings:sclick:10: {
  dialog -n $dname
  if (%ProHLer.ActionHighLight) {
    set %ProHLer.ActionHighLight $false
    did -u ProHLer.DSettings 10
    noop $input(You will nolonger get HighLighted on ACTION,oid,ProHLer - Info)
  }
  else {
    set %ProHLer.ActionHighLight $true
    did -c ProHLer.DSettings 10
    noop $input(You will now get HighLighted on ACTION,oid,ProHLer - Info)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DSettings:sclick:12: {
  dialog -n $dname
  if (%ProHLer.CustomColors.On) {
    set %ProHLer.CustomColors.On $false
    did -u ProHLer.DSettings 12
    did -b ProHLer.DSettings 70
    did -b ProHLer.DSettings 71
    noop $input(Your custom ProHLer colors are now disabled,oid,ProHLer - Info)
  }
  else {
    set %ProHLer.CustomColors.On $true
    did -c ProHLer.DSettings 12
    did -e ProHLer.DSettings 70
    did -e ProHLer.DSettings 71
    noop $input(Your custom ProHLer colors are now enabled,oid,ProHLer - Info)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DSettings:sclick:13: {
  dialog -n $dname
  if (%ProHLer.SpamProtect.On) {
    set %ProHLer.SpamProtect.On $false
    did -u ProHLer.DSettings 13
    noop $input(ProHLer spam protect is now disabled,oid,ProHLer - Info)
  }
  else {
    set %ProHLer.SpamProtect.On $true
    did -c ProHLer.DSettings 13
    noop $input(ProHLer spam protect is now enabled,oid,ProHLer - Info)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DSettings:sclick:15: {
  dialog -n $dname
  if (%ProHLer.Sounds.OnHighLight.On) {
    set %ProHLer.Sounds.OnHighLight.On $false
    noop $input(This sound is disables,oid,ProHLer - Info)
  }
  else {
    set %ProHLer.Sounds.OnHighLight.On $true
    noop $input(This sound is enabled,oid,ProHLer - Info)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DSettings:sclick:14: {
  dialog -n $dname
  if (%ProHLer.Sounds.On) {
    set %ProHLer.Sounds.On $false
    did -u ProHLer.DSettings 14
    did -b ProHLer.DSettings 51
    did -b ProHLer.DSettings 15
    noop $input(The sounds are disabled,oid,ProHLer - Info)
  }
  else {
    set %ProHLer.Sounds.On $true
    did -c ProHLer.DSettings 14
    did -e ProHLer.DSettings 51
    did -e ProHLer.DSettings 15
    noop $input(The sounds are enabled,oid,ProHLer - Info)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DSettings:sclick:14: {
  dialog -n $dname
  if (%ProHLer.Sounds.On) {
    set %ProHLer.Sounds.On $false
    did -u ProHLer.DSettings 14
    did -b ProHLer.DSettings 51
    did -b ProHLer.DSettings 15
    noop $input(The sounds are disabled,oid,ProHLer - Info)
  }
  else {
    set %ProHLer.Sounds.On $true
    did -c ProHLer.DSettings 14
    did -e ProHLer.DSettings 51
    did -e ProHLer.DSettings 15
    noop $input(The sounds are enabled,oid,ProHLer - Info)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DSettings:sclick:51: {
  dialog -n $dname
  if ($sfile($mircdir, Select a sound`, Select)) {
    set %ProHLer.Sounds.OnHighLight.File $v1
    did -ra ProHLer.DSettings 36 $nopath($v1)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DSettings:sclick:50: {
  dialog -n $dname
  if (%ProHLer.CustomColors.On) {
    if ($did($dname, 70).sel == 1) set %ProHLer.CustomColors.1 $false
    else set %ProHLer.CustomColors.1 $calc($did($dname, 70).sel - 2)
    if ($did($dname, 71).sel == 1) set %ProHLer.CustomColors.2 $false
    else set %ProHLer.CustomColors.2 $calc($did($dname, 71).sel - 2)
  }
  dialog -x $dname
  ProHLer.DMain.Reload
  if ($dialog(ProHLer.DMain)) dialog -o ProHLer.DMain
}
on *:dialog:ProHLer.DSettings:sclick:52: {
  dialog -mordv ProHLer.DAdvancedSound ProHLer.DAdvancedSound 
}
on *:dialog:ProHLer.DSettings:close:0: {
  ProHLer.DMain.Reload
  if ($dialog(ProHLer.DMain)) dialog -o ProHLer.DMain
}
dialog -l ProHLer.DAdvancedSound {

  ;ID Info:
  ;Boxes 20-30
  ;Lables(Text&Edit) 30-50
  ;Buttons 50-70
  ;Lists 70-80

  title      "ProHLer - Advanced Sound(Loading...)"
  size       -1 -1 300 200
  option     dbu

  box        "Nickname Editor"        , 20, 5 5 250 90
  box        "Nicknames "             , 21, 5 95 250 85
  text       "Nr:"                    , 30, 10 15 50 10
  text       "Loading..."             , 31, 80 15 50 10
  text       "Edit:"                  , 32, 10 25 50 10
  text       "File:"                  , 36, 10 45 50 10
  text       "Select file:"           , 37, 10 35 50 10
  edit       "Loading..."             , 33, 77 25 150 10
  text       "None"                   , 35, 77 45 150 10
  check      "Enable"                 , 10, 77 55 100 10
  text       "Wildcards(*) are allowed at nicknames and hosts" , 34, 10 67 120 20
  list                                  70, 10 105 10 60
  list                                  71, 77 105 150 60
  button     "Select"                 , 54, 77 35 30 10
  button     "Delete Selected"        , 50, 10 165 80 10
  button     "Add one"                , 51, 90 165 80 10
  button     "Save"                   , 52, 10 75 80 10
  button     "Save all / Exit"        , 53, 5 185 80 10
}
on *:dialog:ProHLer.DAdvancedSound:init:0: {
  if ($dialog(ProHLer.DSettings)) dialog -n ProHLer.DSettings
  ProHLer.DAdvancedSound.Reload
  dialog -t $dname ProHLer(Version $ProHLer.Version $+ ) - Advanced Sound
}
on *:dialog:ProHLer.DAdvancedSound:sclick:50: {
  dialog -n $dname
  if ($did(71).sel) {
    var %nr $did(71).sel
    var %text $did(71).seltext
    if ($input(Are you sure you want to delete the folowing nickname: $+ $crlf $+ Nr: %nr $+ $crlf $+ Text: %text,yqd,ProHLer - Question)) {
      did -d $dname 70 %nr
      did -d $dname 71 %nr
      var %i = 1
      while (%i <= $did(70).lines) {
        did -o $dname 70 %i %i
        inc %i
      }
      did -ra $dname 31 None
      did -ra $dname 35 None
      did -u $dname 10
      did -ram $dname 33
      hdel ProHLer.Tmp $+(AdvancedSound., %nr)
    }
  }
  else {
    noop $input(There is no nickname selected!,oid,ProHLer - Info)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DAdvancedSound:sclick:51: {
  dialog -n $dname
  var %nr $calc($did(70).lines + 1)
  if (%nr <= 40) {
    did -a $dname 70 %nr
    did -a $dname 71 Nickname %nr
    did -c $dname 70 %nr
    did -c $dname 71 %nr
    did -u $dname 10
    did -ra $dname 35 None

    did -ra $dname 31 $did(70).sel
    did -rafn $dname 33 $did(71).seltext
    hadd ProHLer.Tmp $+(AdvancedSound., %nr) $+(%nr, $chr(59), Nickname %nr, $chr(59), -, $chr(59), $false)
  }
  else {
    noop $input(Sorry we only accept 40 nicknames!,oid,ProHLer - Info)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DAdvancedSound:sclick:52: {
  dialog -n $dname
  if ($did(71).sel) {
    var %nr $did(31).text
    var %text $did(33).text
    var %text2 $did(35).text
    var %state $iif($did($dname, 10).state == 1, $true, $false)
    tokenize 59 $hget(ProHLer.Tmp, $+(AdvancedSound., %nr))
    did -o $dname 70 %nr %nr
    did -o $dname 71 %nr %text
    did -c $dname 70 %nr
    did -c $dname 71 %nr
    hadd ProHLer.Tmp $+(AdvancedSound., %nr) $+(%nr, $chr(59), %text, $chr(59), %text2, $chr(59), %state)
  }
  else {
    noop $input(There is no nickname selected!,oid,ProHLer - Info)
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DAdvancedSound:sclick:53: {
  dialog -n $dname
  hdel -w ProHLer AdvancedSound.*
  var %i = 1
  while (%i <= $hfind(ProHler.Tmp, AdvancedSound.*, 0, w)) {
    var %key = $hfind(ProHler.Tmp, AdvancedSound.*, %i, w), %value = $hget(ProHLer.Tmp, %key)
    hadd ProHLer %key %value
    inc %i
  }
  noop $input(Your advanced sound settings are saved!,oid,ProHLer - Info)
  hdel -w ProHLer.Tmp AdvancedSound.*
  dialog -x $dname
  if ($dialog(ProHLer.DSettings)) dialog -o ProHLer.DSettings
}
on *:dialog:ProHLer.DAdvancedSound:sclick:70: {
  tokenize 59 $hget(ProHLer.Tmp, $+(AdvancedSound., $did($did).sel))
  did -ra $dname 31 $did($did).sel
  did -ran $dname 33 $did(71,$did($did).sel).text
  did -ran $dname 35 $3
  if ($4 == $true) did -c $dname 10
  else did -u $dname 10
  did -c $dname 71 $did($did).sel
}
on *:dialog:ProHLer.DAdvancedSound:sclick:71: {
  tokenize 59 $hget(ProHLer.Tmp, $+(AdvancedSound., $did($did).sel))
  did -ra $dname 31 $did($did).sel
  did -ran $dname 33 $did($did).seltext
  did -ran $dname 35 $3
  if ($4 == $true) did -c $dname 10
  else did -u $dname 10
  did -c $dname 70 $did($did).sel
}
on *:dialog:ProHLer.DAdvancedSound:sclick:54: {
  dialog -n $dname
  if ($sfile($mircdir, Select a sound`, Select)) {
    did -ran $dname 35 $v1
  }
  dialog -o $dname
}
on *:dialog:ProHLer.DAdvancedSound:close:0: {
  ProHLer.DMain.Reload
  ProHLer.DSettings.Reload
  hdel -w ProHLer.Tmp AdvancedSound.*
  if ($dialog(ProHLer.DSettings)) dialog -o ProHLer.DSettings
}
on *:input:*: {
  if ($1 == .hl) {
    ProHLer.Nicks.Filter
    ProHLer.Chans.Filter
    echo -a $ProHLer.C1(Pro) $+ $ProHLer.C2(HL) $+ $ProHLer.C1(er)
    msg $active $ProHLer.C1(You are highlighted) $ProHLer.C2($bytes($iif(%ProHLer.TotalHls isnum,%ProHLer.TotalHls,0),bd)) $ProHLer.C1(times!) $ProHLer.C2($bytes($iif(%ProHLer.TotalNonHls isnum,%ProHLer.TotalNonHls,0),bd)) $ProHLer.C1(highlights were from users that can't highlight you!)
    msg $active $ProHLer.C1(The last person that highlighted you was) $ProHLer.C2(%ProHLer.Last.Nick) $ProHLer.C1(on) $ProHLer.C2($asctime(%ProHLer.Last.Time)) $ProHLer.C1(That was) $ProHLer.C2($ProHLer.Duration($calc($ctime - %proHLer.Last.Time))) $ProHLer.C1(ago!)
    var %name $gettok($read(ProHLer.NicksOUT.txt,n,1),2,59)
    var %times = $gettok($read(ProHLer.NicksOUT.txt,n,1),3,59)
    msg $active  $ProHLer.C1(The person with the most highlights was $ProHLer.C2($iif(%name,%name,None)) $ProHLer.C1(with) $ProHLer.C2($bytes($iif(%times,%times,0),bd))) $ProHLer.C1(highlights!)
    var %chan $gettok($read(ProHLer.ChansOUT.txt,n,1),2,59)
    var %times = $gettok($read(ProHLer.ChansOUT.txt,n,1),3,59)
    msg $active $ProHLer.C1(The channel with the most highlights was) $ProHLer.C2($iif(%chan,%chan,None)) $ProHLer.C1(with) $ProHLer.C2($bytes($iif(%times,%times,0),bd))) $ProHLer.C1(highlights!)
    /halt
  }
  elseif ($1 == .hls) {
    ProHLer.Nicks.Filter
    ProHLer.Chans.Filter
    echo -a $ProHLer.C1(Pro) $+ $ProHLer.C2(HL) $+ $ProHLer.C1(er)
    msg $active $ProHLer.C1(I'm highlighted) $ProHLer.C2($bytes($iif(%ProHLer.TotalHls isnum,%ProHLer.TotalHls,0),bd)) $ProHLer.C1(times! The last person that highlighted me was) $ProHLer.C2(%ProHLer.Last.Nick)  
    /halt
  }
}
