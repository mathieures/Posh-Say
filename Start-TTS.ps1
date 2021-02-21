function Start-TTS {
    # Function to speak with text-to-speech
    param(
        [Parameter(ValueFromPipeline)]
            [string[]]$Text,
        [ValidateRange(0,2)] # there are only 3 voices available by default
            [int]$Voice = 0,
        [Alias('Alt','A')]
            [switch]$AlternativeVoice, # just a shortcut to `Voice 1`. Overwrites the $Voice parameter.
        [Alias('Speed','R','S')]
            [int]$Rate = 0
    )
    
    BEGIN {
        $sp = New-Object -ComObject SAPI.SpVoice
        $sp.Rate = $Rate
        if($AlternativeVoice) { $sp.Voice = $sp.GetVoices().Item(1) }
        else { $sp.Voice = $sp.GetVoices().Item($Voice) }
    }
    PROCESS {
        if([string]::IsNullOrEmpty($Text))
        {
            do {
                $Text = Read-Host 'Words to say'
                $null = $sp.Speak($Text)
            } until([string]::IsNullOrEmpty($Text))
        }
        else { $null = $sp.Speak($Text) }
    }
}
