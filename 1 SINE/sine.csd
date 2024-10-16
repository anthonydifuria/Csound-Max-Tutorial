<CsoundSynthesizer>
<CsInstruments>
sr      = 44100
; ksmps must be an even divisor of the Max signal vector size
ksmps   = 16
nchnls  = 2
0dbfs = 0.9


; a VCO instrument that reads the pulse width from the pw1 channel
instr 1
  kFreq chnget "freq"
  asig oscili 0.1,kFreq
  outs asig, asig
endin

</CsInstruments>

<CsScore>
; keep csound active for realtime events
; change this to see the bang on score completion
f 0 3600    

i1 0 -1

</CsScore>
</CsoundSynthesizer>


