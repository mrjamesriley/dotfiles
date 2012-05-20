" Takes AzLyrics and turns formats them for TRshady
function! tony#azlyrics()
  " \r adds a new line, is treated as hitting the enter key
  
  " Turns [Verse 1: Eminem] into [ Verse 1 ] [ Eminem ]
  execute '%s/^\[Verse \(\d\):\(.*\)\]/\[ Verse \1 \] \[ \2 \]\r/g'

  " Turns [Hook: Eminem] into [ Chorus ] [ Eminem ]
  execute '%s/^\[Hook: \(.*\)\]/\[ Chorus \] \[ \1 \]\r/g' 
  " Turns [Hook] into [Chorus]
  execute '%s/^\[Hook\]/\[ Chorus \]\r/g'

  " Turns [Something:] into [ Something ]
  execute '%s/^\[\(.*\):\]/\[ \1 \]\r/g'

endfunction
